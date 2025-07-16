package com.empresa.facturacion.electronica.entities.factura;
import javax.xml.bind.annotation.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@AllArgsConstructor
@Data
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class Detalles {
    @XmlElement(name = "detalle")
    private List<Detalle> detalle;
}
