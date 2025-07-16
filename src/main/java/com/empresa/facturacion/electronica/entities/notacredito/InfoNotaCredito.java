package com.empresa.facturacion.electronica.entities.notacredito;
import com.empresa.facturacion.electronica.entities.common.Impuestos;
import com.empresa.facturacion.electronica.entities.common.Pago;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.bind.annotation.*;
import java.math.BigDecimal;
import java.util.List;

/**
 * Clase que contiene la información general y específica de la Nota de Crédito.
 * Mapea el elemento <infoNotaCredito> del XML.
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "fechaEmision",
        "dirEstablecimiento",
        "contribuyenteEspecial",
        "obligadoContabilidad",
        "tipoIdentificacionComprador",
        "razonSocialComprador",
        "identificacionComprador",
        "rise",
        "codDocModificado",
        "numDocModificado",
        "fechaEmisionDocSustento",
        "totalSinImpuestos",
        "valorModificacion",
        "totalConImpuestos",
        "motivoModificacion",
        "moneda",
        "pagos",
        "claveAccesoDocModificado"
})
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InfoNotaCredito {
    private String fechaEmision;
    private String dirEstablecimiento;
    private String contribuyenteEspecial;
    private String obligadoContabilidad;
    private String tipoIdentificacionComprador;
    private String razonSocialComprador;
    private String identificacionComprador;
    private String rise;

    @XmlElement(required = true)
    private String codDocModificado; // Tipo de documento modificado (ej. "01" para factura)
    @XmlElement(required = true)
    private String numDocModificado; // Serie y número de la factura modificada (ej. "001-001-000000001")
    @XmlElement(required = true)
    private String fechaEmisionDocSustento; // Fecha de emisión del documento modificado

    @XmlElement(required = true)
    private BigDecimal totalSinImpuestos;
    @XmlElement(required = true)
    private BigDecimal valorModificacion; // Este es el importe total de la modificación

    @XmlElementWrapper(name = "totalConImpuestos", required = true)
    @XmlElement(name = "totalImpuesto")
    private List<Impuestos> totalConImpuestos; // Lista de totales de impuestos (reutilizable)

    @XmlElement(required = true)
    private String motivoModificacion; // Razón por la cual se emite la nota de crédito

    private String moneda;

    @XmlElementWrapper(name = "pagos")
    @XmlElement(name = "pago")
    private List<Pago> pagos; // Formas de pago (reutilizable)

    @XmlElement(required = true)
    private String claveAccesoDocModificado; // Clave de acceso de la factura original (¡CRUCIAL!)

}
