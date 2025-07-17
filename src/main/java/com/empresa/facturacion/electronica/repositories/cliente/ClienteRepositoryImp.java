package com.empresa.facturacion.electronica.repositories.cliente;

import com.empresa.facturacion.electronica.dto.cliente.response.Cliente;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;
@Repository
public class ClienteRepositoryImp implements ClienteRepository{
    private final DataSource dataSource;

    public ClienteRepositoryImp(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Cliente buscarClienteById(Integer idCliente) throws SQLException {
        String sql = "SELECT id_cliente, nombre, apellido, email FROM cliente WHERE id_cliente = ? AND estado = '1'";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idCliente);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Cliente cliente = new Cliente();
                    cliente.setIdCliente(rs.getInt("id_cliente"));
                    cliente.setNombre(rs.getString("nombre"));
                    cliente.setApellido(rs.getString("apellido"));
                    cliente.setEmail(rs.getString("email"));
                    return cliente;
                }
            }
        }
        return null;
    }
}
