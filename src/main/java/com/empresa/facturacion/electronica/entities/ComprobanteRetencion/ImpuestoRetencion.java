package com.empresa.facturacion.electronica.entities.ComprobanteRetencion;
import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
/**
 * Clase para cada Impuesto Retenido.
 * Mapea el elemento <impuesto> dentro de <impuestos> del Comprobante de Retención.
 */
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "codigo", // Código del impuesto (ej. "1" para Renta, "2" para IVA)
        "codigoRetencion", // Código de retención específico (ej. "303" para 1% Renta)
        "baseImponible",
        "porcentajeRetener",
        "valorRetenido",
        "codDocSustento", // Tipo de documento que sustenta la retención (ej. "01" para factura)
        "numDocSustento", // Número del documento que sustenta (serie y secuencial)
        "fechaEmisionDocSustento" // Fecha de emisión del documento que sustenta
})
public class ImpuestoRetencion {
    private String codigo;
    private String codigoRetencion;
    private BigDecimal baseImponible;
    private BigDecimal porcentajeRetener;
    private BigDecimal valorRetenido;
    private String codDocSustento;
    private String numDocSustento;
    private String fechaEmisionDocSustento;
}
