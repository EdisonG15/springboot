package com.empresa.facturacion.electronica.utils;
import lombok.extern.slf4j.Slf4j;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
@Slf4j
public class FacturacionElectronica {
    // --- Tu función generarNombreArchivo ---
    public static String generarNombreArchivo(Path comprobanteXmlPath) throws Exception {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        org.w3c.dom.Document doc = dBuilder.parse(comprobanteXmlPath.toFile());

        String tipoComprobante = Optional.ofNullable(doc.getDocumentElement())
                .map(org.w3c.dom.Element::getNodeName)
                .orElse("UNKNOWN")
                .toUpperCase();

        java.util.function.Function<String, String> getElementText = tagName -> {
            NodeList nodes = doc.getElementsByTagName(tagName);
            if (nodes != null && nodes.getLength() > 0 && nodes.item(0).getTextContent() != null) {
                return nodes.item(0).getTextContent();
            }
            return "N/A"; // O un valor por defecto adecuado
        };

        String establecimiento = getElementText.apply("estab");
        String puntoEmision = getElementText.apply("ptoEmi");
        String secuencial = getElementText.apply("secuencial");
        String fechaEmision = getElementText.apply("fechaEmision");

        String formattedFechaEmision;
        try {
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate date = LocalDate.parse(fechaEmision, inputFormatter);
            formattedFechaEmision = date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
        } catch (Exception e) {
            log.warn("No se pudo parsear la fecha de emisión '{}', usando el formato original. Error: {}", fechaEmision, e.getMessage());
            formattedFechaEmision = fechaEmision.replace("/", "-");
        }

        // Asegurar que el secuencial tenga 9 dígitos rellenando con ceros a la izquierda
        String secuencialFormateado = String.format("%09d", Integer.parseInt(secuencial));


        return tipoComprobante + "_" + establecimiento + "-" + puntoEmision + "-" + secuencialFormateado + "_" + formattedFechaEmision;
    }
    /*public static String generarNombreArchivo(Path comprobanteXmlPath) throws Exception {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        org.w3c.dom.Document doc = dBuilder.parse(comprobanteXmlPath.toFile());

        // Obtener el tipo de comprobante (ej. "factura", "retencion")
        String tipoComprobante = Optional.ofNullable(doc.getDocumentElement())
                .map(org.w3c.dom.Element::getNodeName)
                .orElse("UNKNOWN")
                .toUpperCase();

        // Función auxiliar para obtener el texto de un elemento, manejando nulos
        java.util.function.Function<String, String> getElementText = tagName -> {
            NodeList nodes = doc.getElementsByTagName(tagName);
            if (nodes != null && nodes.getLength() > 0 && nodes.item(0).getTextContent() != null) {
                return nodes.item(0).getTextContent();
            }
            return "N/A"; // O un valor por defecto adecuado
        };

        String establecimiento = getElementText.apply("estab");
        String puntoEmision = getElementText.apply("ptoEmi");
        String secuencial = getElementText.apply("secuencial");
        String fechaEmision = getElementText.apply("fechaEmision"); // ej: 01/07/2025

        // Formatear la fecha a YYYYMMDD o DD-MM-YYYY si es necesario para el nombre del archivo
        // Asumiendo que fechaEmision viene como "DD/MM/YYYY"
        String formattedFechaEmision;
        try {
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            LocalDate date = LocalDate.parse(fechaEmision, inputFormatter);
            formattedFechaEmision = date.format(DateTimeFormatter.ofPattern("dd-MM-yyyy")); // Formato deseado
        } catch (Exception e) {
            log.warn("No se pudo parsear la fecha de emisión '{}', usando el formato original. Error: {}", fechaEmision, e.getMessage());
            formattedFechaEmision = fechaEmision.replace("/", "-"); // Fallback
        }


        return tipoComprobante + "_" + establecimiento + "-" + puntoEmision + "-" + secuencial + "_" + formattedFechaEmision;
    }*/
}
