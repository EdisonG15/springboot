<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="factura"
          page-height="29.7cm" page-width="21cm" margin="1cm">
          <fo:region-body margin-top="1cm" margin-bottom="1cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="factura">
        <fo:flow flow-name="xsl-region-body">

          <!-- Logo -->
          <fo:block text-align="center" padding-bottom="5pt">
            <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/manana/logo.png')" content-width="150px"/>
          </fo:block>

          <!-- Tabla superior -->
          <fo:table width="100%" table-layout="fixed" font-size="9pt" border="0.5pt solid black" margin-bottom="5pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <!-- Emisor -->
                <fo:table-cell border="0.5pt solid black" padding="3pt">
                  <fo:block font-weight="bold" font-size="10pt">EL AGRICULTOR</fo:block>
                  <fo:block>Dir Matriz: <xsl:value-of select="/factura/infoTributaria/dirMatriz"/></fo:block>
                  <fo:block>Dir Sucursal: <xsl:value-of select="/factura/infoFactura/dirEstablecimiento"/></fo:block>
                  <fo:block>OBLIGADO A LLEVAR CONTABILIDAD: <xsl:value-of select="/factura/infoFactura/obligadoContabilidad"/></fo:block>
                </fo:table-cell>

                <!-- Datos factura -->
                <fo:table-cell border="0.5pt solid black" padding="3pt">
                  <fo:block font-weight="bold" font-size="10pt">FACTURA</fo:block>
                  <fo:block>R.U.C.: <xsl:value-of select="/factura/infoTributaria/ruc"/></fo:block>
                  <fo:block>No.: <xsl:value-of select="/factura/infoTributaria/estab"/>-<xsl:value-of select="/factura/infoTributaria/ptoEmi"/>-<xsl:value-of select="/factura/infoTributaria/secuencial"/></fo:block>
                  <fo:block>CLAVE DE ACCESO:</fo:block>
                  <fo:block><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                  <fo:block>AMBIENTE: <xsl:value-of select="/factura/infoTributaria/ambiente"/></fo:block>
                  <fo:block>EMISIÓN: NORMAL</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- Código de barras -->
          <fo:block text-align="center" margin-top="5pt" margin-bottom="5pt">
            <fo:external-graphic src="url('file:///C:/Users/DELL/Desktop/manana/codigo_barras.png')" content-width="80%"/>
          </fo:block>

          <!-- Datos del cliente -->
          <fo:block font-size="9pt" font-weight="bold">Razón Social / Nombres y Apellidos: <xsl:value-of select="/factura/infoFactura/razonSocialComprador"/></fo:block>
          <fo:block font-size="9pt">Identificación: <xsl:value-of select="/factura/infoFactura/identificacionComprador"/></fo:block>
          <fo:block font-size="9pt">Fecha de Emisión: <xsl:value-of select="/factura/infoFactura/fechaEmision"/></fo:block>

          <!-- Detalle de productos -->
          <fo:table table-layout="fixed" width="100%" border="0.5pt solid black" font-size="9pt" margin-top="5pt">
            <fo:table-column column-width="15%"/>
            <fo:table-column column-width="15%"/>
            <fo:table-column column-width="10%"/>
            <fo:table-column column-width="40%"/>
            <fo:table-column column-width="10%"/>
            <fo:table-column column-width="10%"/>
            <fo:table-header>
              <fo:table-row font-weight="bold" text-align="center" background-color="#e0e0e0">
                <fo:table-cell border="0.5pt solid black"><fo:block>Cod. Principal</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid black"><fo:block>Cod. Auxiliar</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid black"><fo:block>Cant.</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid black"><fo:block>Descripción</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid black"><fo:block>Precio Unitario</fo:block></fo:table-cell>
                <fo:table-cell border="0.5pt solid black"><fo:block>Total</fo:block></fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-body>
              <xsl:for-each select="/factura/detalles/detalle">
                <fo:table-row>
                  <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="codigoPrincipal"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid black"><fo:block/></fo:table-cell>
                  <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="cantidad"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="descripcion"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="precioUnitario"/></fo:block></fo:table-cell>
                  <fo:table-cell border="0.5pt solid black"><fo:block><xsl:value-of select="precioTotalSinImpuesto"/></fo:block></fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>

          <!-- Totales -->
          <fo:table width="100%" table-layout="fixed" font-size="9pt" margin-top="5pt">
            <fo:table-column column-width="70%"/>
            <fo:table-column column-width="30%"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell><fo:block/></fo:table-cell>
                <fo:table-cell border="0.5pt solid black" padding="4pt">
                  <fo:block>SUBTOTAL 15%: <xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/></fo:block>
                  <fo:block>IVA 15%: <xsl:value-of select="/factura/infoFactura/totalConImpuestos/totalImpuesto/valor"/></fo:block>
                  <fo:block font-weight="bold">VALOR TOTAL: <xsl:value-of select="/factura/infoFactura/importeTotal"/></fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>

          <!-- Forma de pago -->
          <fo:block font-weight="bold" font-size="9pt" margin-top="10pt">Forma de Pago:</fo:block>
          <xsl:for-each select="/factura/infoFactura/pagos/pago">
            <fo:block font-size="9pt">- <xsl:value-of select="formaPago"/> : <xsl:value-of select="total"/></fo:block>
          </xsl:for-each>

        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
