package com.oup.integration.brunel.purord_insdes_outbound.routes;

import org.apache.camel.Exchange;
import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.builder.xml.Namespaces;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component("SapDesadvToCevaPurordInsdesRoute")
public class SapDesadvToCevaPurordInsdesRoute extends RouteBuilder{
    
    Namespaces idocNamespace = new Namespaces("idoc", "http://sap.fusesource.org/idoc");	
    
    protected Logger logger = LoggerFactory.getLogger(getClass());
    
    @Override
    public void configure() throws Exception {
        // TODO Auto-generated method stub


        onException(Exception.class)
        .handled(true)
        .log(LoggingLevel.ERROR, logger, "Error while processing OrdRsp file ${file:name}. Error :: ${exchangeProperty.CamelExceptionCaught}");

        from("{{sap.connection.endpoint}}")
        .routeId(getClass().getSimpleName())
        .convertBodyTo(String.class)
        .setHeader("iDocNumber", xpath("//idoc:DocumentList/document/@iDocNumber")
                                        .resultType(Integer.class).namespaces(idocNamespace))
        .setHeader("VBELN", xpath("//idoc:DocumentList/document/rootSegment/segmentChildren/E1EDL20/@VBELN")
                                        .resultType(Integer.class).namespaces(idocNamespace))
        .setHeader("E1EDL21_LFART", xpath("//idoc:DocumentList/document/rootSegment/segmentChildren/E1EDL20/segmentChildren/E1EDL21/@LFART")
                                        .resultType(String.class).namespaces(idocNamespace))
        .setHeader("plantCode", xpath("//idoc:DocumentList/document/rootSegment/segmentChildren/E1EDL20/segmentChildren/E1EDL24[@WERKS != ''][1]/@WERKS")
                                        .resultType(Integer.class).namespaces(idocNamespace))
        .choice()
            .when(simple("${header.E1EDL21_LFART} in 'EL,LR'"))
                .setHeader("CevaDeliveryType", constant("PURORD"))
            .when(simple("${header.E1EDL21_LFART} in 'LF,UL,ZLF,LB'"))
                .setHeader("CevaDeliveryType", constant("INSDES"))
            .otherwise()
                .setHeader("CevaDeliveryType", constant("UNKNOWN"))
        .end()
        .log("${headers}")
        .setHeader(Exchange.FILE_NAME, simple("{{file.IDOC.name}}"))
        .wireTap("{{file.IDOC.backup}}").id("backupIDOC").end()
        .log(LoggingLevel.INFO, logger, "Received DESADV file ${file:name} from SAP. IDoc number in the file is ${header.idocNumber}.")
        
        .convertBodyTo(org.w3c.dom.Document.class)                      //this is just to suppress a warning about a String being sent to be transformed by XSLT
        
        .toD("xslt:xslt/DESADV_to_${header.CevaDeliveryType}.xslt")			    //convert SAP IDoc to CDM using xslt. Saxon is required to process XSLT 2.0      
        .log(LoggingLevel.INFO, logger, "Converted ${file:name} to ${header.CevaDeliveryType} format. Renaming ${file:name} to {{file.XML.name}}.")
        
        .setHeader(Exchange.FILE_NAME, simple("{{file.XML.name}}"))
        .wireTap("{{file.XML.backup}}").id("backupXML").end()   //this ends only the wiretap definition and does not affect the rest of the route
        .log("{{ftp.ceva.ftpPath}}");

    }
    
}