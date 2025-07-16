package com.empresa.facturacion.electronica.entities.ComprobanteRetencion;
import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
/**
 * Clase de Información Específica del Comprobante de Retención.
 * Mapea el elemento <infoCompRetencion> del XML.
 */
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "fechaEmision",
        "dirEstablecimiento",
        "contribuyenteEspecial",
        "obligadoContabilidad",
        "tipoIdentificacionSujetoRetenido",
        "razonSocialSujetoRetenido",
        "identificacionSujetoRetenido",
        "periodoFiscal" // Mes y año de la retención (ej. "07/2025")
})
public class InfoCompRetencion {
    private String fechaEmision;
    private String dirEstablecimiento;
    private String contribuyenteEspecial;
    private String obligadoContabilidad;
    private String tipoIdentificacionSujetoRetenido;
    private String razonSocialSujetoRetenido;
    private String identificacionSujetoRetenido;
    private String periodoFiscal;
}
