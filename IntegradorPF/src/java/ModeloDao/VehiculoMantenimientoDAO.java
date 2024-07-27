package ModeloDao;

import Conexion.Conexion;
import Entidad.VehiculoMantenimiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VehiculoMantenimientoDAO {
    VehiculoMantenimiento objVehiMan = null;
    public VehiculoMantenimiento buscarManPorPlaca(String placa){
        try (Connection connection = Conexion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM vehi_mant WHERE placa = ?")) {
            preparedStatement.setString(1, placa);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int codMantenimiento = rs.getInt("codMantenimiento");
                objVehiMan = new VehiculoMantenimiento(codMantenimiento,placa);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objVehiMan;
    }
}
