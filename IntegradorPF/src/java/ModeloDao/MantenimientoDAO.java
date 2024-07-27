package ModeloDao;

import Conexion.Conexion;
import Entidad.Mantenimiento;
import Entidad.Vehiculo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MantenimientoDAO {

    private static final String MANTENIMIENTO_VEHICULO
            = "SELECT v.marcar, v.modelo, v.kilometraje, v.placa, m.tipo "
            + "FROM vehiculo v "
            + "JOIN vehi_mant vm ON v.placa = vm.placa "
            + "JOIN mantenimiento m ON m.codMantenimiento = vm.codMantenimiento";

    public List<Mantenimiento> obtenerMantenimientosVehiculos() {
        List<Mantenimiento> mantenimientos = new ArrayList<>();

        try (Connection connection = Conexion.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(MANTENIMIENTO_VEHICULO)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String marca = rs.getString("marcar");
                String modelo = rs.getString("modelo");
                Double kilometraje = rs.getDouble("kilometraje");
                String placa = rs.getString("placa");
                String tipo = rs.getString("tipo");

                Vehiculo vehiculo = new Vehiculo(placa, marca, modelo, kilometraje);
                Mantenimiento mantenimiento = new Mantenimiento();
                mantenimiento.setTipo(tipo);
                mantenimiento.setVehiculo(vehiculo);
                mantenimientos.add(mantenimiento);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mantenimientos;
    }
    Mantenimiento objMantenimiento = null;

    public Mantenimiento buscarPorIdMante(int id) {
        try (Connection connection = Conexion.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM mantenimiento WHERE codMantenimiento = ?")) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int codMantenimiento = rs.getInt("codMantenimiento");
                String tipo = rs.getString("tipo");
                objMantenimiento = new Mantenimiento(codMantenimiento, tipo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objMantenimiento;
    }
}
