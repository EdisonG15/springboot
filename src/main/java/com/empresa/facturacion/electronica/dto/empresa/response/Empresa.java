package com.empresa.facturacion.electronica.dto.empresa.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Empresa {
    private Integer idEmpresa;
    private String razonSocial;
    private String ruc;
    private String email; // Correo del emisor
    private String telefono;
    private String mensajeCorreoCliente; // Cuerpo del correo para el cliente
    private String asuntoCorreoCliente;  // Asunto del correo para el cliente

}
