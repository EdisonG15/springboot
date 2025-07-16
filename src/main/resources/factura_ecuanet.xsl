<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="factura"
          page-height="29.7cm" page-width="21cm" margin="1.5cm">
          <fo:region-body margin-top="1cm" margin-bottom="1cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="factura">
        <fo:flow flow-name="xsl-region-body">
          <!-- ENCABEZADO -->
          <fo:block font-size="12pt" font-weight="bold" text-align="center" border-bottom="1pt solid black" padding-bottom="5pt">
            <fo:inline color="#0056A0">ecua</fo:inline>
            <fo:inline color="red">g</fo:inline>
            <fo:inline color="yellow">u</fo:inline>
            <fo:inline color="blue">n</fo:inline>
            <fo:inline color="#0056A0">et</fo:inline>
          </fo:block>

          <fo:table table-layout="fixed" width="100%" border="1pt solid black" margin-top="5pt" font-size="10pt">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
              <fo:table-row>
                <!-- Información del emisor -->
                <fo:table-cell border="1pt solid black" padding="3pt">
                  <fo:block font-weight="bold">MEGADATOS SA</fo:block>
                  <fo:block>Dir Matriz: <xsl:value-of select="/factura/infoTributaria/dirMatriz"/></fo:block>
                  <fo:block>Dir Sucursal: <xsl:value-of select="/factura/infoFactura/dirEstablecimiento"/></fo:block>
                  <fo:block>Contribuyente Especial Nro: 0176</fo:block>
                  <fo:block>OBLIGADO A LLEVAR CONTABILIDAD: <xsl:value-of select="/factura/infoFactura/obligadoContabilidad"/></fo:block>
                </fo:table-cell>

                <!-- Datos de la factura -->
                <fo:table-cell border="1pt solid black" padding="3pt">
                  <fo:block>R.U.C.: <xsl:value-of select="/factura/infoTributaria/ruc"/></fo:block>
                  <fo:block font-weight="bold">FACTURA</fo:block>
                  <fo:block>No.: <xsl:value-of select="/factura/infoTributaria/estab"/>-<xsl:value-of select="/factura/infoTributaria/ptoEmi"/>-<xsl:value-of select="/factura/infoTributaria/secuencial"/></fo:block>
                  <fo:block>NÚMERO DE AUTORIZACIÓN:</fo:block>
                  <fo:block><xsl:value-of select="/factura/infoTributaria/claveAcceso"/></fo:block>
                  <fo:block>AMBIENTE: <xsl:value-of select="/factura/infoTributaria/ambiente"/></fo:block>
                  <fo:block>EMISIÓN: NORMAL</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <!-- DATOS DEL CLIENTE -->
          <fo:block font-size="10pt" margin-top="5pt" font-weight="bold">Razón Social / Nombres y Apellidos: 
            <xsl:value-of select="/factura/infoFactura/razonSocialComprador"/>
          </fo:block>
          <fo:block>Identificación: <xsl:value-of select="/factura/infoFactura/identificacionComprador"/></fo:block>
          <fo:block>Fecha de Emisión: <xsl:value-of select="/factura/infoFactura/fechaEmision"/></fo:block>
          <!-- DETALLES DE PRODUCTOS -->
          <fo:table table-layout="fixed" width="100%" border="1pt solid black" margin-top="5pt" font-size="10pt">
            <fo:table-column column-width="20%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="15%"/>
            <fo:table-column column-width="15%"/>
            <fo:table-header>
              <fo:table-row>
                <fo:table-cell border="1pt solid black"><fo:block>Código</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black"><fo:block>Descripción</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black"><fo:block>Precio Unitario</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black"><fo:block>Total</fo:block></fo:table-cell>
              </fo:table-row>
            </fo:table-header>
            <fo:table-body>
              <xsl:for-each select="/factura/detalles/detalle">
                <fo:table-row>
                  <fo:table-cell border="1pt solid black"><fo:block><xsl:value-of select="codigoPrincipal"/></fo:block></fo:table-cell>
                  <fo:table-cell border="1pt solid black"><fo:block><xsl:value-of select="descripcion"/></fo:block></fo:table-cell>
                  <fo:table-cell border="1pt solid black"><fo:block><xsl:value-of select="precioUnitario"/></fo:block></fo:table-cell>
                  <fo:table-cell border="1pt solid black"><fo:block><xsl:value-of select="precioTotalSinImpuesto"/></fo:block></fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
          <!-- TOTALES -->
          <fo:block margin-top="10pt" text-align="right" font-weight="bold" font-size="10pt">
            TOTAL SIN IMPUESTOS: <xsl:value-of select="/factura/infoFactura/totalSinImpuestos"/>  
          </fo:block>
          <fo:block text-align="right" font-weight="bold" font-size="10pt">
            IVA 15%: <xsl:value-of select="/factura/infoFactura/totalIva"/>  
          </fo:block>
          <fo:block text-align="right" font-weight="bold" font-size="12pt">
            VALOR TOTAL: <xsl:value-of select="/factura/infoFactura/importeTotal"/>
          </fo:block>

          <!-- FORMA DE PAGO -->
          <fo:block font-weight="bold" margin-top="10pt">Forma de Pago:</fo:block>
          <xsl:for-each select="/factura/pagos/pago">
            <fo:block>- <xsl:value-of select="formaPago"/> por <xsl:value-of select="total"/></fo:block>
          </xsl:for-each>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
