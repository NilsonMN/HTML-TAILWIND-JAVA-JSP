
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ModeloDao.VehiculoDAO;
import Entidad.Vehiculo;

@WebServlet(name = "EliminarVehiculoServlet", urlPatterns = {"/EliminarVehiculoServlet"})
public class EliminarVehiculoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String placaVehiculo = request.getParameter("placaVehiculo");
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        boolean resultado = vehiculoDAO.eliminarVehiculo(placaVehiculo);

        if (resultado) {
            response.sendRedirect("VehiculoCRUD.jsp");
        } 
    }
}

