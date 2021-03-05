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
                <xsl:if test="segmentChildren/E1EDL21[@LFART != ''][1]">
                    <WareHouseOrderType>
                        <xsl:value-of select="segmentChildren/E1EDL21[@LFART != ''][1]/@LFART" />
                    </WareHouseOrderType>
                </xsl:if>
               
                <FromLocation>
                    <xsl:if test="segmentChildren/E1EDL24[@WERKS != ''][1]">
                        <LocationID><xsl:value-of select="segmentChildren/E1EDL24[@WERKS != ''][1]/@WERKS"/></LocationID>
                    </xsl:if>
                    <LocationQualifier>SF</LocationQualifier>
                    <xsl:if test="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']">
                        <Name1><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME1"/></Name1>
                        <xsl:if test="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME2 != ''">
                            <Name2><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME2"/></Name2>
                        </xsl:if>
                        <xsl:if test="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME3 != '' ">
                            <Name3><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME3"/></Name3>
                        </xsl:if>
                        <Address1><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@STREET1"/></Address1>
                        <xsl:if test="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME2 != ''">
                            <Address2><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@STREET2"/></Address2>
                        </xsl:if>
                        <xsl:if test="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@NAME3 != '' ">
                            <Address3><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@STREET3"/></Address3>
                        </xsl:if>
                        <City><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@CITY1"/></City>
                        <PostalCode><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@POSTL_COD1"/></PostalCode>
                        <CountryCode><xsl:value-of select="segmentChildren/E1ADRM1[@PARTNER_Q = 'LF']/@COUNTRY1"/></CountryCode>
                    </xsl:if>
                </FromLocation>
                <ToLocation>
                </ToLocation>
                <xsl:for-each select="segmentChildren/E1EDL24">
                    <OrderLine>
                        <ActionCode>NEW</ActionCode>
                        <LineId><xsl:value-of select="@POSNR"/></LineId>
                        <OriginalLineId><xsl:value-of select="@VGPOS"/></OriginalLineId>
                        <ProductId><xsl:value-of select="@MATNR"/></ProductId>
                        <Description><xsl:value-of select="@ARKTX"/></Description>
                        <UOM><xsl:value-of select="if(@VRKME = 'CPY') then 'EA' else ()"/></UOM>
                        <QuantityPerUOM>1</QuantityPerUOM>
                        <QuantityExpected><xsl:value-of select="@LFIMG"/></QuantityExpected>
                    </OrderLine>
                </xsl:for-each>
            </OrderSection>
        </Purord>
    </xsl:template>
</xsl:stylesheet>