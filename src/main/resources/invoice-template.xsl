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
                    <fo:region-body margin-top="4.5cm"/> <fo:region-before extent="4cm"/> <fo:region-after extent="2cm"/> </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4-portrait">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="55%"/> <fo:table-column column-width="45%"/> <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell padding-right="10pt" display-align="before">
                                    <fo:block text-align="left">
                                        <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/mañana/logo.PNG')" content-height="2cm" content-width="scale-to-fit"/>
                                        <fo:block font-size="11pt" font-weight="bold" space-before="0.3cm">
                                            <xsl:value-of select="/factura/infoTributaria/razonSocial"/>
                                        </fo:block>
                                        <fo:block font-size="9pt" space-before="0.1cm">
                                            <fo:inline font-weight="bold">Dir Matriz:</fo:inline> <xsl:value-of select="/factura/infoTributaria/dirMatriz"/>
                                        </fo:block>
                                        <xsl:if test="/factura/infoTributaria/dirSucursal != ''">
                                            <fo:block font-size="9pt">
                                                <fo:inline font-weight="bold">Dir Sucursal:</fo:inline> <xsl:value-of select="/factura/infoTributaria/dirSucursal"/>
                                            </fo:block>
                                        </xsl:if>
                                        <xsl:if test="/factura/infoTributaria/contribuyenteEspecial != ''">
                                            <fo:block font-size="9pt">
                                                <fo:inline font-weight="bold">Contribuyente Especial Nro:</fo:inline> <xsl:value-of select="/factura/infoTributaria/contribuyenteEspecial"/>
                                            </fo:block>
                                        </xsl:if>
                                        <fo:block font-size="9pt">
                                            <fo:inline font-weight="bold">OBLIGADO A LLEVAR CONTABILIDAD:</fo:inline> <xsl:value-of select="/factura/infoFactura/obligadoContabilidad"/>
                                        </fo:block>
                                    </fo:block>
                                </fo:table-cell>

                                <fo:table-cell border="0.5pt solid black" padding="5pt" display-align="before">
                                    <fo:block font-size="9pt">
                                        <fo:block text-align="center" font-size="10pt" font-weight="bold" space-after="0.1cm">R.U.C.: <xsl:value-of select="/factura/infoTributaria/ruc"/></fo:block>
                                        <fo:block font-weight="bold">FACTURA No.</fo:block>
                                        <fo:block space-after="0.1cm"><xsl:value-of select="/factura/infoTributaria/estab"/>-<xsl:value-of select="/factura/infoTributaria/ptoEmi"/>-<xsl:value-of select="/factura/infoTributaria/secuencial"/></fo:block>
                                        <fo:block font-weight="bold">NÚMERO DE AUTORIZACIÓN</fo:block>
                                        <fo:block space-after="0.1cm"><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                                        <fo:block font-weight="bold">AMBIENTE:</fo:block>
                                        <fo:block space-after="0.1cm"><xsl:value-of select="/factura/infoTributaria/ambiente"/></fo:block>
                                        <fo:block font-weight="bold">EMISIÓN:</fo:block>
                                        <fo:block space-after="0.1cm"><xsl:value-of select="/factura/infoTributaria/tipoEmision"/></fo:block>
                                        <fo:block font-weight="bold">CLAVE DE ACCESO:</fo:block>
                                        <fo:block font-family="Code128b-subset" font-size="12pt" text-align="center"><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                                        <fo:block font-size="8pt" text-align="center"><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:block space-after="0.5cm"/>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-size="8pt">
                        <fo:inline>Página </fo:inline><fo:page-number/><fo:inline> de </fo:inline><fo:page-sequence-last-page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">

                    <fo:block font-size="9pt" space-after="0.8cm" border="0.5pt solid black" padding="5pt">
                        <fo:table table-layout="fixed" width="100%">
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell padding="2pt"><fo:block font-weight="bold">Razón Social / Nombres y Apellidos:</fo:block></fo:table-cell>
                                    <fo:table-cell padding="2pt"><fo:block><xsl:value-of select="/factura/infoFactura/razonSocialComprador"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="2pt"><fo:block font-weight="bold">Identificación:</fo:block></fo:table-cell>
                                    <fo:table-cell padding="2pt"><fo:block><xsl:value-of select="/factura/infoFactura/identificacionComprador"/></fo:block></fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding="2pt"><fo:block font-weight="bold">Fecha de Emisión:</fo:block></fo:table-cell>
                                    <fo:table-cell padding="2pt"><fo:block><xsl:value-of select="/factura/infoFactura/fechaEmision"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="2pt"><fo:block font-weight="bold">Guía de Remisión:</fo:block></fo:table-cell>
                                    <fo:table-cell padding="2pt"><fo:block><xsl:value-of select="/factura/infoFactura/guiaRemision"/></fo:block></fo:table-cell>
                                </fo:table-row>
                                <xsl:if test="/factura/infoFactura/dirComprador != ''">
                                    <fo:table-row>
                                        <fo:table-cell padding="2pt"><fo:block font-weight="bold">Dirección:</fo:block></fo:table-cell>
                                        <fo:table-cell padding="2pt" number-columns-spanned="3"><fo:block><xsl:value-of select="/factura/infoFactura/dirComprador"/></fo:block></fo:table-cell>
                                    </fo:table-row>
                                </xsl:if>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block space-after="0.5cm"/>
                    <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
                        <fo:table-column column-width="10%"/> <fo:table-column column-width="15%"/> <fo:table-column column-width="15%"/> <fo:table-column column-width="30%"/> <fo:table-column column-width="10%"/> <fo:table-column column-width="10%"/> <fo:table-column column-width="10%"/> <fo:table-header>
                            <fo:table-row font-weight="bold" background-color="#DCDCDC">
                                <fo:table-cell padding="5pt" border="0.5pt solid black" text-align="center"><fo:block>Cant.</fo:block></fo:table-cell>
                                <fo:table-cell padding="5pt" border="0.5pt solid black" text-align="center"><fo:block>Cod. Principal</fo:block></fo:table-cell>
                                <fo:table-cell padding="5pt" border="0.5pt solid black" text-align="center"><fo:block>Cod. Auxiliar</fo:block></fo:table-cell>
                                <fo:table-cell padding="5pt" border="0.5pt solid black" text-align="center"><fo:block>Descripción</fo:block></fo:table-cell>
                                <fo:table-cell padding="5pt" text-align="right" border="0.5pt solid black"><fo:block>P. Unit.</fo:block></fo:table-cell>
                                <fo:table-cell padding="5pt" text-align="right" border="0.5pt solid black"><fo:block>Desc.</fo:block></fo:table-cell>
                                <fo:table-cell padding="5pt" text-align="right" border="0.5pt solid black"><fo:block>Total</fo:block></fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:for-each select="/factura/detalles/detalle">
                                <fo:table-row>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black" text-align="center"><fo:block><xsl:value-of select="cantidad"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black" text-align="center"><fo:block><xsl:value-of select="codigoPrincipal"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black" text-align="center"><fo:block><xsl:value-of select="codigoAuxiliar"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block><xsl:value-of select="descripcion"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="precioUnitario"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="descuento"/></fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="precioTotalSinImpuesto"/></fo:block></fo:table-cell>
                                </fo:table-row>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>

                    <fo:block space-after="1cm"/>

                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="60%"/> <fo:table-column column-width="40%"/> <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell padding-right="10pt" display-align="before">
                                    <fo:block border="0.5pt solid black" padding="5pt">
                                        <fo:block font-weight="bold" space-after="0.2cm" font-size="10pt">INFORMACIÓN ADICIONAL</fo:block>
                                        <fo:list-block provisional-distance-between-starts="1cm" font-size="9pt">
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
                                    </fo:block>
                                </fo:table-cell>

                                <fo:table-cell display-align="before">
                                    <fo:table table-layout="fixed" width="100%" border-collapse="collapse">
                                        <fo:table-column column-width="60%"/>
                                        <fo:table-column column-width="40%"/>
                                        <fo:table-body font-size="9pt">
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>SUBTOTAL 15%</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block>
                                                    <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='2'][codigoPorcentaje='4']/valor"/>
                                                </fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>SUBTOTAL 0%</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block>
                                                    <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='2'][codigoPorcentaje='0']/valor"/>
                                                </fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>SUBTOTAL no objeto de IVA</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block>
                                                    <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='2'][codigoPorcentaje='6']/valor"/>
                                                </fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>SUBTOTAL Exento de IVA</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block>
                                                    <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='2'][codigoPorcentaje='7']/valor"/>
                                                </fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>SUBTOTAL SIN IMPUESTOS</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>DESCUENTO</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="/factura/infoFactura/totalDescuento"/></fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <xsl:if test="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='3']">
                                                <fo:table-row>
                                                    <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>ICE</fo:block></fo:table-cell>
                                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='3']/valor"/></fo:block></fo:table-cell>
                                                </fo:table-row>
                                            </xsl:if>
                                            <fo:table-row>
                                                <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>IVA 15%</fo:block></fo:table-cell>
                                                <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block>
                                                    <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='2'][codigoPorcentaje='2']/valor"/>
                                                </fo:block></fo:table-cell>
                                            </fo:table-row>
                                            <xsl:if test="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='5']">
                                                <fo:table-row>
                                                    <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>IRBPNR</fo:block></fo:table-cell>
                                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto[codigo='5']/valor"/></fo:block></fo:table-cell>
                                                </fo:table-row>
                                            </xsl:if>
                                            <xsl:if test="/factura/infoFactura/propina != 0">
                                                <fo:table-row>
                                                    <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>PROPINA</fo:block></fo:table-cell>
                                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="/factura/infoFactura/propina"/></fo:block></fo:table-cell>
                                                </fo:table-row>
                                            </xsl:if>
                                            <fo:table-row font-weight="bold" background-color="#F0F0F0">
                                                <fo:table-cell padding="5pt" border="0.5pt solid black"><fo:block>VALOR TOTAL</fo:block></fo:table-cell>
                                                <fo:table-cell padding="5pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="/factura/infoFactura/importeTotal"/></fo:block></fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>

                    <fo:block space-before="1cm"/>

                    <xsl:if test="/factura/infoFactura/pagos/pago">
                        <fo:block font-weight="bold" font-size="10pt" space-after="0.2cm">Forma de Pago</fo:block>
                        <fo:table table-layout="fixed" width="40%" border-collapse="collapse">
                            <fo:table-column column-width="70%"/>
                            <fo:table-column column-width="30%"/>
                            <fo:table-header>
                                <fo:table-row font-weight="bold" background-color="#DCDCDC">
                                    <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block>Descripción</fo:block></fo:table-cell>
                                    <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block>Valor</fo:block></fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <fo:table-body font-size="9pt">
                                <xsl:for-each select="/factura/infoFactura/pagos/pago">
                                    <fo:table-row>
                                        <fo:table-cell padding="3pt" border="0.5pt solid black"><fo:block><xsl:value-of select="formaPago"/></fo:block></fo:table-cell>
                                        <fo:table-cell padding="3pt" text-align="right" border="0.5pt solid black"><fo:block><xsl:value-of select="total"/></fo:block></fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </xsl:if>

                    <fo:block space-before="0.8cm" font-size="8pt" text-align="center">
                        Para consultas o requerimientos puede contactarse a nuestro Centro de Atención a nivel nacional al 72 01200.
                        Si su reclamo NO ha sido resuelto por el prestador, ingrese su queja a través del formulario respectivo en www.gob.ec
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>