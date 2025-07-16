package com.empresa.facturacion.electronica.entities.notacredito;
import com.empresa.facturacion.electronica.entities.common.Impuestos;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;
/**
 * Clase que representa un detalle de producto o servicio en la Nota de Crédito.
 * Mapea el elemento <detalle> dentro de <detalles>.
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "codigoInterno",
        "codigoAdicional",
        "descripcion",
        "cantidad",
        "precioUnitario",
        "descuento",
        "precioTotalSinImpuesto",
        "razonModificacion", // Campo específico de Nota de Crédito a nivel de detalle
        "impuestos"
})
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetalleNotaCredito {

    private String codigoInterno; // Puede ser codigoPrincipal
    private String codigoAdicional;
    private String descripcion;
    private BigDecimal cantidad;
    private BigDecimal precioUnitario;
    private BigDecimal descuento;
    private BigDecimal precioTotalSinImpuesto;
    private String razonModificacion; // Razón por la modificación de este detalle (opcional según XSD)

    @XmlElementWrapper(name = "impuestos", required = true)
    @XmlElement(name = "impuesto")
    private List<Impuestos> impuestos; // Impuestos aplicados a este detalle (reutilizable)

}
