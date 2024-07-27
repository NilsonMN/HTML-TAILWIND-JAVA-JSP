package ModeloDao;

import Conexion.Conexion;
import Entidad.Vehiculo;
import Entidad.VehiculoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VehiculoDAO {

    private static final String selectByPlaca = "SELECT * FROM "
            + "vehiculo WHERE placa = ?";
    private static final String SELECT_ALL_VEHICULOS = "SELECT * FROM vehiculo";
    private static final String SELECT_VEHICULO_BY_PLACA = "SELECT * FROM vehiculo WHERE placa = ?";
    private static final String UPDATE_KILOMETRAJE = "UPDATE vehiculo SET kilometraje = ? WHERE placa = ?";

    public VehiculoDTO getMarcaModeloByPlaca(String placa) {

        VehiculoDTO objVehiculo = null;

        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(selectByPlaca)) {

            ps.setString(1, placa);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String nPlaca = rs.getString("placa");
                String marca = rs.getString("marcar");
                String modelo = rs.getString("modelo");

                objVehiculo = new VehiculoDTO(nPlaca, marca, modelo);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return objVehiculo;
    }

    public List<Vehiculo> getAllVehiculos() {
        List<Vehiculo> vehiculos = new ArrayList<>();

        try (Connection connection = Conexion.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_VEHICULOS)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String placa = rs.getString("placa");
                String marca = rs.getString("marcar");
                String modelo = rs.getString("modelo");
                Double kilometraje = rs.getDouble("kilometraje");

                Vehiculo vehiculo = new Vehiculo(placa, marca, modelo, kilometraje);
                vehiculos.add(vehiculo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculos;
    }

    public Vehiculo getVehiculoByPlaca(String placa) {
        Vehiculo vehiculo = null;

        try (Connection connection = Conexion.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VEHICULO_BY_PLACA)) {

            preparedStatement.setString(1, placa);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String marca = rs.getString("marcar");
                String modelo = rs.getString("modelo");
                Double kilometraje = rs.getDouble("kilometraje");

                vehiculo = new Vehiculo(placa, marca, modelo, kilometraje);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vehiculo;
    }

    public void actualizarKilometraje(String placa, double kilometraje) {
        try (Connection connection = Conexion.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_KILOMETRAJE)) {

            preparedStatement.setDouble(1, kilometraje);
            preparedStatement.setString(2, placa);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<String> getMarcas() throws SQLException {
        List<String> marcas = new ArrayList<>();
        String query = "SELECT DISTINCT marcar FROM vehiculo";
        try (Connection conn = Conexion.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                marcas.add(rs.getString("marcar"));
            }
        }
        return marcas;
    }

    public List<String> getModelos() throws SQLException {
        List<String> modelos = new ArrayList<>();
        String query = "SELECT DISTINCT modelo FROM vehiculo";
        try (Connection conn = Conexion.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                modelos.add(rs.getString("modelo"));
            }
        }
        return modelos;
    }

    public List<Vehiculo> getVehiculosFiltrados(String marca, String modelo) throws SQLException {
        List<Vehiculo> vehiculos = new ArrayList<>();
        String query = "SELECT * FROM vehiculo";
        boolean hasMarca = (marca != null && !marca.isEmpty());
        boolean hasModelo = (modelo != null && !modelo.isEmpty());

        if (hasMarca || hasModelo) {
            query += " WHERE";
            if (hasMarca) {
                query += " marcar=?";
            }
            if (hasModelo) {
                if (hasMarca) {
                    query += " AND";
                }
                query += " modelo=?";
            }
        }

        try (Connection conn = Conexion.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            int index = 1;
            if (hasMarca) {
                stmt.setString(index++, marca);
            }
            if (hasModelo) {
                stmt.setString(index, modelo);
            }
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Vehiculo vehiculo = new Vehiculo();
                    vehiculo.setMarca(rs.getString("marcar"));
                    vehiculo.setModelo(rs.getString("modelo"));
                    vehiculo.setPlaca(rs.getString("placa"));
                    vehiculo.setKilometraje(rs.getDouble("kilometraje"));
                    vehiculos.add(vehiculo);
                }
            }
        }
        return vehiculos;
    }

    public boolean agregarVehiculo(Vehiculo vehiculo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "INSERT INTO vehiculo (placa, marcar, modelo , kilometraje) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vehiculo.getPlaca());
            pstmt.setString(2, vehiculo.getMarca());
            pstmt.setString(3, vehiculo.getModelo());
            pstmt.setDouble(4, vehiculo.getKilometraje());

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultado;
    }

    public boolean actualizarVehiculo(Vehiculo vehiculo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "UPDATE vehiculo SET marcar = ?, modelo = ? WHERE placa = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vehiculo.getMarca());
            pstmt.setString(2, vehiculo.getModelo());
            pstmt.setString(3, vehiculo.getPlaca());

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultado;
    }

    public boolean eliminarVehiculo(String placa) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "DELETE FROM vehiculo WHERE placa = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, placa);

            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultado;
    }

    public void asignarMantenimiento(String placa) {
        try (Connection conn = Conexion.getConnection(); PreparedStatement deletePs = conn.prepareStatement("DELETE FROM vehi_mant WHERE placa = ? AND codmantenimiento = 1"); PreparedStatement insertPs = conn.prepareStatement("INSERT INTO vehi_mant (placa, codmantenimiento) VALUES (?, 1)")) {

            deletePs.setString(1, placa);
            int rowsDeleted = deletePs.executeUpdate();
            System.out.println("Filas eliminadas: " + rowsDeleted);

            insertPs.setString(1, placa);
            int rowsInserted = insertPs.executeUpdate();
            System.out.println("Filas insertadas: " + rowsInserted);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
