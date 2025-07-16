package com.empresa.facturacion.electronica.entities.factura;


import com.empresa.facturacion.electronica.entities.common.InfoAdicional;
import com.empresa.facturacion.electronica.entities.common.InfoTributaria;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement(name = "factura", namespace = "")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "infoTributaria",
        "infoFactura",
        "detalles",
        "infoAdicional"
})
public class FacturaElectronica {
    @XmlAttribute(name = "version", required = true)
    private String version = "1.1.0";
    @XmlElement(required = true)
    private InfoTributaria infoTributaria;
    @XmlElement(required = true)
    private InfoFactura infoFactura;
    @XmlElement(required = true)
    private Detalles detalles;
    @XmlElement
    private InfoAdicional infoAdicional;

}
