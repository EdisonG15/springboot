package com.empresa.facturacion.electronica.entities.notacredito;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.*;
import java.util.List;

/**
 * Contenedor para la lista de detalles de productos/servicios en la Nota de Crédito.
 * Mapea el elemento <detalles> del XML.
 */
@XmlAccessorType(XmlAccessType.FIELD)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetallesNotaCredito {
    @XmlElement(name = "detalle", required = true)
    private List<DetalleNotaCredito> detalle;

}
