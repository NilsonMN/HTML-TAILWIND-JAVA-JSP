/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Conexion.Conexion;
import Entidad.SoliMats;
import Entidad.Tarea;
import Entidad.Tecnico;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author DIEGO
 */
public class TareaDAO {

    public static List<Tarea> listT() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Tarea> t = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM tarea";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Tarea ta = new Tarea();
                ta.setCodTarea(rs.getInt("codTarea"));
                ta.setNombre(rs.getString("nombres"));
                ta.setFechInicio(rs.getDate("fechInicio"));
                Tecnico te = new Tecnico();
                te.setCodTecnico(rs.getInt("codTecnico"));
                ta.setTecnico(te);
                // Agregar el objeto Tarea a la lista
                t.add(ta);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return t;
    }
    Tarea objTarea = null;

    public Tarea buscarIDTarea(int id) {
        try (Connection connection = Conexion.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tarea WHERE codTarea = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int codTarea = rs.getInt("codTarea");
                String nombre = rs.getString("nombres");
                Date fechaini = rs.getDate("fechInicio");
                Date fechafin = rs.getDate("fechFin");
                Tecnico t=new Tecnico();
                
                int codTecnico = rs.getInt("codTecnico");
                t.setCodTecnico(codTarea);
                objTarea = new Tarea(codTarea,nombre, fechaini, fechafin, t);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objTarea;
    }
}
