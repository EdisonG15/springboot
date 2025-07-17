package com.empresa.facturacion.electronica.dto.cliente.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cliente {
    private Integer idCliente;
    private String nombre;
    private String apellido;
    private String email; // Correo del destinatario
}
