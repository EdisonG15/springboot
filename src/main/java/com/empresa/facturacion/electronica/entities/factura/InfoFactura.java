package com.empresa.facturacion.electronica.entities.factura;

import javax.xml.bind.annotation.*;

import com.empresa.facturacion.electronica.entities.common.Impuestos;
import com.empresa.facturacion.electronica.entities.common.Pago;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.util.List;

@AllArgsConstructor
@Data
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "fechaEmision",
        "dirEstablecimiento",
        "contribuyenteEspecial",
        "obligadoContabilidad",
        "tipoIdentificacionComprador",
        "razonSocialComprador",
        "identificacionComprador",
        "totalSinImpuestos",
        "totalDescuento",
        "totalConImpuestos",
        "propina",
        "importeTotal",
        "moneda",
        "pagos"
}
)
public class InfoFactura {

    private String fechaEmision;
    private String dirEstablecimiento;
    private String contribuyenteEspecial;
    private String obligadoContabilidad;
    private String tipoIdentificacionComprador;
    private String razonSocialComprador;
    private String identificacionComprador;
    private BigDecimal totalSinImpuestos;
    private BigDecimal totalDescuento;
    @XmlElementWrapper(name = "totalConImpuestos")
    @XmlElement(name = "totalImpuesto")
    private List<Impuestos> totalConImpuestos;

    private BigDecimal propina;
    private BigDecimal importeTotal;
    private String moneda;
    @XmlElementWrapper(name = "pagos")
    @XmlElement(name = "pago")
    private List<Pago> pagos;

}
