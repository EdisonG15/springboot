package com.empresa.facturacion.electronica.repositories.comprobante;

import com.empresa.facturacion.electronica.dto.facturacion.request.ComprobanteElectronico;
import com.empresa.facturacion.electronica.dto.facturacion.request.SriLog;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Repository
public class ComprobanteElectronicoRepositoryImp implements ComprobanteElectronicoRepository {
    private final DataSource dataSource;

    public ComprobanteElectronicoRepositoryImp(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Integer guardarComprobanteElectronico(ComprobanteElectronico comprobante) throws SQLException {
        String sql = "INSERT INTO comprobantes_electronicos (" +
                "tipo_documento, id_venta, id_cliente, clave_acceso, numero_documento, " +
                "id_ambiente, id_estado_emision, fecha_emision, id_tipo_emision, mensaje_respuesta, fecha_registro) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, comprobante.getTipoDocumento());
            stmt.setObject(2, comprobante.getIdVenta()); // Use setObject for Integer to handle nulls
            stmt.setObject(3, comprobante.getIdCliente());
            stmt.setString(4, comprobante.getClaveAcceso());
            stmt.setString(5, comprobante.getNumeroDocumento());
            stmt.setObject(6, comprobante.getIdAmbiente());
            stmt.setObject(7, comprobante.getIdEstadoEmision());
            stmt.setTimestamp(8, comprobante.getFechaEmision() != null ? Timestamp.valueOf(comprobante.getFechaEmision()) : null);
            stmt.setObject(9, comprobante.getIdTipoEmision());
            stmt.setString(10, comprobante.getMensajeRespuesta());
            stmt.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating comprobante failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Return the generated id_comprobante
                } else {
                    throw new SQLException("Creating comprobante failed, no ID obtained.");
                }
            }
        }
    }

    @Override
    public void actualizarComprobanteElectronico(ComprobanteElectronico comprobante) throws SQLException {
        String sql = "UPDATE comprobantes_electronicos SET " +
                "numero_autorizacion = ?, id_estado_emision = ?, fecha_autorizacion = ?, " +
                "mensaje_respuesta = ?, ruta_xml_generado = ?, ruta_xml_firmado = ?, " +
                "ruta_xml_autorizado = ?, pdf_generado = ?, id_enviado_cliente = ?, fecha_envio_cliente = ? " +
                "WHERE id_comprobante = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, comprobante.getNumeroAutorizacion());
            stmt.setObject(2, comprobante.getIdEstadoEmision());
            stmt.setTimestamp(3, comprobante.getFechaAutorizacion() != null ? Timestamp.valueOf(comprobante.getFechaAutorizacion()) : null);
            stmt.setString(4, comprobante.getMensajeRespuesta());
            stmt.setString(5, comprobante.getRutaXmlGenerado());
            stmt.setString(6, comprobante.getRutaXmlFirmado());
            stmt.setString(7, comprobante.getRutaXmlAutorizado());
            stmt.setString(8, comprobante.getPdfGenerado());
            stmt.setObject(9, comprobante.getIdEnviadoCliente());
            stmt.setTimestamp(10, comprobante.getFechaEnvioCliente() != null ? Timestamp.valueOf(comprobante.getFechaEnvioCliente()) : null);
            stmt.setInt(11, comprobante.getIdComprobante());

            stmt.executeUpdate();
        }
    }

    @Override
    public ComprobanteElectronico buscarComprobantePorClaveAcceso(String claveAcceso) throws SQLException {
        String sql = "SELECT * FROM comprobantes_electronicos WHERE clave_acceso = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, claveAcceso);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    ComprobanteElectronico comprobante = new ComprobanteElectronico();
                    comprobante.setIdComprobante(rs.getInt("id_comprobante"));
                    comprobante.setTipoDocumento(rs.getString("tipo_documento"));
                    comprobante.setIdVenta(rs.getObject("id_venta", Integer.class));
                    comprobante.setIdCliente(rs.getObject("id_cliente", Integer.class));
                    comprobante.setNumeroAutorizacion(rs.getString("numero_autorizacion"));
                    comprobante.setClaveAcceso(rs.getString("clave_acceso"));
                    comprobante.setNumeroDocumento(rs.getString("numero_documento"));
                    comprobante.setIdAmbiente(rs.getObject("id_ambiente", Integer.class));
                    comprobante.setIdEstadoEmision(rs.getObject("id_estado_emision", Integer.class));
                    comprobante.setFechaEmision(rs.getTimestamp("fecha_emision") != null ? rs.getTimestamp("fecha_emision").toLocalDateTime() : null);
                    comprobante.setFechaAutorizacion(rs.getTimestamp("fecha_autorizacion") != null ? rs.getTimestamp("fecha_autorizacion").toLocalDateTime() : null);
                    comprobante.setIdTipoEmision(rs.getObject("id_tipo_emision", Integer.class));
                    comprobante.setMensajeRespuesta(rs.getString("mensaje_respuesta"));
                    comprobante.setRutaXmlGenerado(rs.getString("ruta_xml_generado"));
                    comprobante.setRutaXmlFirmado(rs.getString("ruta_xml_firmado"));
                    comprobante.setRutaXmlAutorizado(rs.getString("ruta_xml_autorizado"));
                    comprobante.setPdfGenerado(rs.getString("pdf_generado"));
                    comprobante.setIdEnviadoCliente(rs.getObject("id_enviado_cliente", Integer.class));
                    comprobante.setFechaEnvioCliente(rs.getTimestamp("fecha_envio_cliente") != null ? rs.getTimestamp("fecha_envio_cliente").toLocalDateTime() : null);
                    comprobante.setFechaRegistro(rs.getTimestamp("fecha_registro") != null ? rs.getTimestamp("fecha_registro").toLocalDateTime() : null);
                    return comprobante;
                }
            }
            return null;
        }

    }

    @Override
    public void guardarSriLog(SriLog log) throws SQLException {
        String sql = "INSERT INTO sri_logs (" +
                "id_comprobante, etapa, estado_envio, codigo_error, mensaje, tipo, origen, fecha_log) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setObject(1, log.getIdComprobante());
            stmt.setString(2, log.getEtapa().name());
            stmt.setString(3, log.getEstadoEnvio());
            stmt.setString(4, log.getCodigoError());
            stmt.setString(5, log.getMensaje());
            stmt.setString(6, log.getTipo().name());
            stmt.setString(7, log.getOrigen());
            stmt.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));

            stmt.executeUpdate();
        }
    }

}
