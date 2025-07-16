<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="factura"
          page-height="29.7cm" page-width="21cm" margin="1.5cm"> <fo:region-body margin-top="0.5cm" margin-bottom="0.5cm"/> </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="factura">
        <fo:flow flow-name="xsl-region-body">

          <fo:table width="100%" table-layout="fixed" border="0.5pt solid #888888" margin-bottom="15pt" space-after="15pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell border-right="0.5pt solid #888888" padding="10pt" display-align="before">
                  <fo:block text-align="center" padding-bottom="8pt">
                    <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/manana/logo.png')" content-width="150px"/>
                  </fo:block>
                  <fo:block font-weight="bold" font-size="11pt" margin-top="8pt" text-align="center">MEGADATOS SA</fo:block>
                  <fo:block font-size="9pt" margin-top="3pt" line-height="1.4">
                    Dir Matriz: <xsl:value-of select="/factura/infoTributaria/dirMatriz"/>
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.4">
                    Dir Sucursal: <xsl:value-of select="/factura/infoFactura/dirEstablecimiento"/>
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.4">
                    Contribuyente Especial Nro: SI
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.4">
                    OBLIGADO A LLEVAR CONTABILIDAD: <xsl:value-of select="/factura/infoFactura/obligadoContabilidad"/>
                  </fo:block>
                </fo:table-cell>

                <fo:table-cell padding="10pt" display-align="before">
                  <fo:block font-weight="bold" font-size="10pt" line-height="1.4">R.U.C.: <xsl:value-of select="/factura/infoTributaria/ruc"/></fo:block>
                  <fo:block font-weight="bold" font-size="12pt" margin-top="8pt" text-align="center">FACTURA</fo:block>
                  <fo:block font-size="10pt" margin-top="5pt" line-height="1.4">
                    No.: <xsl:value-of select="/factura/infoTributaria/estab"/>-
                    <xsl:value-of select="/factura/infoTributaria/ptoEmi"/>-
                    <xsl:value-of select="/factura/infoTributaria/secuencial"/>
                  </fo:block>
                  <fo:block margin-top="8pt" font-size="9pt" font-weight="bold">NÚMERO DE AUTORIZACIÓN</fo:block>
                  <fo:block font-size="8pt" line-height="1.4" wrap-option="wrap">
                    <xsl:value-of select="/factura/infoTributaria/claveAcceso"/>
                  </fo:block>
                  <fo:block margin-top="8pt" font-size="9pt" line-height="1.4">
                    AMBIENTE: <xsl:value-of select="/factura/infoTributaria/ambiente"/>
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.4">
                    EMISIÓN: NORMAL
                  </fo:block>
                  <fo:block margin-top="8pt" font-size="9pt" font-weight="bold">CLAVE DE ACCESO:</fo:block>
                  <fo:block text-align="center" margin-top="5pt">
                    <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/manana/codigo_barras.png')" content-width="70%" content-height="1.5cm"/>
                    <fo:block font-size="8pt" wrap-option="wrap"><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <fo:table width="100%" table-layout="fixed" font-size="9pt" border="0.5pt solid #888888" padding="5pt" margin-top="15pt" space-after="15pt">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell padding-right="10pt">
                  <fo:block font-weight="bold" line-height="1.4">Razón Social / Nombres y Apellidos: <xsl:value-of select="/factura/infoFactura/razonSocialComprador"/></fo:block>
                  <fo:block line-height="1.4">Identificación: <xsl:value-of select="/factura/infoFactura/identificacionComprador"/></fo:block>
                  <fo:block line-height="1.4">Fecha de Emisión: <xsl:value-of select="/factura/infoFactura/fechaEmision"/></fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block line-height="1.4">Guía de Remisión:</fo:block>
                  <fo:block/>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <fo:table table-layout="fixed" width="100%" border="0.5pt solid #888888" font-size="9pt" margin-top="15pt" space-after="15pt">
            <fo:table-column column-width="12%"/> <fo:table-column column-width="12%"/> <fo:table-column column-width="8%"/>  <fo:table-column column-width="38%"/> <fo:table-column column-width="10%"/> <fo:table-column column-width="10%"/> <fo:table-column column-width="10%"/> <fo:table-header>
              <fo:table-row font-weight="bold" background-color="#F0F0F0"> <fo:table-cell border="0.5pt solid #888888" display-align="center" number-columns-spanned="4" padding="5pt"><fo:block/></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" number-columns-spanned="3" padding="5pt"><fo:block>Detalle</fo:block></fo:table-cell>
              </fo:table-row>
              <fo:table-row font-weight="bold" background-color="#F0F0F0">
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Cod. Principal</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Cod. Auxiliar</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Cant.</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Descripción</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Precio Unitario</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Descuento</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #888888" display-align="center" padding="5pt"><fo:block>Total</fo:block></fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-body>
              <xsl:for-each select="/factura/detalles/detalle">
                <fo:table-row>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt"><fo:block><xsl:value-of select="codigoPrincipal"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt"><fo:block/></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt" text-align="right"><fo:block><xsl:value-of select="cantidad"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt"><fo:block><xsl:value-of select="descripcion"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt" text-align="right"><fo:block><xsl:value-of select="precioUnitario"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt" text-align="right"><fo:block><xsl:value-of select="descuento"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #DDDDDD" padding="5pt" text-align="right"><fo:block><xsl:value-of select="precioTotalSinImpuesto"/></fo:block></fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>

          <fo:table width="100%" table-layout="fixed" font-size="9pt" margin-top="15pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell padding-right="15pt" display-align="before">
                  <fo:block font-weight="bold" margin-bottom="5pt" font-size="10pt">INFORMACIÓN ADICIONAL</fo:block>
                  <fo:table width="100%" border="0.5pt solid #888888" padding="8pt" space-after="10pt">
                    <fo:table-column column-width="100%"/>
                    <fo:table-body>
                      <fo:table-row>
                        <fo:table-cell>
                          <fo:block line-height="1.4">Login: EN-PDQU-GAROFALO01</fo:block>
                          <fo:block line-height="1.4">Consumo: DEL 01 JULIO 2025 AL 31 JULIO 2025</fo:block>
                          <fo:block line-height="1.4">Ciudad: QUITO</fo:block>
                          <fo:block line-height="1.4">Dirección: CALLE A Y CALLE C</fo:block>
                          <fo:block line-height="1.4">Teléfono: 0995183170</fo:block>
                          <fo:block line-height="1.4">Email: garofaloedison@gmail.com</fo:block>
                          <fo:block line-height="1.4">Contrato: 001-001-0097457</fo:block>
                          <fo:block line-height="1.4">Fecha Máxima de pago: 11/07/2025</fo:block>
                          <fo:block line-height="1.4">GRAN CONTRIBUYENTE: NAC-OCTO0C21-00001122-E</fo:block>
                        </fo:table-cell>
                      </fo:table-row>
                    </fo:table-body>
                  </fo:table>

                  <fo:block font-weight="bold" font-size="10pt" margin-top="10pt" margin-bottom="5pt">Forma de Pago:</fo:block>
                  <fo:table width="100%" border="0.5pt solid #888888" padding="8pt">
                    <fo:table-column column-width="100%"/>
                    <fo:table-body>
                      <xsl:for-each select="/factura/infoFactura/pagos/pago">
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block font-size="9pt" line-height="1.4"><xsl:value-of select="formaPago"/> : <xsl:value-of select="total"/></fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </xsl:for-each>
                    </fo:table-body>
                  </fo:table>
                </fo:table-cell>

                <fo:table-cell display-align="before">
                  <fo:table width="100%" border="0.5pt solid #888888" padding="8pt">
                    <fo:table-column column-width="70%"/>
                    <fo:table-column column-width="30%"/>
                    <fo:table-body>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>SUBTOTAL 15%:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block><xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>SUBTOTAL 0%:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>SUBTOTAL no objeto de IVA:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>SUBTOTAL Exento de IVA:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>SUBTOTAL SIN IMPUESTOS:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block><xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>DESCUENTO:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>ICE:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>IVA 15%:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block><xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto/valor"/></fo:block></fo:table-cell>
                      </fo:table-row>
                       <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>IRBPNR:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                       <fo:table-row>
                        <fo:table-cell padding="2pt"><fo:block>PROPINA:</fo:block></fo:table-cell>
                        <fo:table-cell padding="2pt" text-align="right"><fo:block>0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell font-weight="bold" padding="2pt"><fo:block>VALOR TOTAL:</fo:block></fo:table-cell>
                        <fo:table-cell font-weight="bold" text-align="right" padding="2pt"><fo:block><xsl:value-of select="/factura/infoFactura/importeTotal"/></fo:block></fo:table-cell>
                      </fo:table-row>
                    </fo:table-body>
                  </fo:table>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
