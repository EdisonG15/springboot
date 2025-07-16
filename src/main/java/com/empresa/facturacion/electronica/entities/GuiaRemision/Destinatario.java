package com.empresa.facturacion.electronica.entities.GuiaRemision;
import javax.xml.bind.annotation.*;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
import java.util.List;

/**
 * Clase para cada Destinatario de la Guía de Remisión.
 * Mapea el elemento <destinatario> dentro de <destinatarios>.
 */
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "identificacionDestinatario",
        "razonSocialDestinatario",
        "dirDestinatario",
        "motivoTraslado",
        "docAduaneroUnico",
        "codEstabDestino",
        "ruta",
        "codDocSustento", // Tipo de documento que sustenta el traslado (ej. "01" para factura)
        "numDocSustento", // Número del documento que sustenta (serie y secuencial)
        "fechaEmisionDocSustento", // Fecha de emisión del documento que sustenta
        "numAutorizacion", // Número de autorización del documento que sustenta
        "detalles" // Detalles de los productos que se trasladan a este destinatario
})
public class Destinatario {

    private String identificacionDestinatario;
    private String razonSocialDestinatario;
    private String dirDestinatario;
    private String motivoTraslado;
    private String docAduaneroUnico;
    private String codEstabDestino;
    private String ruta;
    private String codDocSustento;
    private String numDocSustento;
    private String fechaEmisionDocSustento;
    private String numAutorizacion;

    @XmlElementWrapper(name = "detalles", required = true) // Detalles de los productos para este destinatario
    @XmlElement(name = "detalle")
    private List<DetalleGuiaRemision> detalles; // Lista de productos

}
