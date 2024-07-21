package ModeloDao;

import Conexion.Conexion;
import Entidad.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDAO {

    private static final String conductorQuery = "SELECT codConductor, nombre, apllPat "
            + "FROM conductor WHERE usuarioCond = ? AND contrasenaCond = ?";
    
    private static final String tecnicoQuery = "SELECT codTecnico, nombre, apllPat "
            + "FROM tecnico WHERE usuarioTec = ? AND contrasenaTec = ?";
    
    private static final String supervisorQuery = "SELECT codSupervisor, nombre, apllPat "
            + "FROM supervisor WHERE usuarioSup = ? AND contrasenaSup = ?";
    
    private static final String admAlmacenQuery = "SELECT codEncargadoAlm, nombre, apllPat "
            + "FROM encargadoalmacen WHERE usuarioEncAlm = ? AND contrasenaEncAlm = ?";

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
                    Integer id = rs.getInt(1);
                    String nombre = rs.getString("nombre");
                    String apllPat = rs.getString("apllPat");
                    usuariosDTO = new UsuariosDTO(id, nombre, apllPat);
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
        String query = "SELECT codConductor, nombre, apllPat FROM conductor WHERE codConductor = ?";

        try (Connection con = Conexion.getConnection(); 
                PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Integer ids = rs.getInt("codConductor");
                    String nombres = rs.getString("nombre");
                    String apllPats = rs.getString("apllPat");
                    usuariosDTO = new UsuariosDTO(ids, nombres, apllPats);
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
            case "supervisor":
                return supervisorQuery;
            case "tecnico":
                return tecnicoQuery;
            case "adminalmacen":
                return admAlmacenQuery;
            default:
                return null;
        }
    }
}
