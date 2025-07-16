package com.empresa.facturacion.electronica.entities.common;

import javax.xml.bind.annotation.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@AllArgsConstructor
@Data
@NoArgsConstructor
@XmlAccessorType(XmlAccessType.FIELD)
public class InfoAdicional {
    @XmlElement(name = "campoAdicional")
    private List<CampoAdicional> campoAdicional;

}
