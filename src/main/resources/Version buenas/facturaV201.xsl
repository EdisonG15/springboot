<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="factura"
          page-height="29.7cm" page-width="21cm" margin="2cm"> <!-- Márgenes generales más amplios para un look más limpio -->
          <fo:region-body margin-top="0.5cm" margin-bottom="0.5cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="factura">
        <fo:flow flow-name="xsl-region-body">

          <!-- Sección Superior: Logo, Información de la Empresa y Detalles de la Factura -->
          <!-- Se eliminó el borde exterior de la tabla principal para un diseño más abierto -->
          <fo:table width="100%" table-layout="fixed" margin-bottom="20pt" space-after="20pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <!-- Celda Izquierda: Logo e Información del Emisor (Empresa) -->
                <fo:table-cell border-right="0.5pt solid #DDDDDD" padding="15pt" display-align="before">
                  <fo:block text-align="center" padding-bottom="10pt">
                    <!-- Logo - Asegúrate de que esta ruta sea correcta y la imagen sea accesible -->
                    <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/manana/logo.png')" content-width="120px"/> <!-- Tamaño del logo ligeramente ajustado -->
                  </fo:block>
                  <fo:block font-weight="bold" font-size="12pt" margin-top="10pt" text-align="center" color="#333333">MEGADATOS SA</fo:block>
                  <fo:block font-size="9pt" margin-top="5pt" line-height="1.5" color="#555555">
                    Dir Matriz: <xsl:value-of select="/factura/infoTributaria/dirMatriz"/>
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.5" color="#555555">
                    Dir Sucursal: <xsl:value-of select="/factura/infoFactura/dirEstablecimiento"/>
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.5" color="#555555">
                    Contribuyente Especial Nro: SI
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.5" color="#555555">
                    OBLIGADO A LLEVAR CONTABILIDAD: <xsl:value-of select="/factura/infoFactura/obligadoContabilidad"/>
                  </fo:block>
                </fo:table-cell>

                <!-- Celda Derecha: Detalles de la Factura -->
                <fo:table-cell padding="15pt" display-align="before">
                  <fo:block font-weight="bold" font-size="10pt" line-height="1.5" color="#333333">R.U.C.: <xsl:value-of select="/factura/infoTributaria/ruc"/></fo:block>
                  <fo:block font-weight="bold" font-size="14pt" margin-top="10pt" text-align="center" color="#0056B3">FACTURA</fo:block> <!-- Color de énfasis -->
                  <fo:block font-size="10pt" margin-top="8pt" line-height="1.5" color="#555555">
                    No.: <xsl:value-of select="/factura/infoTributaria/estab"/>-
                    <xsl:value-of select="/factura/infoTributaria/ptoEmi"/>-
                    <xsl:value-of select="/factura/infoTributaria/secuencial"/>
                  </fo:block>
                  <fo:block margin-top="10pt" font-size="9pt" font-weight="bold" color="#333333">NÚMERO DE AUTORIZACIÓN</fo:block>
                  <fo:block font-size="8pt" line-height="1.5" wrap-option="wrap" color="#555555">
                    <xsl:value-of select="/factura/infoTributaria/claveAcceso"/>
                  </fo:block>
                  <fo:block margin-top="10pt" font-size="9pt" line-height="1.5" color="#555555">
                    AMBIENTE: <xsl:value-of select="/factura/infoTributaria/ambiente"/>
                  </fo:block>
                  <fo:block font-size="9pt" line-height="1.5" color="#555555">
                    EMISIÓN: NORMAL
                  </fo:block>
                  <fo:block margin-top="10pt" font-size="9pt" font-weight="bold" color="#333333">CLAVE DE ACCESO:</fo:block>
                  <!-- Código de Barras - Necesitas generar esta imagen externamente basándote en la claveAcceso -->
                  <fo:block text-align="center" margin-top="8pt">
                    <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/manana/codigo_barras.png')" content-width="60%" content-height="1.8cm"/> <!-- Ajuste de tamaño para el código de barras -->
                    <fo:block font-size="8pt" wrap-option="wrap" color="#555555"><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- Sección de Información del Cliente -->
          <fo:table width="100%" table-layout="fixed" font-size="9pt" border="0.5pt solid #DDDDDD" padding="10pt" margin-top="20pt" space-after="20pt">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell padding-right="15pt">
                  <fo:block font-weight="bold" line-height="1.5" color="#333333">Razón Social / Nombres y Apellidos: <xsl:value-of select="/factura/infoFactura/razonSocialComprador"/></fo:block>
                  <fo:block line-height="1.5" color="#555555">Identificación: <xsl:value-of select="/factura/infoFactura/identificacionComprador"/></fo:block>
                  <fo:block line-height="1.5" color="#555555">Fecha de Emisión: <xsl:value-of select="/factura/infoFactura/fechaEmision"/></fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block line-height="1.5" color="#555555">Guía de Remisión:</fo:block>
                  <!-- Agrega el valor para Guía de Remisión si está disponible en tu XML -->
                  <fo:block/>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- Tabla de Detalles de Productos -->
          <fo:table table-layout="fixed" width="100%" border="0.5pt solid #DDDDDD" font-size="9pt" margin-top="20pt" space-after="20pt">
            <fo:table-column column-width="12%"/> <!-- Cod. Principal -->
            <fo:table-column column-width="12%"/> <!-- Cod. Auxiliar -->
            <fo:table-column column-width="8%"/>  <!-- Cant. -->
            <fo:table-column column-width="38%"/> <!-- Descripción -->
            <fo:table-column column-width="10%"/> <!-- Precio Unitario -->
            <fo:table-column column-width="10%"/> <!-- Descuento -->
            <fo:table-column column-width="10%"/> <!-- Total -->
            <fo:table-header>
              <fo:table-row font-weight="bold" background-color="#F8F8F8"> <!-- Fondo de encabezado muy claro -->
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" number-columns-spanned="4" padding="8pt"><fo:block/></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" number-columns-spanned="3" padding="8pt"><fo:block color="#333333">Detalle</fo:block></fo:table-cell>
              </fo:table-row>
              <fo:table-row font-weight="bold" background-color="#F8F8F8">
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Cod. Principal</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Cod. Auxiliar</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Cant.</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Descripción</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Precio Unitario</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Descuento</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid #DDDDDD" display-align="center" padding="8pt"><fo:block color="#333333">Total</fo:block></fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-body>
              <xsl:for-each select="/factura/detalles/detalle">
                <fo:table-row>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt"><fo:block color="#555555"><xsl:value-of select="codigoPrincipal"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt"><fo:block/></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="cantidad"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt"><fo:block color="#555555"><xsl:value-of select="descripcion"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="precioUnitario"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="descuento"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid #EEEEEE" padding="8pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="precioTotalSinImpuesto"/></fo:block></fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>

          <!-- Sección Inferior: Información Adicional y Totales -->
          <fo:table width="100%" table-layout="fixed" font-size="9pt" margin-top="20pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <!-- Celda Izquierda: Información Adicional y Forma de Pago -->
                <fo:table-cell padding-right="20pt" display-align="before">
                  <!-- Caja de Información Adicional -->
                  <fo:block font-weight="bold" margin-bottom="8pt" font-size="10pt" color="#333333">INFORMACIÓN ADICIONAL</fo:block>
                  <fo:table width="100%" border="0.5pt solid #DDDDDD" padding="10pt" space-after="15pt">
                    <fo:table-column column-width="100%"/>
                    <fo:table-body>
                      <fo:table-row>
                        <fo:table-cell>
                          <fo:block line-height="1.5" color="#555555">Login: EN-PDQU-GAROFALO01</fo:block>
                          <fo:block line-height="1.5" color="#555555">Consumo: DEL 01 JULIO 2025 AL 31 JULIO 2025</fo:block>
                          <fo:block line-height="1.5" color="#555555">Ciudad: QUITO</fo:block>
                          <fo:block line-height="1.5" color="#555555">Dirección: CALLE A Y CALLE C</fo:block>
                          <fo:block line-height="1.5" color="#555555">Teléfono: 0995183170</fo:block>
                          <fo:block line-height="1.5" color="#555555">Email: garofaloedison@gmail.com</fo:block>
                          <fo:block line-height="1.5" color="#555555">Contrato: 001-001-0097457</fo:block>
                          <fo:block line-height="1.5" color="#555555">Fecha Máxima de pago: 11/07/2025</fo:block>
                          <fo:block line-height="1.5" color="#555555">GRAN CONTRIBUYENTE: NAC-OCTO0C21-00001122-E</fo:block>
                        </fo:table-cell>
                      </fo:table-row>
                    </fo:table-body>
                  </fo:table>

                  <!-- Forma de Pago -->
                  <fo:block font-weight="bold" font-size="10pt" margin-top="15pt" margin-bottom="8pt" color="#333333">Forma de Pago:</fo:block>
                  <fo:table width="100%" border="0.5pt solid #DDDDDD" padding="10pt">
                    <fo:table-column column-width="100%"/>
                    <fo:table-body>
                      <xsl:for-each select="/factura/infoFactura/pagos/pago">
                        <fo:table-row>
                          <fo:table-cell>
                            <fo:block font-size="9pt" line-height="1.5" color="#555555"><xsl:value-of select="formaPago"/> : <xsl:value-of select="total"/></fo:block>
                          </fo:table-cell>
                        </fo:table-row>
                      </xsl:for-each>
                    </fo:table-body>
                  </fo:table>
                </fo:table-cell>

                <!-- Celda Derecha: Totales -->
                <fo:table-cell display-align="before">
                  <fo:table width="100%" border="0.5pt solid #DDDDDD" padding="10pt">
                    <fo:table-column column-width="70%"/>
                    <fo:table-column column-width="30%"/>
                    <fo:table-body>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">SUBTOTAL 15%:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">SUBTOTAL 0%:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">SUBTOTAL no objeto de IVA:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">SUBTOTAL Exento de IVA:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">SUBTOTAL SIN IMPUESTOS:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">DESCUENTO:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">ICE:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">IVA 15%:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555"><xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto/valor"/></fo:block></fo:table-cell>
                      </fo:table-row>
                       <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">IRBPNR:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                       <fo:table-row>
                        <fo:table-cell padding="4pt"><fo:block color="#555555">PROPINA:</fo:block></fo:table-cell>
                        <fo:table-cell padding="4pt" text-align="right"><fo:block color="#555555">0.00</fo:block></fo:table-cell>
                      </fo:table-row>
                      <fo:table-row>
                        <fo:table-cell font-weight="bold" padding="4pt"><fo:block color="#333333">VALOR TOTAL:</fo:block></fo:table-cell>
                        <fo:table-cell font-weight="bold" text-align="right" padding="4pt"><fo:block font-size="11pt" color="#0056B3"><xsl:value-of select="/factura/infoFactura/importeTotal"/></fo:block></fo:table-cell>
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
