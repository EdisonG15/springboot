<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrait"
                                       page-height="29.7cm" page-width="21cm"
                                       margin-top="1cm" margin-bottom="1cm"
                                       margin-left="1.5cm" margin-right="1.5cm">
                    <fo:region-body margin-top="3cm"/>
                    <fo:region-before extent="2.5cm"/>
                    <fo:region-after extent="1.5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4-portrait">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-size="12pt" font-weight="bold">
                        <fo:block>
                            <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/mañana/logo.PNG')" content-height="2cm" content-width="scale-to-fit"/>
                            </fo:block>
                        <fo:block space-before="0.5cm">
                            <xsl:value-of select="/factura/infoTributaria/razonSocial"/>
                        </fo:block>
                        <fo:block font-size="10pt">
                            RUC: <xsl:value-of select="/factura/infoTributaria/ruc"/>
                        </fo:block>
                        <fo:block font-size="10pt">
                            Dirección: <xsl:value-of select="/factura/infoTributaria/dirMatriz"/>
                        </fo:block>
                    </fo:block>
                    <fo:block space-after="1cm"/>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-size="8pt">
                        Página <fo:page-number/>
                        </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="14pt" font-weight="bold" text-align="center" space-after="1cm">
                        FACTURA NÚMERO: <xsl:value-of select="/factura/infoTributaria/estab"/>-<xsl:value-of select="/factura/infoTributaria/ptoEmi"/>-<xsl:value-of select="/factura/infoTributaria/secuencial"/>
                    </fo:block>

                    <fo:block font-size="10pt" space-after="0.5cm">
                        <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="50%"/>
                            <fo:table-column column-width="50%"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell><fo:block>Fecha Emisión: <xsl:value-of select="/factura/infoFactura/fechaEmision"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block>RUC/CI Cliente: <xsl:value-of select="/factura/infoFactura/identificacionComprador"/></fo:block></fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell><fo:block>Razón Social Cliente: <xsl:value-of select="/factura/infoFactura/razonSocialComprador"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block>Dirección: <xsl:value-of select="/factura/infoFactura/dirComprador"/></fo:block></fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block space-after="0.5cm"/>

                    <fo:table table-layout="fixed" width="100%" border-collapse="separate">
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="40%"/>
                        <fo:table-column column-width="15%"/>
                        <fo:table-column column-width="15%"/>
                        <fo:table-column column-width="20%"/>
                        <fo:table-header>
                            <fo:table-row font-weight="bold" background-color="#DCDCDC">
                                <fo:table-cell><fo:block>Cant.</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block>Descripción</fo:block></fo:table-cell>
                                <fo:table-cell text-align="right"><fo:block>P. Unit.</fo:block></fo:table-cell>
                                <fo:table-cell text-align="right"><fo:block>Desc.</fo:block></fo:table-cell>
                                <fo:table-cell text-align="right"><fo:block>Total</fo:block></fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:for-each select="/factura/detalles/detalle">
                                <fo:table-row>
                                    <fo:table-cell><fo:block><xsl:value-of select="cantidad"/></fo:block></fo:table-cell>
                                    <fo:table-cell><fo:block><xsl:value-of select="descripcion"/></fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block><xsl:value-of select="precioUnitario"/></fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block><xsl:value-of select="descuento"/></fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block><xsl:value-of select="precioTotalSinImpuesto"/></fo:block></fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block space-after="0.5cm"/>

                    <fo:block text-align="right" font-size="10pt">
                        <fo:table table-layout="fixed" width="30%" float="right">
                            <fo:table-column column-width="50%"/>
                            <fo:table-column column-width="50%"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell><fo:block>Subtotal:</fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block><xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block></fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell><fo:block>Descuento:</fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block><xsl:value-of select="/factura/infoFactura/totalDescuento"/></fo:block></fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell><fo:block>IVA 12%:</fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block>
                                        <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='2'][codigoPorcentaje='2']/valor"/>
                                    </fo:block></fo:table-cell>
                                </fo:table-row>
                                <fo:table-row font-weight="bold">
                                    <fo:table-cell><fo:block>Total:</fo:block></fo:table-cell>
                                    <fo:table-cell text-align="right"><fo:block><xsl:value-of select="/factura/infoFactura/importeTotal"/></fo:block></fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block clear="right" space-after="1cm"/>

                    <xsl:if test="/factura/infoAdicional">
                        <fo:block font-weight="bold" space-after="0.2cm">Información Adicional:</fo:block>
                        <fo:list-block provisional-distance-between-starts="1cm">
                            <xsl:for-each select="/factura/infoAdicional/campoAdicional">
                                <fo:list-item>
                                    <fo:list-item-label end-indent="label-end()">
                                        <fo:block><xsl:value-of select="@nombre"/>:</fo:block>
                                    </fo:list-item-label>
                                    <fo:list-item-body start-indent="body-start()">
                                        <fo:block><xsl:value-of select="."/></fo:block>
                                    </fo:list-item-body>
                                </fo:list-item>
                            </xsl:for-each>
                        </fo:list-block>
                    </xsl:if>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>