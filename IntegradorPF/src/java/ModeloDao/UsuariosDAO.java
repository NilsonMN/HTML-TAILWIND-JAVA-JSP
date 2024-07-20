package ModeloDao;

import Conexion.Conexion;
import Entidad.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDAO {
    
    private static final String conductorQuery = "SELECT codConductor, COUNT(*) FROM conductor "
            + "WHERE usuarioCond = ? AND contrasenaCond = ? "
            + "GROUP BY codConductor";
    private static final String supervisorQuery = "SELECT id, COUNT(*) FROM supervisor WHERE usuarioSup = ? AND contrasenaSup = ?";
    
    public UsuariosDTO buscarUsuario(String usuario, String contrasena, String tipoUsuario) {
        UsuariosDTO usuariosDTO = null;
        String query = queryTipoUsuario(tipoUsuario);
        
        if (query == null) {
            throw new IllegalArgumentException("tipo de usuario no valido");
        }
        
        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(2);
                    if (count > 0) {
                        Integer id = rs.getInt(1);
                        usuariosDTO = new UsuariosDTO(id);
                    }
                } else {
                    System.out.println("No se encontraron resultados para el usuario y contraseña proporcionados.");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return usuariosDTO;
    }
    
    public UsuariosDTO getId(String id) {
        UsuariosDTO usuariosDTO = null;
        String query = "SELECT codConductor FROM conductor WHERE codConductor = ?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Integer ids = rs.getInt("codConductor");
                    usuariosDTO = new UsuariosDTO(ids);
                    System.out.println("Usuario encontrado: " + ids);
                } else {
                    System.out.println("No se encontraron resultados para el ID proporcionado.");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return usuariosDTO;
    }
    
    private String queryTipoUsuario(String tipoUsuario) {
        switch (tipoUsuario.toLowerCase()) {
            case "conductor":
                return conductorQuery;
            case "administrador":
                return supervisorQuery;
            default: 
                return null;
        }
    }
}
