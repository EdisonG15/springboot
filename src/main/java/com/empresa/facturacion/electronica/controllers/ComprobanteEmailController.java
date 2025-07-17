package com.empresa.facturacion.electronica.controllers;
import com.empresa.facturacion.electronica.dto.common.response.StandardResponse;
import com.empresa.facturacion.electronica.services.comprobanteEmail.ComprobanteEmailService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/comprobantes")
public class ComprobanteEmailController {

    private static final Logger log = LoggerFactory.getLogger(ComprobanteEmailController.class);

    private final ComprobanteEmailService comprobanteEmailService;

    // Inyección de dependencias
    public ComprobanteEmailController(ComprobanteEmailService comprobanteEmailService) {
        this.comprobanteEmailService = comprobanteEmailService;
    }

    @PostMapping("/enviar-email/{claveAcceso}")
    public ResponseEntity<StandardResponse> enviarEmailComprobante(@PathVariable String claveAcceso) {
        try {
            StandardResponse response = comprobanteEmailService.enviarComprobantePorCorreo(claveAcceso);
            return ResponseEntity.status(response.getCode()).body(response);
        } catch (Exception e) {
            log.error("Error en el controlador al intentar enviar email para clave {}: {}", claveAcceso, e.getMessage(), e);
            return ResponseEntity.status(500).body(StandardResponse.builder()
                    .code(500)
                    .message("Error interno del servidor al procesar la solicitud de envío de correo: " + e.getMessage())
                    .data(null)
                    .build());
        }
    }
}
