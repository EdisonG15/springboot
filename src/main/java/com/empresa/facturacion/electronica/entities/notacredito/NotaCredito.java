package com.empresa.facturacion.electronica.entities.notacredito;
import com.empresa.facturacion.electronica.entities.common.InfoAdicional;
import com.empresa.facturacion.electronica.entities.common.InfoTributaria;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.xml.bind.annotation.*;
/**
 * Clase principal que representa el comprobante de Nota de Crédito.
 * Mapea el elemento raíz <notaCredito> del XML del SRI.
 */
@XmlRootElement(name = "notaCredito", namespace = "")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "infoTributaria",
        "infoNotaCredito",
        "detalles", // Usa DetallesNotaCredito para los detalles específicos de NC
        "infoAdicional"
})
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotaCredito {
    @XmlAttribute(name = "id", required = true)
    private String id = "comprobante"; // Siempre "comprobante" para el atributo id

    @XmlAttribute(name = "version", required = true)
    private String version = "1.1.0"; // Versión del esquema de Nota de Crédito del SRI

    @XmlElement(required = true)
    private InfoTributaria infoTributaria; // Información tributaria del emisor (reutilizable)

    @XmlElement(required = true)
    private InfoNotaCredito infoNotaCredito; // Información específica de la Nota de Crédito

    @XmlElement(required = true)
    private DetallesNotaCredito detalles; // Contenedor para los detalles de los productos/servicios

    @XmlElement
    private InfoAdicional infoAdicional; // Información adicional (campos extra, reutilizable)

}
