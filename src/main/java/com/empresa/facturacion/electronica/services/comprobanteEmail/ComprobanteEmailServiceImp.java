package com.empresa.facturacion.electronica.services.comprobanteEmail;

import com.empresa.facturacion.electronica.dto.cliente.response.Cliente;
import com.empresa.facturacion.electronica.dto.common.response.StandardResponse;
import com.empresa.facturacion.electronica.dto.empresa.response.Empresa;
import com.empresa.facturacion.electronica.dto.facturacion.request.ComprobanteElectronico;

import com.empresa.facturacion.electronica.dto.facturacion.request.SriLog;
import com.empresa.facturacion.electronica.repositories.cliente.ClienteRepository;
import com.empresa.facturacion.electronica.repositories.comprobante.ComprobanteElectronicoRepository;
import com.empresa.facturacion.electronica.repositories.empresa.EmpresaRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map; // Para el Map.of en la respuesta
import javax.mail.MessagingException;

@Service
public class ComprobanteEmailServiceImp implements ComprobanteEmailService{
    private static final Logger log = LoggerFactory.getLogger(ComprobanteEmailService.class);

    private final ComprobanteElectronicoRepository comprobanteElectronicoRepository;
    private final EmpresaRepository empresaRepository;
    private final ClienteRepository clienteRepository;
    private final EmailService emailService;

    // Inyección de dependencias
    public ComprobanteEmailServiceImp(
            ComprobanteElectronicoRepository comprobanteElectronicoRepository,
            EmpresaRepository empresaRepository,
            ClienteRepository clienteRepository,
            EmailService emailService) {
        this.comprobanteElectronicoRepository = comprobanteElectronicoRepository;
        this.empresaRepository = empresaRepository;
        this.clienteRepository = clienteRepository;
        this.emailService = emailService;
    }
    @Override
    public StandardResponse enviarComprobantePorCorreo(String claveAcceso) throws Exception {
        log.info("Iniciando envío de comprobante por correo para clave de acceso: {}", claveAcceso);

        ComprobanteElectronico comprobante = null;
        Empresa empresa = null;
        Cliente cliente = null;

        try {
            // 1. Buscar el comprobante electrónico en la BD
            comprobante = comprobanteElectronicoRepository.buscarComprobantePorClaveAcceso(claveAcceso);
            if (comprobante == null) {
                log.warn("Comprobante con clave de acceso {} no encontrado en la BD.", claveAcceso);
                return StandardResponse.builder()
                        .code(404)
                        .message("Comprobante con clave de acceso " + claveAcceso + " no encontrado.")
                        .data(null)
                        .build();
            }

            // Validar que el comprobante esté AUTORIZADO antes de intentar enviarlo
            if (comprobante.getIdEstadoEmision() != 4) { // Asumiendo que 4 es el ID para "AUTORIZADO"
                log.warn("El comprobante con clave de acceso {} no está AUTORIZADO. Estado actual: {}", claveAcceso, comprobante.getIdEstadoEmision());
                return StandardResponse.builder()
                        .code(400)
                        .message("El comprobante con clave de acceso " + claveAcceso + " no está AUTORIZADO para envío por correo.")
                        .data(null)
                        .build();
            }

            // 2. Obtener detalles de la empresa (emisora)
            // *** IMPORTANTE: NECESITAS OBTENER EL ID DE LA EMPRESA ASOCIADA AL COMPROBANTE ***
            // Si tu ComprobanteElectronico no tiene idEmpresa, deberías buscarlo
            // a través de la venta asociada (comprobante.getIdVenta()).
            // Por ejemplo:
            // FacturaElectronica facturaAsociada = facturaSriRepository.buscarFacturaById(comprobante.getIdVenta());
            // Integer idEmpresaEmisora = facturaAsociada.getIdEmpresa();
            // Para este ejemplo, voy a asumir un ID fijo o que ya lo tienes:
            Integer idEmpresaEmisora = 1; // <--- REEMPLAZA ESTE 1 CON EL ID REAL DE LA EMPRESA EMISORA
            empresa = empresaRepository.buscarEmpresaById(idEmpresaEmisora);
            if (empresa == null) {
                log.error("Datos de la empresa emisora (ID: {}) no encontrados para el envío de correo.", idEmpresaEmisora);
                return StandardResponse.builder()
                        .code(500)
                        .message("Error interno: Datos de la empresa emisora no encontrados.")
                        .data(null)
                        .build();
            }

            // 3. Obtener detalles del cliente (receptor)
            // *** IMPORTANTE: NECESITAS OBTENER EL ID DEL CLIENTE ASOCIADO AL COMPROBANTE ***
            // Similar al idEmpresa, si tu ComprobanteElectronico no tiene idCliente, búscalo.
            // Integer idClienteReceptor = facturaAsociada.getIdCliente();
            Integer idClienteReceptor = comprobante.getIdCliente(); // <--- ASEGÚRATE DE QUE COMPROBANTE.GETIDCLIENTE() SEA VÁLIDO

            if (idClienteReceptor == null) {
                log.error("ID de cliente no disponible en el comprobante electrónico para la clave de acceso: {}", claveAcceso);
                return StandardResponse.builder()
                        .code(400)
                        .message("No se pudo obtener el ID del cliente para el comprobante.")
                        .data(null)
                        .build();
            }

            cliente = clienteRepository.buscarClienteById(idClienteReceptor);
            if (cliente == null) {
                log.error("Datos del cliente (ID: {}) no encontrados.", idClienteReceptor);
                return StandardResponse.builder()
                        .code(404)
                        .message("Datos del cliente no encontrados para el comprobante.")
                        .data(null)
                        .build();
            }

            String toEmail = cliente.getEmail();
            if (toEmail == null || toEmail.trim().isEmpty()) {
                log.error("El correo electrónico del cliente (ID: {}) está vacío o nulo.", idClienteReceptor);
                return StandardResponse.builder()
                        .code(400)
                        .message("El comprobante no puede ser enviado por correo: el cliente no tiene un email registrado.")
                        .data(null)
                        .build();
            }

            // 4. Obtener rutas de los archivos XML y PDF
            String xmlPathStr = comprobante.getRutaXmlAutorizado(); // O ruta_xml_firmado si el autorizado no está
            String pdfPathStr = comprobante.getPdfGenerado();

            if (xmlPathStr == null || pdfPathStr == null) {
                log.error("Rutas de XML o PDF no encontradas para el comprobante {}.", claveAcceso);
                return StandardResponse.builder()
                        .code(400)
                        .message("Archivos XML o PDF no disponibles para el comprobante autorizado.")
                        .data(null)
                        .build();
            }

            File xmlFile = Paths.get(xmlPathStr).toFile();
            File pdfFile = Paths.get(pdfPathStr).toFile();

            if (!xmlFile.exists() || !pdfFile.exists()) {
                log.error("Uno o ambos archivos adjuntos no existen: XML={}, PDF={}", xmlPathStr, pdfPathStr);
                return StandardResponse.builder()
                        .code(404)
                        .message("Uno o ambos archivos adjuntos (XML/PDF) no fueron encontrados en el servidor.")
                        .data(null)
                        .build();
            }

            // 5. Preparar asunto y cuerpo del correo electrónico
            String subject = empresa.getAsuntoCorreoCliente() != null && !empresa.getAsuntoCorreoCliente().isEmpty()
                    ? empresa.getAsuntoCorreoCliente()
                    : "Comprobante Electrónico de " + empresa.getRazonSocial();

            String body = empresa.getMensajeCorreoCliente() != null && !empresa.getMensajeCorreoCliente().isEmpty()
                    ? empresa.getMensajeCorreoCliente()
                    : "Estimado/a {cliente_nombre},<br><br>Adjunto encontrará su comprobante electrónico con Clave de Acceso: {clave_acceso}.<br><br>Gracias por su preferencia.<br><br>" + empresa.getRazonSocial();

            // Personalizar el cuerpo del correo con datos del cliente y la factura
            body = body.replace("{cliente_nombre}", cliente.getNombre() + " " + cliente.getApellido())
                    .replace("{clave_acceso}", claveAcceso)
                    .replace("{razon_social_empresa}", empresa.getRazonSocial());


            // 6. Enviar el correo
            emailService.sendEmailWithAttachments(
                    empresa.getEmail(), // Correo del emisor
                    toEmail,            // Correo del destinatario
                    subject,
                    body,
                    xmlFile,
                    pdfFile
            );

            // 7. Actualizar el estado en comprobantes_electronicos y loguear el éxito
            try {
                comprobante.setIdEnviadoCliente(1); // Asumiendo 1 = ENVIADO_CORREO_EXITOSO
                comprobante.setFechaEnvioCliente(LocalDateTime.now());
                comprobanteElectronicoRepository.actualizarComprobanteElectronico(comprobante);

                SriLog logEmailSuccess = new SriLog();
                logEmailSuccess.setIdComprobante(comprobante.getIdComprobante());
                logEmailSuccess.setEtapa(SriLog.Etapa.ENVIO_CLIENTE); // Asegúrate de tener esta etapa en SriLog.Etapa
                logEmailSuccess.setEstadoEnvio("EXITOSO");
                logEmailSuccess.setMensaje("Comprobante enviado por correo exitosamente al cliente: " + toEmail);
                logEmailSuccess.setTipo(SriLog.TipoMensaje.INFO);
                comprobanteElectronicoRepository.guardarSriLog(logEmailSuccess);
            } catch (Exception e) {
                log.error("Error al actualizar la BD o guardar log de envío de correo exitoso: {}", e.getMessage(), e);
                // No relanzar, el correo ya se envió, solo falló la actualización de la DB
            }

//            return StandardResponse.builder()
//                    .code(200)
//                    .message("Comprobante enviado por correo exitosamente.")
//                    .data(Map.of("claveAcceso", claveAcceso, "toEmail", toEmail))
//                    .build();
            Map<String, Object> data = new HashMap<>();
            data.put("claveAcceso", claveAcceso);
            data.put("toEmail", toEmail);

            return StandardResponse.builder()
                    .code(200)
                    .message("Comprobante enviado por correo exitosamente.")
                    .data(data)
                    .build();

        } catch (MessagingException e) {
            log.error("Error de mensajería al enviar correo para clave {}: {}", claveAcceso, e.getMessage(), e);
            // Loguear y actualizar el estado en caso de fallo de envío por correo
            if (comprobante != null) {
                try {
                    SriLog logEmailFailure = new SriLog();
                    logEmailFailure.setIdComprobante(comprobante.getIdComprobante());
                    logEmailFailure.setEtapa(SriLog.Etapa.ENVIO_CLIENTE);
                    logEmailFailure.setEstadoEnvio("FALLIDO");
                    logEmailFailure.setCodigoError("EMAIL_SEND_ERROR");
                    logEmailFailure.setMensaje("Fallo al enviar correo al cliente: " + e.getMessage());
                    logEmailFailure.setTipo(SriLog.TipoMensaje.ERROR);
                    comprobanteElectronicoRepository.guardarSriLog(logEmailFailure);

                    comprobante.setIdEnviadoCliente(2); // Asumiendo 2 = FALLO_ENVIO_CORREO
                    comprobante.setMensajeRespuesta("Fallo envío correo: " + e.getMessage());
                    comprobanteElectronicoRepository.actualizarComprobanteElectronico(comprobante);
                } catch (Exception logEx) {
                    log.error("Error al guardar log de fallo de envío de correo: {}", logEx.getMessage());
                }
            }
            return StandardResponse.builder()
                    .code(500)
                    .message("Error al enviar el correo electrónico: " + e.getMessage())
                    .data(null)
                    .build();
        } catch (Exception e) {
            log.error("Error inesperado al enviar comprobante por correo para clave {}: {}", claveAcceso, e.getMessage(), e);
            return StandardResponse.builder()
                    .code(500)
                    .message("Error interno del servidor al procesar el envío de correo: " + e.getMessage())
                    .data(null)
                    .build();
        }
    }
}
