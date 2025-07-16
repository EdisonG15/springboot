package com.empresa.facturacion.electronica.entities.GuiaRemision;
import javax.xml.bind.annotation.*;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
/**
 * Clase para Detalles Adicionales dentro de un Detalle de Guía de Remisión.
 * Mapea el elemento <detAdicional> dentro de <detallesAdicionales>.
 */
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "nombre",
        "valor"
})
public class DetAdicional {
    @XmlAttribute(name = "nombre")
    private String nombre;
    @XmlAttribute(name = "valor")
    private String valor;

}
