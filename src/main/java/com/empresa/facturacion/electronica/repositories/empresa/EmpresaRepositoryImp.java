package com.empresa.facturacion.electronica.repositories.empresa;

import com.empresa.facturacion.electronica.dto.empresa.response.Empresa;
import org.springframework.stereotype.Repository;
import javax.sql.DataSource;
import java.sql.*;

@Repository
public class EmpresaRepositoryImp  implements EmpresaRepository{
    private final DataSource dataSource;


    public EmpresaRepositoryImp(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Empresa buscarEmpresaById(Integer idEmpresa) throws SQLException {
        String sql = "SELECT id_Empresa, razon_social, ruc, email, telefono, mensaje_correo_cliente, asunto_correo_cliente " +
                "FROM empresa WHERE id_Empresa = ? AND estado = '1'";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idEmpresa);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Empresa empresa = new Empresa();
                    empresa.setIdEmpresa(rs.getInt("id_Empresa"));
                    empresa.setRazonSocial(rs.getString("razon_social"));
                    empresa.setRuc(rs.getString("ruc"));
                    empresa.setEmail(rs.getString("email"));
                    empresa.setTelefono(rs.getString("telefono"));
                    empresa.setMensajeCorreoCliente(rs.getString("mensaje_correo_cliente"));
                    empresa.setAsuntoCorreoCliente(rs.getString("asunto_correo_cliente"));
                    return empresa;
                }
            }
        }
        return null;

    }
}
