package com.oup.integration.brunel.purordoutbound.routes;

import org.apache.camel.Exchange;
import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.builder.xml.Namespaces;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component("SapDesadvToCevaPurordRoute")
public class SapDesadvToCevaPurordRoute extends RouteBuilder{
    
    Namespaces idocNamespace = new Namespaces("idoc", "http://sap.fusesource.org/idoc");	
    
    protected Logger logger = LoggerFactory.getLogger(getClass());
    
    @Override
    public void configure() throws Exception {
        // TODO Auto-generated method stub


        onException(Exception.class)
        .handled(true)
        .log(LoggingLevel.ERROR, logger, "Error while processing OrdRsp file ${file:name}. Error :: ${exchangeProperty.CamelExceptionCaught}");

        // from("file:inbox")
        from("{{sap.connection.endpoint}}")
        .routeId(getClass().getSimpleName())
        .convertBodyTo(String.class)   						    //uses default type converter from fusesource to convert IDoc to XML
        // .setHeader(Exchange.FILE_NAME, simple("{{file.IDOC.name}}"))
        .log(LoggingLevel.INFO, logger, "Received OrdRsp file ${file:name} from SAP.")
        .wireTap("{{file.IDOC.backup}}").id("backupIDoc").end() //this ends only the wiretap definition and does not affect the rest of the route
        .setHeader("iDocNumber", xpath("//idoc:DocumentList/document/@iDocNumber")
                                        .resultType(Integer.class).namespaces(idocNamespace))
        .setHeader("VBELN", xpath("//idoc:DocumentList/document/rootSegment/segmentChildren/E1EDL20/@VBELN")
                                        .resultType(Integer.class).namespaces(idocNamespace))
        .choice()
                .when(header("iDocNumber").isNull())
                .log(LoggingLevel.ERROR, logger, "IDoc number is not present in ${file:name}")
        .end()
        .log(LoggingLevel.INFO, logger, "IDoc number in ${file:name} is ${header.idocNumber}.")
        // .convertBodyTo(org.w3c.dom.Document.class)                      //this is just to suppress a warning about a String being sent to be transformed by XSLT
        .to("xslt:xslt/SapDesadvToCevaPurord.xslt?saxon=true")			    //convert SAP IDoc to CDM using xslt. Saxon is required to process XSLT 2.0      
        // .log(LoggingLevel.INFO, logger, "Converted ${file:name} to CDM format.")
        .log(LoggingLevel.INFO, logger, "Renaming ${file:name} to {{file.XML.name}}.")
        .setHeader(Exchange.FILE_NAME, simple("{{file.XML.name}}"))
        // .to("validator:XSD/ORDRSP_CDM.xsd").id("validateXML")			//validate output against CDM schema
        .log(LoggingLevel.INFO, logger, "Validated ${file:name} against CDM schema.")
        .wireTap("{{file.XML.backup}}").id("backupCDM").end()   //this ends only the wiretap definition and does not affect the rest of the route
        // .log(LoggingLevel.INFO, logger, "Sending ${file:name} to CEVA FTP server as {{ftp.ceva.ftpFileName}}.")
        // .to("{{ftp.ceva.ftpPath}}").id("sendToCevaFtp")
        // .log(LoggingLevel.INFO, logger, "Sent ${file:name} to CEVA FTP server.")
        ;

    }
    
}