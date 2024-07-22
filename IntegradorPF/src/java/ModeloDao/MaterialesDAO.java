package ModeloDao;

import Entidad.Materiales;
import Conexion.Conexion;
import Entidad.Almacen;
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

        try (Connection connection = Conexion.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

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

    public static List<Materiales> listarMatAl(int idAl) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Materiales> mats = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM materiales "
                    + "INNER JOIN almacen_materiales ON materiales.codMaterial = almacen_materiales.codMaterial "
                    + "INNER JOIN almacen ON almacen_materiales.codAlmacen = almacen.codAlmacen "
                    + "WHERE almacen.codAlmacen = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, idAl);
            rs = ps.executeQuery();
            while (rs.next()) {
                Materiales mat = new Materiales();
                mat.setCodMaterial(rs.getInt("codMaterial"));
                mat.setNombres(rs.getString("nombres"));
                mat.setStock(rs.getInt("stock"));
                mats.add(mat);
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
        return mats;
    }

    public void agregar(Materiales m, int codAl) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int idM = -1;

        try {
            con = Conexion.getConnection();
            String query = "INSERT INTO materiales (nombres, stock) VALUES (?, ?)";
            stmt = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, m.getNombres());
            stmt.setInt(2, m.getStock());
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                idM = rs.getInt(1);
            }
            stmt.close();
            rs.close();
            //ADD ALMACEN_MATERIAL
            con = Conexion.getConnection();
            String sql = "INSERT INTO almacen_materiales (codMaterial, codAlmacen) VALUES (?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idM);
            stmt.setInt(2, codAl);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
