package com.empresa.facturacion.electronica.repositories.comprobante;

import com.empresa.facturacion.electronica.dto.facturacion.request.ComprobanteElectronico;
import com.empresa.facturacion.electronica.dto.facturacion.request.SriLog;

import java.sql.SQLException;

public interface ComprobanteElectronicoRepository {
    Integer guardarComprobanteElectronico(ComprobanteElectronico comprobante) throws SQLException;
    void guardarSriLog(SriLog log) throws SQLException;
    void actualizarComprobanteElectronico(ComprobanteElectronico comprobante) throws SQLException;

    // --- Nuevo método ---
    ComprobanteElectronico buscarComprobantePorClaveAcceso(String claveAcceso) throws SQLException;
}
