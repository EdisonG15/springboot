package com.empresa.facturacion.electronica.repositories.factura;

import com.empresa.facturacion.electronica.entities.common.*;
import com.empresa.facturacion.electronica.entities.factura.Detalle;
import com.empresa.facturacion.electronica.entities.factura.Detalles;
import com.empresa.facturacion.electronica.entities.factura.FacturaElectronica;
import com.empresa.facturacion.electronica.entities.factura.InfoFactura;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

//@AllArgsConstructor
@Repository
public class FacturaSriRepository implements IFacturaSriRepository {

    private String codigo_porcentaje_iva ;
    private final DataSource dataSource; // Declara el DataSource

  //   Constructor donde Spring inyectará automáticamente el DataSource
    public FacturaSriRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public FacturaElectronica buscarFacturaById(Integer facturaId) throws SQLException {
        FacturaElectronica factura = null;
        String ventaSql = "select e.ambiente,e.tipo_emision, e.razon_social,e.nombre_comercial,e.ruc,e.TipoDocumento,\n" +
                "                e.establecimiento_codigo,e.punto_emision_codigo,e.nro_boletaSri,e.direccion_matriz,\n" +
                "                v.fecha_registro,e.direccion_sucursal,e.contribuyente_especial,e.obligado_contabilidad,\n" +
                "                c.tipo_identificacion,CONCAT(c.nombre, ' ' ,c.apellido) as razon_social_comprador,c.numeroDocumento   as IdentificacionComprador,\n" +
                "                c.telefono as telefono_cliente,c.direccion,c.email as email_cliente,v.subtotal,v.total_venta,e.codigo_iva\n" +
                "                from ventas v inner join empresa e  on   v.IdTienda =e.id_Empresa and v.estado ='1' \n" +
                "                inner  join cliente c  on v.IdCliente =c.id_cliente where IdVenta=?";

        String detalleSql = "SELECT codigo_barra,descripcion_producto,cantidad,PrecioUnidad AS PrecioUnitario,iva AS tarifa_iva,Sub_total AS PrecioTotalSinImpuesto,total_venta  FROM det_venta WHERE IdVenta = ? and estado ='1'";

        // *** EL CAMBIO CLAVE ESTÁ AQUÍ: Usamos dataSource.getConnection() ***
        try (Connection conn = dataSource.getConnection()) {
            try (PreparedStatement stmt = conn.prepareStatement(ventaSql)) {
                stmt.setInt(1, facturaId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    factura = new FacturaElectronica();
                    // InfoTributaria
                    InfoTributaria infoTributaria = new InfoTributaria();
                    infoTributaria.setAmbiente(rs.getString("ambiente"));
                     infoTributaria.setTipoEmision(rs.getString("tipo_emision"));
                    infoTributaria.setRazonSocial(rs.getString("razon_social").toUpperCase(Locale.ROOT));
                    infoTributaria.setNombreComercial(rs.getString("nombre_comercial").toUpperCase(Locale.ROOT));
                    infoTributaria.setRuc(rs.getString("ruc"));
                    infoTributaria.setCodDoc(rs.getString("TipoDocumento")); // Por ejemplo "01" = factura 04 = Nota de crédito, 05 = Nota de débito
                    infoTributaria.setEstab(rs.getString("establecimiento_codigo")); //Código del establecimiento (3 dígitos). Lo define el SRI cuando registras el local
                    infoTributaria.setPtoEmi(rs.getString("punto_emision_codigo")); //Punto de emisión (3 dígitos). También lo define el SRI
//                    infoTributaria.setSecuencial(rs.getString("nro_boletaSri")); //Número secuencial de la factura (9 dígitos, por ejemplo: 001067170)
                    String nroBoletaRaw = rs.getString("nro_boletaSri");
                    int nroSecuencial = 1; // Valor por defecto si es la primera factura

                    if (nroBoletaRaw != null && !nroBoletaRaw.trim().isEmpty()) {
                        try {
                            nroSecuencial = Integer.parseInt(nroBoletaRaw.trim()) + 1;
                        } catch (NumberFormatException e) {
                            // Log o manejo de error si no es un número válido
                            nroSecuencial = 1;
                        }
                    }

                    String nroSecuencialFormatted = String.format("%09d", nroSecuencial); // 9 dígitos con ceros a la izquierda
                    infoTributaria.setSecuencial(nroSecuencialFormatted);

                    infoTributaria.setDirMatriz(rs.getString("direccion_matriz").toUpperCase(Locale.ROOT));
                    factura.setInfoTributaria(infoTributaria);

                    // InfoFactura
                    InfoFactura infoFactura = new InfoFactura();
                    // Recomendación: Almacenar fecha como DATE/TIMESTAMP y usar LocalDate directamente.
                    // Si el string "dd/MM/yyyy" es solo para el XML, está bien.
                    infoFactura.setFechaEmision(rs.getTimestamp("fecha_registro").toLocalDateTime().toLocalDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
                    infoFactura.setDirEstablecimiento(rs.getString("direccion_sucursal").toUpperCase(Locale.ROOT));
                  //  infoFactura.setContribuyenteEspecial(rs.getString("contribuyente_especial"));
                    String contribuyenteEspecial = rs.getString("contribuyente_especial");
                    if (contribuyenteEspecial != null && !contribuyenteEspecial.trim().isEmpty()) {
                        infoFactura.setContribuyenteEspecial(contribuyenteEspecial.trim());
                    }
                    infoFactura.setObligadoContabilidad(rs.getString("obligado_contabilidad").toUpperCase(Locale.ROOT));
                    infoFactura.setTipoIdentificacionComprador(rs.getString("tipo_identificacion")); //  04 = RUC, 05 = Cédula, 06 = Pasaporte, etc.
                    infoFactura.setRazonSocialComprador(rs.getString("razon_social_comprador").toUpperCase(Locale.ROOT)); // Mejor si viene de la DB
                    infoFactura.setIdentificacionComprador(rs.getString("IdentificacionComprador") != null ? rs.getString("IdentificacionComprador") : "9999999999999");
                    infoFactura.setTotalSinImpuestos(rs.getBigDecimal("subtotal"));
                  //  infoFactura.setTotalDescuento(BigDecimal.ZERO); // Puedes calcularlo si tienes
                    infoFactura.setTotalDescuento(new BigDecimal("0.00"));

                    infoFactura.setPropina(new BigDecimal("0.00"));
                    infoFactura.setImporteTotal(rs.getBigDecimal("total_venta"));
                    infoFactura.setMoneda("DOLAR");
                    List<Pago> pagos = new ArrayList<>();
                    pagos.add(new Pago("forma_pago_codigo", rs.getBigDecimal("total_venta")));
                    infoFactura.setPagos(pagos);

                    factura.setInfoFactura(infoFactura);
                    codigo_porcentaje_iva=rs.getString("codigo_iva");
                    // Detalles
                    Detalles detalles = new Detalles();
                    List<Detalle> detalleList = new ArrayList<>();
                    // List<Impuestos> totalConImpuestosList = new ArrayList<>(); // Esta lista se crea en el InfoFactura, no es necesaria aquí
                    BigDecimal totalImpuestosValorGlobal = BigDecimal.ZERO;

                    try (PreparedStatement detailStmt = conn.prepareStatement(detalleSql)) {
                        detailStmt.setInt(1, facturaId);
                        ResultSet detailRs = detailStmt.executeQuery();
                        while (detailRs.next()) {
                            Detalle detalle = new Detalle();
                            detalle.setCodigoPrincipal(detailRs.getString("codigo_barra"));
                            detalle.setDescripcion(detailRs.getString("descripcion_producto").toUpperCase(Locale.ROOT));
                            detalle.setCantidad(BigDecimal.valueOf(detailRs.getDouble("cantidad")));
                            detalle.setPrecioUnitario(detailRs.getBigDecimal("PrecioUnitario"));
                            detalle.setDescuento(new BigDecimal("0.00")); // si tienes campo específico, úsalo
                            detalle.setPrecioTotalSinImpuesto(detailRs.getBigDecimal("PrecioTotalSinImpuesto"));

                            // Impuestos del detalle
                            Impuestos impuestoDetalle = new Impuestos();
                            impuestoDetalle.setCodigo("2"); // Código de impuesto (ej. "2" para IVA)
                           // impuestoDetalle.setCodigoPorcentaje(detailRs.getString("codigo_porcentaje_iva")); // Obtener de DB o calcular
                            impuestoDetalle.setCodigoPorcentaje(codigo_porcentaje_iva); // Obtener de DB o calcular
                            impuestoDetalle.setTarifa("15"); // Obtener de DB o calcular
                            impuestoDetalle.setBaseImponible(detalle.getPrecioTotalSinImpuesto().setScale(2, BigDecimal.ROUND_HALF_UP).toPlainString()); // Importante: base sin IVA
                            impuestoDetalle.setValor(detailRs.getBigDecimal("tarifa_iva").setScale(2, BigDecimal.ROUND_HALF_UP)); // Valor del IVA para este detalle

                            List<Impuestos> impuestosList = new ArrayList<>();
                            impuestosList.add(impuestoDetalle);
                            detalle.setImpuestos(impuestosList);

                            totalImpuestosValorGlobal = totalImpuestosValorGlobal.add(impuestoDetalle.getValor());
                            detalleList.add(detalle);
                        }
                    }
                    detalles.setDetalle(detalleList);
                    factura.setDetalles(detalles);

                    // Impuestos totales (para infoFactura)
                    List<Impuestos> totalConImpuestosList = new ArrayList<>(); // Se crea aquí
                    Impuestos totalImpuestoAgregado = new Impuestos();
                    totalImpuestoAgregado.setCodigo("2"); // Código de impuesto (IVA)
                    totalImpuestoAgregado.setCodigoPorcentaje("4"); // Código de porcentaje (ej. 15%)
                   // totalImpuestoAgregado.setTarifa("12"); // Tarifa de IVA
                    // La base imponible para el total debe ser la suma de los subtotales SIN IMPUESTOS que aplican IVA
                    totalImpuestoAgregado.setBaseImponible(infoFactura.getTotalSinImpuestos().setScale(2, BigDecimal.ROUND_HALF_UP).toPlainString());
                    totalImpuestoAgregado.setValor(totalImpuestosValorGlobal.setScale(2, BigDecimal.ROUND_HALF_UP)); // El valor total de IVA
                    totalConImpuestosList.add(totalImpuestoAgregado);
                    infoFactura.setTotalConImpuestos(totalConImpuestosList);

//                    factura.setInfoAdicional(new InfoAdicional()); // Si vas a añadir campos extra
                    // Campos adicionales
                    List<CampoAdicional> adicionales = new ArrayList<>();

                    if (rs.getString("email_cliente") != null) {
                        CampoAdicional email = new CampoAdicional();
                        email.setNombre("EMAILCLIENTE");
                        email.setValor(rs.getString("email_cliente").toUpperCase(Locale.ROOT));
                        adicionales.add(email);
                    }

                    if (rs.getString("telefono_cliente") != null) {
                        CampoAdicional telefono = new CampoAdicional();
                        telefono.setNombre("TELFCLIENTE");
                        telefono.setValor(rs.getString("telefono_cliente").toUpperCase(Locale.ROOT));
                        adicionales.add(telefono);
                    }

                    if (!adicionales.isEmpty()) {
                        InfoAdicional infoAdicional = new InfoAdicional();
                        infoAdicional.setCampoAdicional(adicionales);
                        factura.setInfoAdicional(infoAdicional);
                    }

                } else {
                    System.out.println("Factura con ID " + facturaId + " no encontrada.");
                }
            }
        }
        return factura;
    }
}
