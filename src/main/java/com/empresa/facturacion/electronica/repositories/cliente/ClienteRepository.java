package com.empresa.facturacion.electronica.repositories.cliente;

import com.empresa.facturacion.electronica.dto.cliente.response.Cliente;

import java.sql.SQLException;

public interface ClienteRepository {
    Cliente buscarClienteById(Integer idCliente) throws SQLException;
}
