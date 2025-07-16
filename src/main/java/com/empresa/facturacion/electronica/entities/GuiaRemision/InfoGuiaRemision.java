package com.empresa.facturacion.electronica.entities.GuiaRemision;
import javax.xml.bind.annotation.*;
import lombok.AllArgsConstructor; // Asumiendo uso de Lombok
import lombok.Data;         // Asumiendo uso de Lombok
import lombok.NoArgsConstructor; // Asumiendo uso de Lombok
/**
 * Clase de Información Específica de la Guía de Remisión.
 * Mapea el elemento <infoGuiaRemision> del XML.
 */
@AllArgsConstructor // Constructor con todos los argumentos (Lombok)
@NoArgsConstructor  // Constructor sin argumentos (Lombok)
@Data               // Getters, Setters, toString, equals, hashCode (Lombok)
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {
        "fechaEmision", // Agregado: fechaEmision para InfoGuiaRemision
        "dirEstablecimiento",
        "contribuyenteEspecial",
        "obligadoContabilidad",
        "rise",
        "razonSocialTransportista", // Nombre del transportista
        "tipoIdentificacionTransportista",
        "identificacionTransportista",
        "rucTransportista", // RUC del transportista
        "placa" // Placa del vehículo
})
public class InfoGuiaRemision {
    private String fechaEmision; // Agregado: fechaEmision para InfoGuiaRemision
    private String dirEstablecimiento;
    private String contribuyenteEspecial;
    private String obligadoContabilidad;
    private String rise;
    private String razonSocialTransportista;
    private String tipoIdentificacionTransportista;
    private String identificacionTransportista;
    private String rucTransportista;
    private String placa;
}
