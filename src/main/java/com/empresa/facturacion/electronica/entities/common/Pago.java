package com.empresa.facturacion.electronica.entities.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "formaPago",
        "total"
})
public class Pago {
    @XmlElement
    private String formaPago;
    @XmlElement
    private BigDecimal total;

//            | Código | Forma de pago                                     |
//            | ------ | ------------------------------------------------- |
//            | `01`   | Sin utilización del sistema financiero (efectivo) |
//            | `15`   | Compensación de deudas                            |
//            | `19`   | Tarjeta de crédito                                |
//            | `20`   | Otros con utilización del sistema financiero      |


}
