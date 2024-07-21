package ModeloDao;

import Entidad.VehiMantDTO;
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
        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

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

    public Integer codMantenimiento(String tpMantenimiento) {

        Integer codMantenimiento = 0;
        String query = "SELECT codMantenimiento FROM mantenimiento "
                + "WHERE tipo = ?";

        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, tpMantenimiento);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    codMantenimiento = rs.getInt(1);
                } else {
                    System.out.println("Error tipo mantemiento no encontrado");
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return codMantenimiento;
    }

    public void saveVehiMant(VehiMantDTO vehiMantDto) {
        if (!verificarPlacaExiste(vehiMantDto.placa())) {
            System.out.println("La placa no existe en la tabla vehiculo.");
            return;
        }

        String query = "INSERT INTO vehi_mant (placa, codMantenimiento) VALUES (?, ?)";

        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, vehiMantDto.placa());
            ps.setInt(2, vehiMantDto.codMant());

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

    private boolean verificarPlacaExiste(String placa) {
        String query = "SELECT COUNT(*) FROM vehiculo WHERE placa = ?";
        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, placa);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
