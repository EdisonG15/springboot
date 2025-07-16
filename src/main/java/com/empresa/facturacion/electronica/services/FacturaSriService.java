package com.empresa.facturacion.electronica.services;

import com.empresa.facturacion.electronica.dto.common.response.StandardResponse;
import com.empresa.facturacion.electronica.dto.facturacion.request.ComprobanteElectronico;
import com.empresa.facturacion.electronica.dto.facturacion.request.SriLog;
import com.empresa.facturacion.electronica.dto.facturacion.response.AutorizacionResponse;
import com.empresa.facturacion.electronica.entities.factura.FacturaElectronica;
import com.empresa.facturacion.electronica.repositories.comprobante.ComprobanteElectronicoRepository;
import com.empresa.facturacion.electronica.repositories.factura.IFacturaSriRepository;
import com.empresa.facturacion.electronica.utils.ClaveAccesoGenerator;
import com.empresa.facturacion.electronica.utils.XmlGenerator;
import com.empresa.facturacion.electronica.utils.XmlSigner;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class FacturaSriService implements IFacturaSriService {

   private final ComprobanteElectronicoRepository comprobanteElectronicoRepository;
    private final IFacturaSriRepository facturaRepository;
    private final XmlGenerator xmlGenerator;
    private final XmlSigner xmlSigner;
    private final ISriClient sriClient; // Usar la interfaz
    private final ClaveAccesoGenerator claveAccesoGenerator; // Inyectar o crear aquí

    // Constructor que recibe las dependencias como interfaces
    public FacturaSriService(ComprobanteElectronicoRepository comprobanteElectronicoRepository, IFacturaSriRepository facturaRepository, XmlGenerator xmlGenerator,
                             XmlSigner xmlSigner, ISriClient sriClient, ClaveAccesoGenerator claveAccesoGenerator) {
        this.comprobanteElectronicoRepository = comprobanteElectronicoRepository;
        this.facturaRepository = facturaRepository;
        this.xmlGenerator = xmlGenerator;
        this.xmlSigner = xmlSigner;
        this.sriClient = sriClient;
        this.claveAccesoGenerator = claveAccesoGenerator;
    }

    @Override
    public StandardResponse procesarYEnviarFactura(Integer facturaId) throws Exception {
        System.out.println("Service: Obteniendo datos de la factura ID: " + facturaId);
        FacturaElectronica factura = facturaRepository.buscarFacturaById(facturaId);

        if (factura == null) {
            return StandardResponse.builder()
                    .code(404)
                    .message("Factura con ID " + facturaId + " no encontrada.")
                    .data(Collections.emptyMap())
                    .build();
        }

        String xmlVersionToSign = factura.getVersion();
        Date fechaEmisionDate = new SimpleDateFormat("dd/MM/yyyy").parse(factura.getInfoFactura().getFechaEmision());
        long secuencial = Long.parseLong(factura.getInfoTributaria().getSecuencial());

        String tipoEmision = factura.getInfoTributaria().getTipoEmision();

        String claveAccesoGenerada = claveAccesoGenerator.generateClaveAcceso(
                fechaEmisionDate,
                secuencial,
                tipoEmision
        );
        factura.getInfoTributaria().setClaveAcceso(claveAccesoGenerada);
        System.out.println("Service: Clave de Acceso generada: " + claveAccesoGenerada);
        // --- 1. Generar XML y firmar ---
        String unsignedXml = xmlGenerator.generateXml(factura);
        String signedXml = xmlSigner.signXml(unsignedXml, xmlVersionToSign);
        // --- 2. Preparar el registro inicial del comprobante electrónico ---
        Integer idComprobanteGenerado = null;
        ComprobanteElectronico comprobante = new ComprobanteElectronico();
        try {
            comprobante.setTipoDocumento(factura.getInfoTributaria().getCodDoc());
            comprobante.setIdVenta(facturaId);
            // Si puedes obtener el id_cliente de la factura, hazlo aquí
            // comprobante.setIdCliente(factura.getInfoFactura().getIdCliente());
            String numeroDocumento = factura.getInfoTributaria().getEstab() +
                    factura.getInfoTributaria().getPtoEmi() +
                    factura.getInfoTributaria().getSecuencial();
            comprobante.setNumeroDocumento(numeroDocumento);
            comprobante.setClaveAcceso(claveAccesoGenerada);
            comprobante.setIdAmbiente(Integer.parseInt(factura.getInfoTributaria().getAmbiente()));
            comprobante.setIdEstadoEmision(1); // 1 = PENDIENTE / REGISTRADO (antes de la respuesta del SRI)
            comprobante.setFechaEmision(fechaEmisionDate.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDateTime());
            comprobante.setIdTipoEmision(Integer.parseInt(factura.getInfoTributaria().getTipoEmision()));
            // Las rutas XML se pueden guardar aquí si los archivos ya se generaron en disco
            // comprobante.setRutaXmlGenerado("ruta/del/unsigned.xml");
            // comprobante.setRutaXmlFirmado("ruta/del/signed.xml");

            // --- Guardar el registro inicial del comprobante y log de GENERACION/FIRMA ---
            idComprobanteGenerado = comprobanteElectronicoRepository.guardarComprobanteElectronico(comprobante);

            SriLog logGeneracion = new SriLog();
            logGeneracion.setIdComprobante(idComprobanteGenerado);
            logGeneracion.setEtapa(SriLog.Etapa.GENERACION);
            logGeneracion.setEstadoEnvio("EXITOSO");
            logGeneracion.setMensaje("Factura XML generada y firmada. Clave de Acceso: " + claveAccesoGenerada);
            logGeneracion.setTipo(SriLog.TipoMensaje.INFO);
            comprobanteElectronicoRepository.guardarSriLog(logGeneracion);

        } catch (Exception e) {
            System.err.println("Error al guardar comprobante electrónico inicial o log: " + e.getMessage());
            // Si no se puede guardar el registro inicial, es un problema crítico.
            throw new RuntimeException("Fallo al registrar la factura antes de enviar al SRI.", e);
        }
        System.out.println("Service: Enviando XML firmado al SRI...");
        String sriResponse = sriClient.enviarFacturaASri(signedXml, idComprobanteGenerado);

// Determinar si fue RECIBIDA o DEVUELTA para el código HTTP simulado
        int statusCode = sriResponse.contains("RECIBIDA") ? 200 : 400;

        // --- 3. Actualizar el comprobante con la respuesta de recepción del SRI ---
        try {
            // Reutilizamos el objeto 'comprobante' y lo actualizamos
            // Solo necesitamos el ID para la actualización
            comprobante.setIdComprobante(idComprobanteGenerado); // Asegurarnos de que el ID esté seteado

            if (sriResponse.contains("RECIBIDA")) {
                comprobante.setIdEstadoEmision(2); // 2 = RECIBIDA
                comprobante.setMensajeRespuesta("RECIBIDA: " + sriResponse);
                // Otros campos como numero_autorizacion y fecha_autorizacion se llenarán DESPUÉS
                // de consultar la autorización (otra función/proceso).
            } else {
                comprobante.setIdEstadoEmision(3); // 3 = DEVUELTA
                comprobante.setMensajeRespuesta("DEVUELTA: " + sriResponse);
            }
            // Realizar la actualización
            comprobanteElectronicoRepository.actualizarComprobanteElectronico(comprobante);

        } catch (Exception e) {
            System.err.println("Error al actualizar comprobante electrónico después de envío al SRI: " + e.getMessage());
            // Este error podría ser menos crítico, pero aún así es importante registrarlo
        }

        Map<String, Object> responseData = new HashMap<>();
        responseData.put("claveAcceso", claveAccesoGenerada);
        responseData.put("estadoSri", sriResponse);

        return StandardResponse.builder()
                .code(statusCode)
                .message("Resultado del envío de la factura al SRI")
                .data(responseData)
                .build();
    }


    @Override
    public AutorizacionResponse comprobarEstadoDeAutorizacion(String claveAcceso) throws Exception {
        return sriClient.comprobarEstadoDeAutorizacion(claveAcceso);
    }

    /*@Override
    public StandardResponse procesarYEnviarFactura(Integer facturaId) throws Exception {
        System.out.println("Service: Obteniendo datos de la factura ID: " + facturaId);
        FacturaElectronica factura = facturaRepository.buscarFacturaById(facturaId);

        if (factura == null) {
            return StandardResponse.builder()
                    .code(404)
                    .message("Factura con ID " + facturaId + " no encontrada.")
                    .data(Collections.emptyMap())
                    .build();
        }

        String xmlVersionToSign = factura.getVersion();
        Date fechaEmisionDate = new SimpleDateFormat("dd/MM/yyyy").parse(factura.getInfoFactura().getFechaEmision());
        long secuencial = Long.parseLong(factura.getInfoTributaria().getSecuencial());

        String tipoEmision = factura.getInfoTributaria().getTipoEmision();

        String claveAccesoGenerada = claveAccesoGenerator.generateClaveAcceso(
                fechaEmisionDate,
                secuencial,
                tipoEmision
        );
        factura.getInfoTributaria().setClaveAcceso(claveAccesoGenerada);
        System.out.println("Service: Clave de Acceso generada: " + claveAccesoGenerada);

        String unsignedXml = xmlGenerator.generateXml(factura);
        String signedXml = xmlSigner.signXml(unsignedXml, xmlVersionToSign);

        System.out.println("Service: Enviando XML firmado al SRI...");
        String sriResponse = sriClient.enviarFacturaASri(signedXml);

        // Determinar si fue RECIBIDA o DEVUELTA para código HTTP simulado
        int statusCode = sriResponse.contains("RECIBIDA") ? 200 : 400;

        Map<String, Object> responseData = new HashMap<>();
        responseData.put("claveAcceso", claveAccesoGenerada);
        responseData.put("estadoSri", sriResponse);

        return StandardResponse.builder()
                .code(statusCode)
                .message("Resultado del envío de la factura al SRI")
                .data(responseData)
                .build();
    }
*/
}
