package com.empresa.facturacion.electronica.services;

import com.empresa.facturacion.electronica.dto.facturacion.request.ComprobanteElectronico;
import com.empresa.facturacion.electronica.dto.facturacion.request.SriLog;
import com.empresa.facturacion.electronica.dto.facturacion.response.AutorizacionResponse;
import com.empresa.facturacion.electronica.repositories.comprobante.ComprobanteElectronicoRepository;
import com.empresa.facturacion.electronica.utils.FacturaPdfGenerator;
import com.empresa.facturacion.electronica.utils.FacturacionElectronica;
import com.empresa.facturacion.electronica.utils.PdfGenerator;
import ec.gob.sri.autorizacion.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.FopFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import ec.gob.sri.recepcion.RecepcionComprobantesOffline;
import ec.gob.sri.recepcion.RecepcionComprobantesOfflineService;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.ws.handler.Handler;
import ec.gob.sri.ws.autorizacion.AutorizacionComprobantesOfflineService;
import ec.gob.sri.ws.autorizacion.AutorizacionComprobantesOffline;
import ec.gob.sri.ws.autorizacion.RespuestaComprobante; // <--- ¡CAMBIO AQUÍ!
import ec.gob.sri.ws.autorizacion.Autorizacion; // Esta debería seguir siendo la misma
import org.xml.sax.InputSource;

import java.io.File;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import javax.xml.namespace.QName;
import javax.xml.ws.BindingProvider;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.stream.Collectors;

import ec.gob.sri.recepcion.RespuestaSolicitud; // Esta es la clase para la respuesta de recepción

@Slf4j
@Service
public class SriClient implements ISriClient {
    static {
        // Estas propiedades son para habilitar el log de tráfico SOAP (útil para depuración)
        System.setProperty("com.sun.xml.ws.transport.http.client.HttpTransportPipe.dump", "true");
        System.setProperty("com.sun.xml.internal.ws.transport.http.client.HttpTransportPipe.dump", "true");
        System.setProperty("com.sun.xml.ws.transport.http.HttpAdapter.dump", "true");
        System.setProperty("com.sun.xml.internal.ws.transport.http.HttpAdapter.dump", "true");
        System.setProperty("com.sun.xml.ws.transport.http.client.HttpTransportPipe.dumpTreshold", "999999");
        log.info("SOAP logging activado para tráfico de envío y recepción.");
    }

    private final String recepcionUrl;
    private final String autorizacionUrl;
    private final String authorizedXmlPath; // Nuevo campo para la ruta donde se guardarán los XMLs autorizados
    private final ComprobanteElectronicoRepository comprobanteElectronicoRepository;
    public SriClient(@Value("${sri.ambiente}") String ambiente, @Value("${sri.authorized-xml-path}") String authorizedXmlPath, ComprobanteElectronicoRepository comprobanteElectronicoRepository) {
        this.comprobanteElectronicoRepository = comprobanteElectronicoRepository;
        String sriRecepcionWsUrlPruebas = "https://celcer.sri.gob.ec/comprobantes-electronicos-ws/RecepcionComprobantesOffline";
        String sriAutorizacionWsUrlPruebas = "https://celcer.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline";

        String sriRecepcionWsUrlProduccion = "https://servicios.sri.gob.ec/comprobantes-electronicos-ws/RecepcionComprobantesOffline";
        String sriAutorizacionWsUrlProduccion = "https://servicios.sri.gob.ec/comprobantes-electronicos-ws/AutorizacionComprobantesOffline";

        if ("produccion".equalsIgnoreCase(ambiente)) {
            this.recepcionUrl = sriRecepcionWsUrlProduccion;
            this.autorizacionUrl = sriAutorizacionWsUrlProduccion;
        } else { // Por defecto o para "pruebas"
            this.recepcionUrl = sriRecepcionWsUrlPruebas;
            this.autorizacionUrl = sriAutorizacionWsUrlPruebas;
        }
        this.authorizedXmlPath = authorizedXmlPath; // Inicializa la ruta
    }

    public String enviarFacturaASri(String signedXml, Integer idComprobante) throws Exception {
        // 1. Convertir el XML firmado a bytes
        byte[] xmlBytes = signedXml.getBytes(StandardCharsets.UTF_8);

        // --- Log ENVIO_SRI (inicio) ---
        try {
            SriLog logEnvioStart = new SriLog();
            logEnvioStart.setIdComprobante(idComprobante);
            logEnvioStart.setEtapa(SriLog.Etapa.ENVIO_SRI);
            logEnvioStart.setEstadoEnvio("INTENTO_ENVIO");
            logEnvioStart.setMensaje("Intentando enviar XML al SRI.");
            logEnvioStart.setTipo(SriLog.TipoMensaje.INFO);
            comprobanteElectronicoRepository.guardarSriLog(logEnvioStart);
        } catch (Exception e) {
            System.err.println("Error al guardar log de inicio de envío al SRI: " + e.getMessage());
        }

        // 2. Crear el objeto del servicio SOAP
        URL wsdlLocation = new URL(recepcionUrl + "?wsdl");
        QName qname = new QName("http://ec.gob.sri.ws.recepcion", "RecepcionComprobantesOfflineService");

        RecepcionComprobantesOfflineService service = new RecepcionComprobantesOfflineService(wsdlLocation, qname);
        RecepcionComprobantesOffline port = service.getRecepcionComprobantesOfflinePort();

        // 3. Opcional: Configurar timeouts
        Map<String, Object> context = ((BindingProvider) port).getRequestContext();
        context.put("com.sun.xml.ws.connect.timeout", 5000);
        context.put("com.sun.xml.ws.request.timeout", 10000);

        RespuestaSolicitud respuesta;
        try {
            // 4. Llamar al servicio del SRI
            respuesta = port.validarComprobante(xmlBytes);
        } catch (Exception e) {
            // --- Log ENVIO_SRI (falla) ---
            try {
                SriLog logEnvioError = new SriLog();
                logEnvioError.setIdComprobante(idComprobante);
                logEnvioError.setEtapa(SriLog.Etapa.ENVIO_SRI);
                logEnvioError.setEstadoEnvio("FALLIDO");
                logEnvioError.setMensaje("Error de comunicación con el SRI: " + e.getMessage());
                logEnvioError.setTipo(SriLog.TipoMensaje.ERROR);
                logEnvioError.setCodigoError("COMM_ERR"); // Código de error personalizado
                comprobanteElectronicoRepository.guardarSriLog(logEnvioError);
            } catch (Exception logEx) {
                System.err.println("Error al guardar log de error de envío al SRI: " + logEx.getMessage());
            }
            throw e; // Relanzar la excepción original
        }


        // 5. Procesar respuesta
        if ("RECIBIDA".equalsIgnoreCase(respuesta.getEstado())) {
            // --- Log ENVIO_SRI (éxito) ---
            try {
                SriLog logEnvioSuccess = new SriLog();
                logEnvioSuccess.setIdComprobante(idComprobante);
                logEnvioSuccess.setEtapa(SriLog.Etapa.ENVIO_SRI);
                logEnvioSuccess.setEstadoEnvio("RECIBIDA");
                logEnvioSuccess.setMensaje("Factura RECIBIDA por el SRI.");
                logEnvioSuccess.setTipo(SriLog.TipoMensaje.INFO);
                comprobanteElectronicoRepository.guardarSriLog(logEnvioSuccess);
            } catch (Exception e) {
                System.err.println("Error al guardar log de recepción exitosa por el SRI: " + e.getMessage());
            }
            return "Factura RECIBIDA por el SRI.";
        } else { // El estado más común aquí es "DEVUELTA"
            StringBuilder errores = new StringBuilder("Factura NO RECIBIDA (DEVUELTA) por el SRI:\n");
            final String[] errorCode = {"SRI_DEV"}; // Código de error predeterminado para DEVUELTA

            // Verifica que la estructura de comprobantes y mensajes exista.
            if (respuesta.getComprobantes() != null && respuesta.getComprobantes().getComprobante() != null) {
                // Itera sobre cada comprobante incluido en la respuesta
                respuesta.getComprobantes().getComprobante().forEach(comprobante -> {
                    if (comprobante.getMensajes() != null && !comprobante.getMensajes().getMensaje().isEmpty()) {
                        // Itera sobre cada mensaje de error para el comprobante actual
                        for (ec.gob.sri.recepcion.Mensaje msg : comprobante.getMensajes().getMensaje()) {
                            errores.append("- TIPO: ").append(msg.getTipo()).append(", IDENTIFICADOR: ").append(msg.getIdentificador()).append(", MENSAJE: ").append(msg.getMensaje());

                            if (msg.getInformacionAdicional() != null && !msg.getInformacionAdicional().trim().isEmpty()) {
                                errores.append(", INFO ADICIONAL: ").append(msg.getInformacionAdicional());
                            }
                            errores.append("\n");
                            // Captura el primer código de error si está disponible
                            if (errorCode[0].equals("SRI_DEV") && msg.getIdentificador() != null) {
                                errorCode[0] = msg.getIdentificador();
                            }
                        }
                    }
                });
            }

            // Mensaje de respaldo si, por alguna razón, no se encontraron errores detallados
            if (errores.toString().equals("Factura NO RECIBIDA (DEVUELTA) por el SRI:\n")) {
                errores.append("El SRI no detalló los errores. Estado de la respuesta: ").append(respuesta.getEstado());
            }

            // --- Log ENVIO_SRI (devuelta) ---
            try {
                SriLog logEnvioDevuelta = new SriLog();
                logEnvioDevuelta.setIdComprobante(idComprobante);
                logEnvioDevuelta.setEtapa(SriLog.Etapa.ENVIO_SRI);
                logEnvioDevuelta.setEstadoEnvio("DEVUELTA");
                logEnvioDevuelta.setMensaje(errores.toString());
                logEnvioDevuelta.setTipo(SriLog.TipoMensaje.ERROR);
                logEnvioDevuelta.setCodigoError(errorCode[0]);
                comprobanteElectronicoRepository.guardarSriLog(logEnvioDevuelta);
            } catch (Exception e) {
                System.err.println("Error al guardar log de factura DEVUELTA por el SRI: " + e.getMessage());
            }

            return errores.toString();
        }
    }

 /*   @Override
    public String enviarFacturaASri(String signedXml) throws Exception {
        // 1. Convertir el XML firmado a bytes
        byte[] xmlBytes = signedXml.getBytes(StandardCharsets.UTF_8);

        // 2. Crear el objeto del servicio SOAP
        URL wsdlLocation = new URL(recepcionUrl + "?wsdl");
        QName qname = new QName("http://ec.gob.sri.ws.recepcion", "RecepcionComprobantesOfflineService");

        RecepcionComprobantesOfflineService service = new RecepcionComprobantesOfflineService(wsdlLocation, qname);
        RecepcionComprobantesOffline port = service.getRecepcionComprobantesOfflinePort();

        // 3. Opcional: Configurar timeouts
        Map<String, Object> context = ((BindingProvider) port).getRequestContext();
        context.put("com.sun.xml.ws.connect.timeout", 5000);
        context.put("com.sun.xml.ws.request.timeout", 10000);

        // 4. Llamar al servicio del SRI
        RespuestaSolicitud respuesta = port.validarComprobante(xmlBytes);

        // 5. Procesar respuesta
        if ("RECIBIDA".equalsIgnoreCase(respuesta.getEstado())) {
            return "Factura RECIBIDA por el SRI.";
        } else { // El estado más común aquí es "DEVUELTA"
            StringBuilder errores = new StringBuilder("Factura NO RECIBIDA (DEVUELTA) por el SRI:\n");

            // Verifica que la estructura de comprobantes y mensajes exista.
            if (respuesta.getComprobantes() != null && respuesta.getComprobantes().getComprobante() != null) {
                // Itera sobre cada comprobante incluido en la respuesta
                respuesta.getComprobantes().getComprobante().forEach(comprobante -> {
                    if (comprobante.getMensajes() != null && !comprobante.getMensajes().getMensaje().isEmpty()) {
                        // Itera sobre cada mensaje de error para el comprobante actual
                        for (ec.gob.sri.recepcion.Mensaje msg : comprobante.getMensajes().getMensaje()) {
                            errores.append("- TIPO: ").append(msg.getTipo()).append(", IDENTIFICADOR: ").append(msg.getIdentificador()).append(", MENSAJE: ").append(msg.getMensaje());

                            if (msg.getInformacionAdicional() != null && !msg.getInformacionAdicional().trim().isEmpty()) {
                                errores.append(", INFO ADICIONAL: ").append(msg.getInformacionAdicional());
                            }
                            errores.append("\n");
                        }
                    }
                });
            }

            // Mensaje de respaldo si, por alguna razón, no se encontraron errores detallados
            if (errores.toString().equals("Factura NO RECIBIDA (DEVUELTA) por el SRI:\n")) {
                errores.append("El SRI no detalló los errores. Estado de la respuesta: ").append(respuesta.getEstado());
            }

            return errores.toString();
        }

    }*/
    @Override
    public AutorizacionResponse comprobarEstadoDeAutorizacion(String claveAcceso) throws Exception {
        log.info("Comprobando estado de autorización para clave de acceso: " + claveAcceso);

        // --- 1. Buscar el comprobante existente en tu BD usando la claveAcceso ---
        ComprobanteElectronico existingComprobante = null;
        try {
            existingComprobante = comprobanteElectronicoRepository.buscarComprobantePorClaveAcceso(claveAcceso);
            if (existingComprobante == null) {
                log.warn("No se encontró un registro de comprobante electrónico en la BD para la clave de acceso: " + claveAcceso + ". No se podrán actualizar los registros de BD para esta consulta.");
                // Decide si quieres lanzar una excepción aquí o simplemente continuar sin actualizar la BD
                // Por ahora, el flujo continuará, pero las actualizaciones de BD no se realizarán.
            }
        } catch (Exception dbEx) {
            log.error("Error al buscar comprobante por clave de acceso en la BD: " + dbEx.getMessage(), dbEx);
            // Esto es un error interno, decide si abortar el proceso o continuar
            // throw new RuntimeException("Error interno al buscar comprobante en DB.", dbEx);
        }

        // --- 2. Preparar y llamar al servicio del SRI ---
        URL wsdlLocation = new URL(autorizacionUrl + "?wsdl");
        QName qname = new QName("http://ec.gob.sri.ws.autorizacion", "AutorizacionComprobantesOfflineService");

        AutorizacionComprobantesOfflineService service = new AutorizacionComprobantesOfflineService(wsdlLocation, qname);
        AutorizacionComprobantesOffline port = service.getAutorizacionComprobantesOfflinePort();

        Map<String, Object> context = ((BindingProvider) port).getRequestContext();
        context.put("com.sun.xml.ws.connect.timeout", 5000);
        context.put("com.sun.xml.ws.request.timeout", 10000);

        List<Handler> handlerChain = new ArrayList<>();
        handlerChain.add(new SoapLoggingHandler()); // Asegúrate de que SoapLoggingHandler esté bien definido
        ((BindingProvider) port).getBinding().setHandlerChain(handlerChain);

        RespuestaComprobante respuesta = null;
        try {
            // Log de inicio de consulta de autorización
            if (existingComprobante != null) {
                try {
                    SriLog logInicioConsulta = new SriLog();
                    logInicioConsulta.setIdComprobante(existingComprobante.getIdComprobante());
                    logInicioConsulta.setEtapa(SriLog.Etapa.AUTORIZACION);
                    logInicioConsulta.setEstadoEnvio("INICIADO");
                    logInicioConsulta.setMensaje("Iniciando consulta de autorización al SRI.");
                    logInicioConsulta.setTipo(SriLog.TipoMensaje.INFO);
                    comprobanteElectronicoRepository.guardarSriLog(logInicioConsulta);
                } catch (Exception logEx) {
                    log.error("Error al guardar log de inicio de consulta de autorización: " + logEx.getMessage());
                }
            }

            respuesta = port.autorizacionComprobante(claveAcceso);
            log.info("Respuesta del SRI (objeto): " + (respuesta != null ? "no nula" : "nula"));

        } catch (Exception sriCallEx) {
            log.error("Error al llamar al servicio de autorización del SRI para clave {}: {}", claveAcceso, sriCallEx.getMessage(), sriCallEx);
            // Log de error de comunicación con el SRI
            if (existingComprobante != null) {
                try {
                    SriLog logError = new SriLog();
                    logError.setIdComprobante(existingComprobante.getIdComprobante());
                    logError.setEtapa(SriLog.Etapa.AUTORIZACION);
                    logError.setEstadoEnvio("FALLIDO");
                    logError.setCodigoError("SRI_COMM_ERR"); // Código de error personalizado
                    logError.setMensaje("Error de comunicación/respuesta del SRI al consultar autorización: " + sriCallEx.getMessage());
                    logError.setTipo(SriLog.TipoMensaje.ERROR);
                    comprobanteElectronicoRepository.guardarSriLog(logError);

                    // Opcional: Actualizar el estado del comprobante a un estado de error de consulta
                    existingComprobante.setIdEstadoEmision(99); // Un ID para "ERROR_CONSULTA_SRI"
                    existingComprobante.setMensajeRespuesta("Error al consultar autorización SRI: " + sriCallEx.getMessage());
                    comprobanteElectronicoRepository.actualizarComprobanteElectronico(existingComprobante);

                } catch (Exception logEx) {
                    log.error("Error al guardar log de fallo de autorización: " + logEx.getMessage());
                }
            }
            throw sriCallEx; // Relanza la excepción original
        }


        // --- 3. Procesar la respuesta del SRI y actualizar la BD ---
        if (respuesta == null || respuesta.getAutorizaciones() == null || respuesta.getAutorizaciones().getAutorizacion().isEmpty()) {
            // Log de que no se obtuvo respuesta de autorización
            if (existingComprobante != null) {
                try {
                    SriLog logNoResponse = new SriLog();
                    logNoResponse.setIdComprobante(existingComprobante.getIdComprobante());
                    logNoResponse.setEtapa(SriLog.Etapa.AUTORIZACION);
                    logNoResponse.setEstadoEnvio("SIN_RESPUESTA");
                    logNoResponse.setMensaje("No se obtuvo respuesta de autorización o no hay autorizaciones para la clave de acceso: " + claveAcceso);
                    logNoResponse.setTipo(SriLog.TipoMensaje.ADVERTENCIA);
                    comprobanteElectronicoRepository.guardarSriLog(logNoResponse);

                    // Opcional: Actualizar el estado del comprobante si no se obtuvo respuesta
                    existingComprobante.setIdEstadoEmision(5); // Por ejemplo, 5 = EN_PROCESO_SIN_RESPUESTA
                    existingComprobante.setMensajeRespuesta("SIN_RESPUESTA: No se obtuvo autorización del SRI.");
                    comprobanteElectronicoRepository.actualizarComprobanteElectronico(existingComprobante);

                } catch (Exception logEx) {
                    log.error("Error al guardar log de autorización sin respuesta: " + logEx.getMessage());
                }
            }
            return AutorizacionResponse.builder()
                    .autorizado(false)
                    .estado("SIN_RESPUESTA")
                    .numeroAutorizacion(null)
                    .mensaje("No se obtuvo respuesta de autorización o no hay autorizaciones para la clave de acceso: " + claveAcceso)
                    .claveAcceso(claveAcceso)
                    .build();
        }

        Autorizacion autorizacion = respuesta.getAutorizaciones().getAutorizacion().get(0);
        if ("AUTORIZADO".equalsIgnoreCase(autorizacion.getEstado())) {
            Path autorizacionXmlPath = null;
            Path comprobanteXmlPath = null;
            Path pdfPath = null;
            String generatedBaseFileName = null;

            try {
                // --- Generar directorios y guardar archivos XML ---
                LocalDate now = LocalDate.now();
                String year = String.valueOf(now.getYear());
                String month = String.format("%02d", now.getMonthValue());

                Path baseOutputDir = Paths.get(this.authorizedXmlPath, year, month);
                Files.createDirectories(baseOutputDir);

                String comprobanteXmlCdata = autorizacion.getComprobante();
                String unescapedComprobanteXml = "";
                if (comprobanteXmlCdata != null && !comprobanteXmlCdata.trim().isEmpty()) {
                    unescapedComprobanteXml = StringEscapeUtils.unescapeXml(comprobanteXmlCdata);

                    Path tempComprobanteXmlPath = baseOutputDir.resolve(claveAcceso + "_temp.xml");
                    Files.write(tempComprobanteXmlPath, unescapedComprobanteXml.getBytes(java.nio.charset.StandardCharsets.UTF_8));

                    // Asumo que FacturacionElectronica.generarNombreArchivo existe y funciona
                    generatedBaseFileName = FacturacionElectronica.generarNombreArchivo(tempComprobanteXmlPath);

                    comprobanteXmlPath = baseOutputDir.resolve(generatedBaseFileName + "_comprobante.xml");
                    autorizacionXmlPath = baseOutputDir.resolve(generatedBaseFileName + "_autorizacion.xml");
                    pdfPath = baseOutputDir.resolve(generatedBaseFileName + ".pdf");

                    Files.move(tempComprobanteXmlPath, comprobanteXmlPath, StandardCopyOption.REPLACE_EXISTING);
                    log.info("XML de Comprobante (firmado, del CDATA, desescapado) guardado en: " + comprobanteXmlPath.toAbsolutePath());

                } else {
                    log.warn("El comprobante XML dentro del CDATA está vacío o nulo para la clave de acceso: {}", claveAcceso);
                }

                // Generar el XML de Autorización completo (incluyendo el comprobante desescapado)
                JAXBContext jaxbContext = JAXBContext.newInstance(Autorizacion.class);
                Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
                jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

                StringWriter swAutorizacion = new StringWriter();
                jaxbMarshaller.marshal(autorizacion, swAutorizacion);
                String autorizacionXmlTemp = swAutorizacion.toString();

                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                dbFactory.setNamespaceAware(true);
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

                org.w3c.dom.Document doc = dBuilder.parse(new InputSource(new StringReader(autorizacionXmlTemp)));

                org.w3c.dom.NodeList comprobanteNodes = doc.getElementsByTagName("comprobante");
                if (comprobanteNodes.getLength() > 0) {
                    org.w3c.dom.Element comprobanteElement = (org.w3c.dom.Element) comprobanteNodes.item(0);
                    comprobanteElement.setTextContent("");
                    comprobanteElement.appendChild(doc.createCDATASection(unescapedComprobanteXml));
                }

                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                transformer.setOutputProperty(OutputKeys.INDENT, "yes");
                transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
                transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

                StringWriter finalSw = new StringWriter();
                transformer.transform(new DOMSource(doc), new StreamResult(finalSw));
                String autorizacionXmlCompletaFinal = finalSw.toString();

                Files.write(autorizacionXmlPath, autorizacionXmlCompletaFinal.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                log.info("XML de Autorización completo (con comprobante en CDATA) guardado en: " + autorizacionXmlPath.toAbsolutePath());

            } catch (Exception e) {
                log.error("Error al guardar los archivos XML para la clave de acceso {}: {}", claveAcceso, e.getMessage(), e);
                // Log de error de guardado de archivos
                if (existingComprobante != null) {
                    try {
                        SriLog logFileError = new SriLog();
                        logFileError.setIdComprobante(existingComprobante.getIdComprobante());
                        logFileError.setEtapa(SriLog.Etapa.AUTORIZACION);
                        logFileError.setEstadoEnvio("ERROR_ARCHIVOS");
                        logFileError.setCodigoError("FILE_SAVE_ERR");
                        logFileError.setMensaje("Error al guardar XMLs: " + e.getMessage());
                        logFileError.setTipo(SriLog.TipoMensaje.ERROR);
                        comprobanteElectronicoRepository.guardarSriLog(logFileError);
                    } catch (Exception logEx) {
                        log.error("Error al guardar log de error de archivo: " + logEx.getMessage());
                    }
                }
                throw new Exception("Error al guardar archivos XML: " + e.getMessage(), e);
            }

            // --- Generación de PDF ---
            if (comprobanteXmlPath != null) {
                try {
                    InputStream xslStream = getClass().getClassLoader().getResourceAsStream("facturaV2.xsl");
                    if (xslStream == null) {
                        throw new RuntimeException("No se encontró el recurso facturaV2.xsl en el classpath.");
                    }
                    FacturaPdfGenerator generator = new FacturaPdfGenerator();
                    generator.generarPDFConFOP(comprobanteXmlPath, xslStream, pdfPath);
                    log.info("✅ PDF generado en: " + pdfPath.toAbsolutePath());
                } catch (Exception e) {
                    log.error("Error al generar PDF para clave {}: {}", claveAcceso, e.getMessage(), e);
                    // Log de error de generación de PDF
                    if (existingComprobante != null) {
                        try {
                            SriLog logPdfError = new SriLog();
                            logPdfError.setIdComprobante(existingComprobante.getIdComprobante());
                            logPdfError.setEtapa(SriLog.Etapa.AUTORIZACION);
                            logPdfError.setEstadoEnvio("ERROR_PDF");
                            logPdfError.setCodigoError("PDF_GEN_ERR");
                            logPdfError.setMensaje("Error al generar PDF: " + e.getMessage());
                            logPdfError.setTipo(SriLog.TipoMensaje.ERROR);
                            comprobanteElectronicoRepository.guardarSriLog(logPdfError);
                        } catch (Exception logEx) {
                            log.error("Error al guardar log de error de PDF: " + logEx.getMessage());
                        }
                    }
                }
            } else {
                log.warn("No se pudo generar el PDF porque el XML del comprobante no se guardó.");
            }

            // --- Actualizar ComprobanteElectronico y Log para estado AUTORIZADO ---
            if (existingComprobante != null) {
                try {
                    existingComprobante.setIdEstadoEmision(4); // 4 = AUTORIZADO
                    existingComprobante.setNumeroAutorizacion(autorizacion.getNumeroAutorizacion());
                    // Conversión de fecha del SRI: asumiendo que getFechaAutorizacion() devuelve un XMLGregorianCalendar
                    if (autorizacion.getFechaAutorizacion() != null) {
                        existingComprobante.setFechaAutorizacion(
                                autorizacion.getFechaAutorizacion().toGregorianCalendar().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime()
                        );
                    } else {
                        existingComprobante.setFechaAutorizacion(LocalDateTime.now()); // Opcional: si la fecha del SRI es nula
                    }

                    // Establecer rutas de archivos guardados
                    existingComprobante.setRutaXmlAutorizado(autorizacionXmlPath != null ? autorizacionXmlPath.toString() : null);
                    // El XML de comprobante devuelto por el SRI es el XML firmado
                    existingComprobante.setRutaXmlFirmado(comprobanteXmlPath != null ? comprobanteXmlPath.toString() : null);
                    existingComprobante.setPdfGenerado(pdfPath != null ? pdfPath.toString() : null);

                    // Mensaje de respuesta consolidado
                    String mensajeResp = "AUTORIZADO";
//                    if (autorizacion.getMensajes() != null && !autorizacion.getMensajes().getAutorizacionMensaje().isEmpty()) {
//                        mensajeResp += ": " + autorizacion.getMensajes().getAutorizacionMensaje().stream()
//                                .map(m -> m.getMensaje())
//                                .collect(Collectors.joining("; "));
//                    }
                    if (autorizacion.getMensajes() != null && !autorizacion.getMensajes().getMensaje().isEmpty()) {
                        mensajeResp += ": " + autorizacion.getMensajes().getMensaje().stream() // <-- AQUI EL CAMBIO
                                .map(m -> m.getMensaje())
                                .collect(Collectors.joining("; "));
                    }
                    existingComprobante.setMensajeRespuesta(mensajeResp);

                    comprobanteElectronicoRepository.actualizarComprobanteElectronico(existingComprobante);

                    SriLog logAuthSuccess = new SriLog();
                    logAuthSuccess.setIdComprobante(existingComprobante.getIdComprobante());
                    logAuthSuccess.setEtapa(SriLog.Etapa.AUTORIZACION);
                    logAuthSuccess.setEstadoEnvio("AUTORIZADO");
                    logAuthSuccess.setMensaje("Factura AUTORIZADA por el SRI. Número de autorización: " + autorizacion.getNumeroAutorizacion());
                    logAuthSuccess.setTipo(SriLog.TipoMensaje.INFO);
                    comprobanteElectronicoRepository.guardarSriLog(logAuthSuccess);

                } catch (Exception e) {
                    log.error("Error al actualizar la BD con el estado AUTORIZADO o loguear: " + e.getMessage(), e);
                    // Importante: Este es un error interno de BD, no impide que la factura esté autorizada por el SRI
                }
            }

            return AutorizacionResponse.builder()
                    .autorizado(true)
                    .numeroAutorizacion(autorizacion.getNumeroAutorizacion())
                    .estado(autorizacion.getEstado())
                    .mensaje("Factura AUTORIZADA por el SRI.")
                    .claveAcceso(claveAcceso)
                    .build();

        } else { // Estados NO_AUTORIZADO, EN_PROCESO, etc.
            StringBuilder mensajesError = new StringBuilder("Factura NO AUTORIZADA por el SRI. Estado: " + autorizacion.getEstado() + "\n");
            String errorCode = "SRI_NO_AUTH"; // Código de error por defecto

//            if (autorizacion.getMensajes() != null && !autorizacion.getMensajes().getAutorizacionMensaje().isEmpty()) {
//                for (ec.gob.sri.autorizacion.Mensaje msg : autorizacion.getMensajes().getAutorizacionMensaje()) {
//                    mensajesError.append("- TIPO: ").append(msg.getTipo())
//                            .append(", IDENTIFICADOR: ").append(msg.getIdentificador())
//                            .append(", MENSAJE: ").append(msg.getMensaje());
//                    if (msg.getInformacionAdicional() != null && !msg.getInformacionAdicional().trim().isEmpty()) {
//                        mensajesError.append(", INFO ADICIONAL: ").append(msg.getInformacionAdicional());
//                    }
//                    mensajesError.append("\n");
//                    if (errorCode.equals("SRI_NO_AUTH") && msg.getIdentificador() != null) {
//                        errorCode = msg.getIdentificador();
//                    }
//                }
//            }
            if (autorizacion.getMensajes() != null && !autorizacion.getMensajes().getMensaje().isEmpty()) {
                for (ec.gob.sri.ws.autorizacion.Mensaje msg : autorizacion.getMensajes().getMensaje()) { // <-- AQUI EL CAMBIO
                    mensajesError.append("- TIPO: ").append(msg.getTipo())
                            .append(", IDENTIFICADOR: ").append(msg.getIdentificador())
                            .append(", MENSAJE: ").append(msg.getMensaje());
                    if (msg.getInformacionAdicional() != null && !msg.getInformacionAdicional().trim().isEmpty()) {
                        mensajesError.append(", INFO ADICIONAL: ").append(msg.getInformacionAdicional());
                    }
                    mensajesError.append("\n");
                    if (errorCode.equals("SRI_NO_AUTH") && msg.getIdentificador() != null) {
                        errorCode = msg.getIdentificador();
                    }
                }
            }

            else {
                mensajesError.append("No se encontraron detalles adicionales de la no autorización.");
            }

            // --- Actualizar ComprobanteElectronico y Log para estado NO AUTORIZADO ---
            if (existingComprobante != null) {
                try {
                    // Define IDs claros para tus estados en la BD
                    Integer estadoId;
                    if ("NO AUTORIZADO".equalsIgnoreCase(autorizacion.getEstado())) {
                        estadoId = 6; // Asumiendo 6 = NO_AUTORIZADO
                    } else if ("EN PROCESO".equalsIgnoreCase(autorizacion.getEstado())) {
                        estadoId = 5; // Asumiendo 5 = EN_PROCESO
                    } else {
                        estadoId = 7; // Otros estados inesperados, si los manejas
                    }
                    existingComprobante.setIdEstadoEmision(estadoId);
                    existingComprobante.setMensajeRespuesta(mensajesError.toString());
                    // Limpia campos de autorización si la factura no está autorizada
                    existingComprobante.setNumeroAutorizacion(null);
                    existingComprobante.setFechaAutorizacion(null);
                    existingComprobante.setRutaXmlAutorizado(null);
                    existingComprobante.setPdfGenerado(null);

                    comprobanteElectronicoRepository.actualizarComprobanteElectronico(existingComprobante);

                    SriLog logAuthFailure = new SriLog();
                    logAuthFailure.setIdComprobante(existingComprobante.getIdComprobante());
                    logAuthFailure.setEtapa(SriLog.Etapa.AUTORIZACION);
                    logAuthFailure.setEstadoEnvio(autorizacion.getEstado()); // Ej: "NO AUTORIZADO", "EN PROCESO"
                    logAuthFailure.setCodigoError(errorCode);
                    logAuthFailure.setMensaje(mensajesError.toString());
                    logAuthFailure.setTipo(SriLog.TipoMensaje.ERROR); // O ADVERTENCIA si es "EN PROCESO"
                    comprobanteElectronicoRepository.guardarSriLog(logAuthFailure);

                } catch (Exception e) {
                    log.error("Error al actualizar la BD con estado NO AUTORIZADO/EN PROCESO o loguear: " + e.getMessage(), e);
                }
            }

            return AutorizacionResponse.builder()
                    .autorizado(false)
                    .numeroAutorizacion(null)
                    .estado(autorizacion.getEstado())
                    .mensaje(mensajesError.toString())
                    .claveAcceso(claveAcceso)
                    .build();
        }
    }
}
 /*   public AutorizacionResponse comprobarEstadoDeAutorizacion(String claveAcceso) throws Exception {
        log.info("Comprobando estado de autorización para clave de acceso: " + claveAcceso);

        URL wsdlLocation = new URL(autorizacionUrl + "?wsdl");
        QName qname = new QName("http://ec.gob.sri.ws.autorizacion", "AutorizacionComprobantesOfflineService");

        AutorizacionComprobantesOfflineService service = new AutorizacionComprobantesOfflineService(wsdlLocation, qname);
        AutorizacionComprobantesOffline port = service.getAutorizacionComprobantesOfflinePort();

        Map<String, Object> context = ((BindingProvider) port).getRequestContext();
        context.put("com.sun.xml.ws.connect.timeout", 5000);
        context.put("com.sun.xml.ws.request.timeout", 10000);

        List<Handler> handlerChain = new ArrayList<>();
        handlerChain.add(new SoapLoggingHandler()); // Asegúrate de que SoapLoggingHandler esté bien definido
        ((BindingProvider) port).getBinding().setHandlerChain(handlerChain);

        RespuestaComprobante respuesta = port.autorizacionComprobante(claveAcceso);
        log.info("Respuesta del SRI (objeto): " + (respuesta != null ? "no nula" : "nula"));

        if (respuesta == null || respuesta.getAutorizaciones() == null || respuesta.getAutorizaciones().getAutorizacion().isEmpty()) {
            return AutorizacionResponse.builder()
                    .autorizado(false)
                    .estado("SIN_RESPUESTA")
                    .numeroAutorizacion(null)
                    .mensaje("No se obtuvo respuesta de autorización o no hay autorizaciones para la clave de acceso: " + claveAcceso)
                    .claveAcceso(claveAcceso)
                    .build();
        }

        Autorizacion autorizacion = respuesta.getAutorizaciones().getAutorizacion().get(0);
        if ("AUTORIZADO".equalsIgnoreCase(autorizacion.getEstado())) {
            Path autorizacionXmlPath = null;
            Path comprobanteXmlPath = null;
            Path pdfPath = null;
            String generatedBaseFileName = null; // Variable para almacenar el nombre base generado

            try {
                // --- NUEVO: Definir la estructura de directorios por año y mes usando la ruta configurada ---
                LocalDate now = LocalDate.now();
                String year = String.valueOf(now.getYear());
                String month = String.format("%02d", now.getMonthValue());

                // Usa la ruta inyectada 'this.authorizedXmlPath' como base
                Path baseOutputDir = Paths.get(this.authorizedXmlPath, year, month);
                Files.createDirectories(baseOutputDir); // Asegura que los directorios existan

                // Paso 1: Obtener el XML del comprobante (el contenido del CDATA) y desescaparlo
                String comprobanteXmlCdata = autorizacion.getComprobante();
                String unescapedComprobanteXml = "";
                if (comprobanteXmlCdata != null && !comprobanteXmlCdata.trim().isEmpty()) {
                    unescapedComprobanteXml = StringEscapeUtils.unescapeXml(comprobanteXmlCdata);

                    log.info("Contenido UNESCAPED del comprobante XML del CDATA: \n" + unescapedComprobanteXml.substring(0, Math.min(unescapedComprobanteXml.length(), 500)) + "...");

                    // Guardar el comprobante XML desescapado temporalmente para poder leerlo con generarNombreArchivo
                    Path tempComprobanteXmlPath = baseOutputDir.resolve(claveAcceso + "_temp.xml");
                    Files.write(tempComprobanteXmlPath, unescapedComprobanteXml.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                    log.info("XML de Comprobante (firmado, del CDATA, desescapado) guardado temporalmente en: " + tempComprobanteXmlPath.toAbsolutePath());

                    // Generar el nombre de archivo usando la función personalizada
                    generatedBaseFileName = FacturacionElectronica.generarNombreArchivo(tempComprobanteXmlPath);

                    // Definir las rutas finales con el nombre generado para todos los archivos
                    comprobanteXmlPath = baseOutputDir.resolve(generatedBaseFileName + "_comprobante.xml");
                    autorizacionXmlPath = baseOutputDir.resolve(generatedBaseFileName + "_autorizacion.xml"); // Nombre consistente
                    pdfPath = baseOutputDir.resolve(generatedBaseFileName + ".pdf"); // Nombre consistente

                    // Mover y renombrar el archivo temporal al nombre final
                    Files.move(tempComprobanteXmlPath, comprobanteXmlPath, StandardCopyOption.REPLACE_EXISTING);
                    log.info("XML de Comprobante (firmado, del CDATA, desescapado) guardado en: " + comprobanteXmlPath.toAbsolutePath());

                } else {
                    log.warn("El comprobante XML dentro del CDATA está vacío o nulo para la clave de acceso: {}", claveAcceso);
                    return AutorizacionResponse.builder()
                            .autorizado(true) // sigue estando autorizada por el SRI
                            .estado("AUTORIZADO")
                            .numeroAutorizacion(autorizacion.getNumeroAutorizacion())
                            .mensaje("Factura AUTORIZADA pero comprobante XML vacío.")
                            .claveAcceso(claveAcceso)
                            .build();
                }

                // Paso 2: Generar el XML de Autorización completo y corregir el escape del 'comprobante'
                JAXBContext jaxbContext = JAXBContext.newInstance(Autorizacion.class);
                Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
                jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

                StringWriter swAutorizacion = new StringWriter();
                jaxbMarshaller.marshal(autorizacion, swAutorizacion);
                String autorizacionXmlTemp = swAutorizacion.toString();

                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                dbFactory.setNamespaceAware(true);
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

                // CORRECCIÓN PARA parse(StringReader): Envuelve el StringReader en un InputSource
                org.w3c.dom.Document doc = dBuilder.parse(new InputSource(new StringReader(autorizacionXmlTemp)));

                // Encuentra el elemento <comprobante>
                org.w3c.dom.NodeList comprobanteNodes = doc.getElementsByTagName("comprobante");
                if (comprobanteNodes.getLength() > 0) {
                    org.w3c.dom.Element comprobanteElement = (org.w3c.dom.Element) comprobanteNodes.item(0);

                    // Limpiamos el contenido actual y añadimos el XML original desescapado
                    comprobanteElement.setTextContent("");
                    comprobanteElement.appendChild(doc.createCDATASection(unescapedComprobanteXml));

                } else {
                    log.warn("No se encontró el elemento <comprobante> en el XML de autorización después de intentar buscarlo por nombre local. Esto podría indicar un problema en el XML temporal o en la estructura.");
                    log.warn("Contenido de autorizacionXmlTemp para depuración: \n" + autorizacionXmlTemp.substring(0, Math.min(autorizacionXmlTemp.length(), 1000)) + "...");
                }

                // Serializar el Document modificado de nuevo a un String para guardarlo
                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                transformer.setOutputProperty(OutputKeys.INDENT, "yes");
                transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
                transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

                StringWriter finalSw = new StringWriter();
                transformer.transform(new DOMSource(doc), new StreamResult(finalSw));
                String autorizacionXmlCompletaFinal = finalSw.toString();

                Files.write(autorizacionXmlPath, autorizacionXmlCompletaFinal.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                log.info("XML de Autorización completo (con comprobante en CDATA) guardado en: " + autorizacionXmlPath.toAbsolutePath());

            } catch (Exception e) {
                log.error("Error al guardar los archivos XML para la clave de acceso {}: {}", claveAcceso, e.getMessage(), e);
                throw new Exception("Error al guardar archivos XML: " + e.getMessage(), e);
            }

            // --- LLAMADA A LA GENERACIÓN DE PDF ---
            if (comprobanteXmlPath != null) {
                try {
                    // Ruta de plantilla XSL
                    // URL resourceUrl = getClass().getClassLoader().getResource("invoice-template.xsl"); // Si usas recursos
                    InputStream xslStream = getClass().getClassLoader().getResourceAsStream("facturaV2.xsl");
                    if (xslStream == null) {
                        throw new RuntimeException("No se encontró el recurso facturaV2.xsl en el classpath.");
                    }
                    // Generar PDF
                    FacturaPdfGenerator generator = new FacturaPdfGenerator();
                    generator.generarPDFConFOP(comprobanteXmlPath, xslStream, pdfPath);

                    log.info("✅ PDF generado en: " + pdfPath.toAbsolutePath());

                } catch (Exception e) {
                    log.error("Error al generar PDF para clave {}: {}", claveAcceso, e.getMessage(), e);
                }

            } else {
                log.warn("No se pudo generar el PDF ni enviar el correo porque el XML del comprobante no se guardó.");
            }

            return AutorizacionResponse.builder()
                    .autorizado(true)
                    .numeroAutorizacion(autorizacion.getNumeroAutorizacion())
                    .estado(autorizacion.getEstado())
                    .mensaje("Factura AUTORIZADA por el SRI.")
                    .claveAcceso(claveAcceso)
                    .build();

        } else {
            StringBuilder mensajesError = new StringBuilder("Factura NO AUTORIZADA por el SRI. Estado: " + autorizacion.getEstado() + "\n");
            if (autorizacion.getMensajes() != null && !autorizacion.getMensajes().getMensaje().isEmpty()) {
                autorizacion.getMensajes().getMensaje().forEach(msg -> {
                    mensajesError.append("- TIPO: ").append(msg.getTipo())
                            .append(", IDENTIFICADOR: ").append(msg.getIdentificador())
                            .append(", MENSAJE: ").append(msg.getMensaje());
                    if (msg.getInformacionAdicional() != null && !msg.getInformacionAdicional().trim().isEmpty()) {
                        mensajesError.append(", INFO ADICIONAL: ").append(msg.getInformacionAdicional());
                    }
                    mensajesError.append("\n");
                });
            } else {
                mensajesError.append("No se encontraron detalles adicionales de la no autorización.");
            }
            return AutorizacionResponse.builder()
                    .autorizado(false)
                    .numeroAutorizacion(null)
                    .estado(autorizacion.getEstado())
                    .mensaje(mensajesError.toString())
                    .claveAcceso(claveAcceso)
                    .build();
        }
    }
*/
/*}*/
