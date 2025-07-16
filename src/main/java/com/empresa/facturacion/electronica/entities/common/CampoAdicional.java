package com.empresa.facturacion.electronica.entities.common;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.xml.bind.annotation.*;

@AllArgsConstructor
@Data
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class CampoAdicional {

@XmlAttribute(name = "nombre")
    private String nombre; // El nombre del campo adicional (ej: "Email", "Telefono", "Observaciones")
     @XmlValue
    private String valor; // El valor de ese campo (ej: "correo@ejemplo.com", "0991234567", "Entrega urgente")

}
