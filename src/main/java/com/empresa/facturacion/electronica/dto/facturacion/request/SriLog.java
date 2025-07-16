package com.empresa.facturacion.electronica.dto.facturacion.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SriLog {
    public enum Etapa {
        GENERACION, FIRMA, ENVIO_SRI, AUTORIZACION, ENVIO_CLIENTE
    }

    public enum TipoMensaje {
        INFO, ERROR, ADVERTENCIA
    }

    private Integer idLog;
    private Integer idComprobante;
    private Etapa etapa;
    private String estadoEnvio;
    private String codigoError;
    private String mensaje;
    private TipoMensaje tipo;
    private String origen;
    private LocalDateTime fechaLog;


}
