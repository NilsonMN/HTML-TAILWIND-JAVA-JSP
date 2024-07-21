package ModeloDao;

import Entidad.Materiales;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MaterialesDAO {
    
    public List<Materiales> obtenerMateriales() {
        List<Materiales> listaMateriales = new ArrayList<>();
        String sql = "SELECT codMaterial, nombres FROM materiales";

        try (Connection connection = Conexion.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Materiales material = new Materiales();
                material.setCodMaterial(resultSet.getInt("codMaterial"));
                material.setNombres(resultSet.getString("nombres"));
                listaMateriales.add(material);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaMateriales;
    }
    
    public void insertarMaterialTarea(int codTarea, int codMaterial, int cantidad) throws SQLException {
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = Conexion.getConnection();
            String query = "INSERT INTO material_tarea (codTarea, codMaterial, cantidad) VALUES (?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, codTarea);
            stmt.setInt(2, codMaterial);
            stmt.setInt(3, cantidad);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
