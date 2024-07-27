/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Conexion.Conexion;
import Entidad.Mantenimiento;
import Entidad.MantenimientoTarea;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author deyvi
 */
public class MantenimientoTareaDAO {
    MantenimientoTarea objManteTarea = null;
    public MantenimientoTarea buscariddManteTarea(int id)
    {
        try (Connection connection = Conexion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM mant_tarea WHERE codMantenimiento = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int codTarea = rs.getInt("codTarea");
                objManteTarea = new MantenimientoTarea(id,codTarea);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objManteTarea;
    }
}
