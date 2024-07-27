package ModeloDao;

import Conexion.Conexion;
import Entidad.Supervisor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SupervisorDAO {
    Supervisor objSupervisor = null;
    public Supervisor BuscarSupervisor(int id){
        try (Connection connection = Conexion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM supervisor WHERE codSupervisor = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String apePatSu = rs.getString("apllPat");
                String apeMatSu = rs.getString("apllMat");

                 objSupervisor = new Supervisor(id,nombre,apePatSu,apeMatSu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objSupervisor;        
    }
}
