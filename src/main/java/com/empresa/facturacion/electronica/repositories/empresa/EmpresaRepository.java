package com.empresa.facturacion.electronica.repositories.empresa;

import com.empresa.facturacion.electronica.dto.empresa.response.Empresa;

import java.sql.SQLException;

public interface EmpresaRepository {
    Empresa buscarEmpresaById(Integer idEmpresa) throws SQLException;
}
