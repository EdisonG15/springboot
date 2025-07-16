package com.empresa.facturacion.electronica.entities.GuiaRemision;
import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "codigoInterno",
        "codigoAdicional",
        "descripcion",
        "cantidad",
        "detallesAdicionales" // Campos adicionales para el detalle
})
public class DetalleGuiaRemision {

    private String codigoInterno;
    private String codigoAdicional;
    private String descripcion;
    private BigDecimal cantidad;

    @XmlElement(name = "detAdicional")
    private List<DetAdicional> detallesAdicionales; // Similar a CampoAdicional

}
