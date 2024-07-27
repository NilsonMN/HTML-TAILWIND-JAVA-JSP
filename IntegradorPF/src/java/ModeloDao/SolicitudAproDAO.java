package ModeloDao;

import Conexion.Conexion;
import Entidad.SolicitudesApro;
import Entidad.ListaSolicitudDetalles;
import Entidad.Supervisor;
import Entidad.Tecnico;
import Entidad.Vehiculo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SolicitudAproDAO {
    String tresTablas ="SELECT solirev.*,supervisor.nombre,supervisor.apllPat,supervisor.apllMat,tecnico.nombre,tecnico.apllPat,tecnico.apllMat,vehiculo.modelo,vehiculo.marcar\n" +
        "FROM solirev \n" +
        "JOIN supervisor ON solirev.codSupervisor = supervisor.codSupervisor \n" +
        "JOIN tecnico ON solirev.codTecnico = tecnico.codTecnico \n" +
        "JOIN vehiculo on solirev.placa = vehiculo.placa"; 
    
    public List<SolicitudesApro> getTodasSolicitudes() {
        List<SolicitudesApro> listaSolicitudes = new ArrayList<>();

        try (Connection connection = Conexion.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM solirev")) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int codSoli = rs.getInt("codSoli");
                String fechaSoli = rs.getString("fecha");
                String descripcionSoli = rs.getString("descripcion");
                int codSupervisor = rs.getInt("codSupervisor");
                int codTecnico = rs.getInt("codTecnico");
                String placa = rs.getString("placa");

                SolicitudesApro objSoliApro = new SolicitudesApro(codSoli, fechaSoli, descripcionSoli, codSupervisor,codTecnico,placa);
                listaSolicitudes.add(objSoliApro);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaSolicitudes;
    }
    public List<ListaSolicitudDetalles>obtenerDAtos(){
        List<ListaSolicitudDetalles> listaDatosDetalles = new ArrayList<>();
        try (Connection connection = Conexion.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(tresTablas)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                SolicitudesApro solicitudApro = new SolicitudesApro();
                solicitudApro.setCodSoli(rs.getInt("codSoli"));
                solicitudApro.setFechaSoli(rs.getString("fecha"));
                solicitudApro.setDescripcionSoli(rs.getString("solirev.descripcion"));
                solicitudApro.setCodSupervisor(rs.getInt("solirev.codSupervisor"));
                solicitudApro.setCodTecnico(rs.getInt("solirev.codTecnico"));
                solicitudApro.setPlaca(rs.getString("solirev.placa"));

                Supervisor supervisor = new Supervisor();
                supervisor.setNombreSuper(rs.getString("supervisor.nombre"));
                supervisor.setApePat(rs.getString("supervisor.apllPat"));
                supervisor.setApeMat(rs.getString("supervisor.apllMat"));

                Tecnico tecnico = new Tecnico();
                tecnico.setNombre(rs.getString("tecnico.nombre"));
                tecnico.setApllPat(rs.getString("tecnico.apllPat"));
                tecnico.setApllMat(rs.getString("tecnico.apllMat"));
                
                Vehiculo vehiculo = new Vehiculo();
                vehiculo.setModelo(rs.getString("vehiculo.modelo"));
                vehiculo.setMarca(rs.getString("vehiculo.marca"));

                ListaSolicitudDetalles objListaSoliDetalle = 
                        new ListaSolicitudDetalles(solicitudApro,supervisor,tecnico,vehiculo);
                listaDatosDetalles.add(objListaSoliDetalle);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaDatosDetalles;
    }
}
