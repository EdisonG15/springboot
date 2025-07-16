package com.empresa.facturacion.electronica.controllers;

import com.empresa.facturacion.electronica.dto.common.response.StandardResponse;
import com.empresa.facturacion.electronica.dto.facturacion.response.AutorizacionResponse;
import com.empresa.facturacion.electronica.services.IFacturaSriService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/api/factura")
public class FacturaController {
    private final IFacturaSriService facturaService;

    public FacturaController(IFacturaSriService facturaService) {
        this.facturaService = facturaService;
    }

    @PostMapping("/emitir/{facturaId}")
   /* @PostMapping("/enviar/{id}")*/
    public ResponseEntity<StandardResponse> emitirFacturaElectronica(@PathVariable Integer facturaId) {
        try {
            System.out.println("Controller: Solicitud para emitir factura ID: " + facturaId);

            if (facturaId == null || facturaId <= 0) {
                return ResponseEntity.badRequest().body(
                        StandardResponse.builder()
                                .code(400)
                                .message("ID de factura inválido.")
                                .data(Collections.emptyMap())
                                .build()
                );
            }

            StandardResponse result = facturaService.procesarYEnviarFactura(facturaId);
            System.out.println("Controller: Resultado del proceso: " + result.getMessage());

            return ResponseEntity.status(result.getCode()).body(result);

        } catch (RuntimeException e) {
            System.err.println("Controller: Error al emitir factura ID " + facturaId + ": " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                    StandardResponse.builder()
                            .code(500)
                            .message("Error al emitir factura: " + e.getMessage())
                            .data(Collections.emptyMap())
                            .build()
            );

        } catch (Exception e) {
            System.err.println("Controller: Error inesperado al emitir factura ID " + facturaId + ": " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(
                    StandardResponse.builder()
                            .code(500)
                            .message("Error inesperado en el servidor.")
                            .data(Collections.emptyMap())
                            .build()
            );
        }
    }

    @GetMapping("/comprobar/{claveAcceso}")
    public ResponseEntity<StandardResponse> comprobarAutorizacion(@PathVariable String claveAcceso) {
        try {
            AutorizacionResponse resultado = facturaService.comprobarEstadoDeAutorizacion(claveAcceso);

            int code = resultado.isAutorizado() ? 200 : 400;

      /*      StandardResponse response = StandardResponse.builder()
                    .code(code)
                    .message(resultado.getMensaje())
                    .data(Map.of(
                            "estado", resultado.getEstado(),
                            "numeroAutorizacion", resultado.getNumeroAutorizacion(),
                            "claveAcceso", resultado.getClaveAcceso(),
                            "pdfPath", resultado.getPdfPath() // opcional
                    ))
                    .build();*/
            Map<String, Object> data = new HashMap<>();
            data.put("estado", resultado.getEstado());
            data.put("numeroAutorizacion", resultado.getNumeroAutorizacion());
            data.put("claveAcceso", resultado.getClaveAcceso());
          /*  data.put("pdfPath", resultado.getPdfPath());*/

            StandardResponse response = StandardResponse.builder()
                    .code(code)
                    .message(resultado.getMensaje())
                    .data(data)
                    .build();

            return ResponseEntity.status(code).body(response);

        } catch (Exception e) {
            return ResponseEntity.status(500).body(
                    StandardResponse.builder()
                            .code(500)
                            .message("Error interno al consultar al SRI: " + e.getMessage())
                            .data(Collections.emptyMap())
                            .build()
            );
        }
    }
}

       /* @GetMapping("/comprobar/{claveAcceso}")
        public ResponseEntity<StandardResponse> comprobarAutorizacion(@PathVariable String claveAcceso) {
          *//*  log.info("Solicitud para comprobar autorización con clave: {}", claveAcceso);
*//*
            try {
                String resultado = facturaService.comprobarEstadoDeAutorizacion(claveAcceso);

                boolean esAutorizado = resultado.contains("AUTORIZADA");
                int code = esAutorizado ? 200 : 400;

                Map<String, Object> data = new HashMap<>();
                data.put("detalle", resultado);

                StandardResponse response = StandardResponse.builder()
                        .code(code)
                        .message(esAutorizado ? "Factura autorizada correctamente." : "Factura no autorizada.")
                        .data(data)
                        .build();

                return ResponseEntity.status(code).body(response);

            } catch (Exception e) {
              *//*  log.error("❌ Error comprobando autorización para clave {}: {}", claveAcceso, e.getMessage(), e);
*//*
                StandardResponse response = StandardResponse.builder()
                        .code(500)
                        .message("Error interno al comprobar autorización: " + e.getMessage())
                        .data(Collections.emptyMap())
                        .build();

                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        }
    }

*/
//    private final IFacturaSriService facturaService; // Dependencia de la interfaz
//
//    // El constructor recibe la interfaz, no la implementación concreta
//    public FacturaController(IFacturaSriService facturaService) {
//        this.facturaService = facturaService;
//    }
//
//    /**
//     * Maneja la solicitud para emitir una factura electrónica.
//     *
//     * @param facturaId El ID de la factura a emitir.
//     */
//    public void emitirFacturaElectronica(Integer facturaId) {
//        try {
//            System.out.println("Controller: Solicitud para emitir factura ID: " + facturaId);
//            String result = facturaService.procesarYEnviarFactura(facturaId);
//            System.out.println("Controller: Resultado del proceso: " + result);
//        } catch (Exception e) {
//            System.err.println("Controller: Error al emitir factura ID " + facturaId + ": " + e.getMessage());
//            e.printStackTrace();
//        }
//    }

