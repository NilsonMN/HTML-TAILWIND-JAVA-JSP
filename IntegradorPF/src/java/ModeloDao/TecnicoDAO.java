package ModeloDao;

import Conexion.Conexion;
import Entidad.Tecnico;
import Entidad.Vehiculo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TecnicoDAO {
    Tecnico objTecnico = null;
    public Tecnico BuscarTecnico(int id){
        try (Connection connection = Conexion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tecnico WHERE codTecnico = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String apePatSu = rs.getString("apllPat");
                String apeMatSu = rs.getString("apllMat");

                 objTecnico = new Tecnico(id,nombre,apePatSu,apeMatSu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objTecnico;        
    }
    public List<Tecnico> ListarTodoTecnico()
    {
        List<Tecnico> listaTecnico = new ArrayList<>();

        try (Connection connection = Conexion.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM tecnico")) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int codTecnico = rs.getInt("codTecnico");
                String nombretec = rs.getString("nombre");
                String apelPat = rs.getString("apllPat");
                String apelMat = rs.getString("apllMat");

                Tecnico objTecnico = new Tecnico(codTecnico, nombretec, apelPat, apelMat);
                listaTecnico.add(objTecnico);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaTecnico;
    }
}
