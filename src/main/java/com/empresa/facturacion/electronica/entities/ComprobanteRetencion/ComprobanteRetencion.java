package com.empresa.facturacion.electronica.entities.ComprobanteRetencion;
import javax.xml.bind.annotation.*;
import java.util.List;

import com.empresa.facturacion.electronica.entities.common.InfoAdicional;
import com.empresa.facturacion.electronica.entities.common.InfoTributaria;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlRootElement(name = "comprobanteRetencion", namespace = "")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "infoTributaria",
        "infoCompRetencion", // Información específica del comprobante de retención
        "impuestos", // ¡Aquí los impuestos son directos, no dentro de detalles!
        "infoAdicional"
})
public class ComprobanteRetencion {
    @XmlAttribute(name = "id", required = true)
    private String id = "comprobante";

    @XmlAttribute(name = "version", required = true)
    private String version = "1.0.0"; // Versión común, verificar XSD del SRI (puede ser 1.1.0)

    @XmlElement(required = true)
    private InfoTributaria infoTributaria; // Similar a la factura (reutilizable)

    @XmlElement(required = true)
    private InfoCompRetencion infoCompRetencion; // Información específica del comprobante de retención

    @XmlElementWrapper(name = "impuestos", required = true) // Contenedor para los impuestos retenidos
    @XmlElement(name = "impuesto")
    private List<ImpuestoRetencion> impuestos; // Lista de impuestos retenidos

    @XmlElement
    private InfoAdicional infoAdicional; // Similar a la factura (reutilizable)

}
