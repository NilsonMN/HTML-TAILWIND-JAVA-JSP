
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import ModeloDao.VehiculoDAO;
import Entidad.Vehiculo;
import java.sql.SQLException;

@WebServlet(name = "VencimientosServlet", urlPatterns = {"/VencimientosServlet"})
public class VencimientosServlet extends HttpServlet {

    private VehiculoDAO vehiculoDAO = new VehiculoDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");

        try {
            List<Vehiculo> vehiculos = vehiculoDAO.getVehiculosFiltrados(marca, modelo);
            request.setAttribute("vehiculos", vehiculos);
            request.setAttribute("marcas", vehiculoDAO.getMarcas()); 
            request.setAttribute("modelos", vehiculoDAO.getModelos()); 
            request.getRequestDispatcher("ReporteVencimientos.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<String> marcas = vehiculoDAO.getMarcas();
            List<String> modelos = vehiculoDAO.getModelos();
            request.setAttribute("marcas", marcas);
            request.setAttribute("modelos", modelos);

            
            List<Vehiculo> vehiculos = vehiculoDAO.getAllVehiculos();
            request.setAttribute("vehiculos", vehiculos);

            request.getRequestDispatcher("ReporteVencimientos.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}