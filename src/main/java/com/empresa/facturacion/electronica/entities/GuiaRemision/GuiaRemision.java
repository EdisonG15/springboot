package com.empresa.facturacion.electronica.entities.GuiaRemision;
import com.empresa.facturacion.electronica.entities.common.InfoAdicional;
import com.empresa.facturacion.electronica.entities.common.InfoTributaria;
import javax.xml.bind.annotation.*;
import java.util.List;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlRootElement(name = "guiaRemision", namespace = "")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "infoTributaria",
        "infoGuiaRemision", // Información específica de la guía de remisión
        "destinatarios", // Lista de destinatarios
        "infoAdicional"
})
public class GuiaRemision {

    @XmlAttribute(name = "id", required = true)
    private String id = "comprobante";

    @XmlAttribute(name = "version", required = true)
    private String version = "1.1.0"; // Versión común, verificar XSD del SRI

    @XmlElement(required = true)
    private InfoTributaria infoTributaria; // Similar a la factura (reutilizable)

    @XmlElement(required = true)
    private InfoGuiaRemision infoGuiaRemision; // Información específica de la guía de remisión

    @XmlElementWrapper(name = "destinatarios", required = true)
    @XmlElement(name = "destinatario")
    private List<Destinatario> destinatarios; // Puede haber múltiples destinatarios

    @XmlElement
    private InfoAdicional infoAdicional; // Similar a la factura (reutilizable)

}
