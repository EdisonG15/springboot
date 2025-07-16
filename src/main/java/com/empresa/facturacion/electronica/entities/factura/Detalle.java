package com.empresa.facturacion.electronica.entities.factura;
import com.empresa.facturacion.electronica.entities.common.Impuestos;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class Detalle {

    private String codigoPrincipal;
    private String descripcion;
    private BigDecimal cantidad;
    private BigDecimal precioUnitario;
    private BigDecimal descuento;
    private BigDecimal precioTotalSinImpuesto;
    @XmlElementWrapper(name = "impuestos")
    @XmlElement(name = "impuesto")
    private List<Impuestos> impuestos;

}
