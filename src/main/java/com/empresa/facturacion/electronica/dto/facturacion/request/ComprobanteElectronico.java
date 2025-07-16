package com.empresa.facturacion.electronica.dto.facturacion.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ComprobanteElectronico {
    private Integer idComprobante;
    private String tipoDocumento;
    private Integer idVenta;
    private Integer idCliente;
    private String numeroAutorizacion;
    private String claveAcceso;
    private String numeroDocumento; // Esto es 'establecimiento_codigo' + 'punto_emision_codigo' + 'nro_boletaSri'
    private Integer idAmbiente;
    private Integer idEstadoEmision;
    private LocalDateTime fechaEmision;
    private LocalDateTime fechaAutorizacion;
    private Integer idTipoEmision;
    private String mensajeRespuesta;
    private String rutaXmlGenerado;
    private String rutaXmlFirmado;
    private String rutaXmlAutorizado;
    private String pdfGenerado;
    private Integer idEnviadoCliente;
    private LocalDateTime fechaEnvioCliente;
    private LocalDateTime fechaRegistro;

}
