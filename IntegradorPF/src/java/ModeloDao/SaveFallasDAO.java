package ModeloDao;

import Conexion.Conexion;
import Entidad.SaveFallasDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SaveFallasDAO {

    private static final String sql = "insert into falla(tpFalla, fecha, "
            + "descripcion, codConductor, placa, estado)\n"
            + "values (?, ?, ?, ?, ?, ?);";
    
    private LocalDateTime fechaActual = LocalDateTime.now();
    private String estado = "por hacer";

    public void registrar(SaveFallasDTO saveFallasDto) {

        //Boolean resultado = false;

        try (Connection con = Conexion.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, saveFallasDto.tpFalla());
            ps.setObject(2, fechaActual);
            ps.setString(3, saveFallasDto.descripcion());
            ps.setString(4, saveFallasDto.codConductor());
            ps.setString(5, saveFallasDto.placa());
            ps.setString(6, estado);
            
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Registro exitoso.");
            } else {
                System.out.println("No se insertó ningún registro.");
            }
            

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
