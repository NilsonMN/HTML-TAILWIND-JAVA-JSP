package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entidad.Vehiculo;
import ModeloDao.VehiculoDAO;

@WebServlet(name = "AgregarVehiculoServlet", urlPatterns = {"/AgregarVehiculoServlet"})
public class AgregarVehiculoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String placaVehiculo = request.getParameter("placaVehiculo");
        String marcaVehiculo = request.getParameter("marcaVehiculo");
        String modeloVehiculo = request.getParameter("modeloVehiculo");
        double kilometrajeVehiculo = Double.parseDouble(request.getParameter("kilomentrajeVehiculo"));

        Vehiculo vehiculo = new Vehiculo(placaVehiculo, marcaVehiculo, modeloVehiculo, kilometrajeVehiculo);

        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        boolean resultado = vehiculoDAO.agregarVehiculo(vehiculo);

        if (resultado) {
            response.sendRedirect("VehiculoCRUD.jsp");
        }
    }
}