package com.empresa.facturacion.electronica.dto.facturacion.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AutorizacionResponse {
    private boolean autorizado;
    private String numeroAutorizacion;
    private String estado;
    private String mensaje;
    private String claveAcceso;
    private String pdfPath; // opcional, si deseas enviar esta info al front
}
