<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:idoc="http://sap.fusesource.org/idoc" exclude-result-prefixes="xs xsl idoc">
    <xsl:strip-space elements="*" />
    <xsl:output omit-xml-declaration="no" method="xml" indent="yes" />
    <xsl:template match="idoc:DocumentList/document/rootSegment/segmentChildren/E1EDL20">
        <Purord>
            <InterchangeSection>
                <InterFaceID>S-010.00</InterFaceID>
                <InterFaceName>PURORD</InterFaceName>
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
                    <DocNameVersion>MIG S-010</DocNameVersion>
                    <SchemaVersion>18613</SchemaVersion>
                    <MappingVersion>3.5</MappingVersion>
                    <MappingDate>20171013</MappingDate>
                    <MessageOwner>CEVA</MessageOwner>
                </InterfaceReferences>
            </InterchangeSection>

            <OrderSection>
                <ActionCode>NEW</ActionCode>
                <OrderID>
                    <xsl:value-of select="@VBELN" />
                </OrderID>
                <xsl:if test="segmentChildren/E1EDL24[@VGBEL != ''][1]">
                    <OriginalOrderReference>
                        <xsl:value-of select="segmentChildren/E1EDL24[@VGBEL != ''][1]/@VGBEL" />
                    </OriginalOrderReference>
                </xsl:if>
                <CarrierName>CEVA</CarrierName>
                <CarrierCode>CEVA</CarrierCode>
                <ServiceLevel>STANDARD</ServiceLevel>
                <xsl:if test="segmentChildren/E1EDT13[@NTEND != ''][1]">
                    <ExpectedReceiptDate>
                        <xsl:value-of select="format-date(xs:date(substring-before(segmentChildren/E1EDT13[@NTEND != ''][1]/@NTEND, 'T')), '[Y0001][M01][D01]')" />
                    </ExpectedReceiptDate>
                </xsl:if>
                <IncoTerm>
                    <xsl:value-of select="@INCO1" />
                </IncoTerm>
                <xsl:if test="@INCO2">
                    <IncoTermReference>
                        <xsl:value-of select="@INCO2" />
                    </IncoTermReference>
                </xsl:if>
                <xsl:if test="segmentChildren/E1EDL24[@LGORT != ''][1]">
                    <OrganizationReference>
                        <xsl:value-of select="segmentChildren/E1EDL24[@LGORT != ''][1]/@LGORT" />
                    </OrganizationReference>
                </xsl:if>
                <WareHouseOrderType></WareHouseOrderType>
                <!-- section for Bill of Lading TBC 
            <DeliveryNoteText>
                <Qualifier>Value to be confirmed</Qualifier>
                <Value>BOL value</Value>
            </DeliveryNoteText>
                ***** OR *****
            <InvoiceText>
                <Qualifier>String</Qualifier>
                <Value>String</Value>
            </InvoiceText>
            -->

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
                    <Name2 />
                    <Name3 />
                    <Address1>Heathrow Gateway</Address1>
                    <Address2>Godfrey Way</Address2>
                    <Address3 />
                    <City>Hounslow</City>
                    <PostalCode>TW4 5SY</PostalCode>
                    <CountryCode>GB</CountryCode>
                </ToLocation>
                <OrderLine>
                    <ActionCode>NEW</ActionCode>
                    <LineId>6</LineId>
                    <ProductId>4549337285248</ProductId>
                    <Description>SOLID OAK BED SINGLE</Description>
                    <UOM>EA</UOM>
                    <QuantityPerUOM>1</QuantityPerUOM>
                    <QuantityOrdered>33</QuantityOrdered>
                    <QuantityExpected>33</QuantityExpected>
                    <Status>A</Status>
                </OrderLine>
                <OrderLine>
                    <ActionCode>NEW</ActionCode>
                    <LineId>7</LineId>
                    <OriginalLineId>7</OriginalLineId>
                    <ProductId>4549337285262</ProductId>
                    <Description>SOLID OAK BED DOUBLE</Description>
                    <UOM>EA</UOM>
                    <QuantityPerUOM>1</QuantityPerUOM>
                    <QuantityOrdered>41</QuantityOrdered>
                    <QuantityExpected>41</QuantityExpected>
                </OrderLine>
            </OrderSection>
        </Purord>
    </xsl:template>
</xsl:stylesheet>