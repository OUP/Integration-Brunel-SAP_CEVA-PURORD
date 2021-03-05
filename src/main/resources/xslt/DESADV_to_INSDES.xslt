<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idoc="http://sap.fusesource.org/idoc" exclude-result-prefixes="xs xsl idoc">
    <xsl:strip-space elements="*" />
    <xsl:output omit-xml-declaration="no" method="xml" indent="yes" />
    <xsl:template match="idoc:DocumentList/document/rootSegment/segmentChildren/E1EDL20">
        <Insdes>
            <InterchangeSection>
                <InterFaceID>S-020.00</InterFaceID>
                <InterFaceName>INSDES</InterFaceName>
                <InterChangeID>64284794</InterChangeID>
                <TransferDTstamp>21210221104500</TransferDTstamp>
                <SenderData>
                    <RoutingID1>OUP-7430</RoutingID1>
                    <RoutingID2>IN-7430</RoutingID2>
                    <RoutingID3>TEST</RoutingID3>
                </SenderData>
                <ReceiverData>
                    <RoutingID1>CEV123</RoutingID1>
                    <RoutingID2>IN-cal-01</RoutingID2>
                    <RoutingID3>TEST</RoutingID3>
                </ReceiverData>
                <InterfaceReferences>
                    <DocNameVersion>MIG S-020</DocNameVersion>
                    <SchemaVersion>18613</SchemaVersion>
                    <MappingVersion>3.5</MappingVersion>
                    <MappingDate>20171013</MappingDate>
                    <MessageOwner>CEVA</MessageOwner>
                </InterfaceReferences>
            </InterchangeSection>
            <OrderSection>
                <ActionCode>NEW</ActionCode>
                <OrderID>182397578</OrderID>
                <OriginalOrderReference>182397578</OriginalOrderReference>
                <WareHouseOrderType>DIR</WareHouseOrderType>
                <ModeOfTransport></ModeOfTransport> <!-- to distinguish air freight -->
                <CarrierName>CEVA</CarrierName>
                <CarrierCode>CEVA</CarrierCode>
                <ServiceLevel>STANDARD</ServiceLevel>
                <ExpectedShipDate>20170126101407</ExpectedShipDate>
                <ExpectedReceiptDate>20170126101407</ExpectedReceiptDate>
                <IncoTerm>DDP</IncoTerm>
                <IncoTermReference>Erith</IncoTermReference>
                <FromLocation>
                    <LocationID>NL-ROS-05</LocationID>
                    <LocationQualifier>SF</LocationQualifier>
                    <Name1>CEVA WAREHOUSE</Name1>
                    <Name2>CEVA WAREHOUSE</Name2>
                    <Name3>CEVA WAREHOUSE</Name3>
                    <Address1>BOEKERMAN 5</Address1>
                    <Address2>OUD-GASTEL</Address2>
                    <Address3>OUD-GASTEL</Address3>
                    <City>ROOSENDAAL</City>
                    <PostalCode>4751 XK</PostalCode>
                    <CountryCode>NL</CountryCode>
                </FromLocation>
                <ToLocation>
                    <LocationID>NL-ROS-06</LocationID>
                    <LocationQualifier>ST</LocationQualifier>
                    <Name1>CEVA Freight (UK) Limited</Name1>
                    <Name2/>
                    <Name3/>
                    <Address1>Heathrow Gateway</Address1>
                    <Address2>Godfrey Way</Address2>
                    <Address3/>
                    <City>Hounslow</City>
                    <PostalCode>TW4 5SY</PostalCode>
                    <CountryCode>GB</CountryCode>
                </ToLocation>
                <!-- ***** billing details node to be confirmed	either:	
                <SpecialLocation>  
                    <LocationQualifier>UC</LocationQualifier>
                    <Name1>BUYER TO PICKUP THE GOODS FROM THE SHOP</Name1>
                    <Address1>BUYER ADDRESS 1</Address1>
                    <Address2>BUYER ADDRESS 2</Address2>
                    <Address3>BUYER ADDRESS 3</Address3>
                    <City>BUYER CITY</City>
                    <PostalCode>CODE</PostalCode>
                    <CountryCode>GB</CountryCode>
                </SpecialLocation>
                
                ****** OR *****
                
                <DeliveryNoteText>
                    <Qualifier>To be confirmed by CEVA</Qualifier>
                    <Value>Address details in full. 180 CHAR max</Value>
                </DeliveryNoteText> 
                ***** -->
                <OrderLine>
                    <ActionCode>NEW</ActionCode>
                    <LineId>10</LineId>
                    <OriginalLineId>10</OriginalLineId>
                    <ProductId>4549337263178</ProductId>
                    <Description>PROJECT 5E EXP 1 SB</Description>
                    <UOM>EA</UOM>
                    <QuantityPerUOM>1</QuantityPerUOM>
                    <QuantityExpected>0000001</QuantityExpected>
                </OrderLine>
            </OrderSection>
        </Insdes>
    </xsl:template>
</xsl:stylesheet>