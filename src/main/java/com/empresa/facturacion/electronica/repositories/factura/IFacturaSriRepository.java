package com.empresa.facturacion.electronica.repositories.factura;

import com.empresa.facturacion.electronica.entities.factura.FacturaElectronica;


import java.sql.SQLException;

public interface IFacturaSriRepository {
    FacturaElectronica buscarFacturaById(Integer facturaId) throws SQLException;
}
