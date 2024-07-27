
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entidad.Vehiculo;
import ModeloDao.VehiculoDAO;

/**
 *
 * @author HP
 */
@WebServlet(name = "ActualizarVehiculoServlet", urlPatterns = {"/ActualizarVehiculoServlet"})
public class ActualizarVehiculoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String placaVehiculo = request.getParameter("placaVehiculo");
        String marcaVehiculo = request.getParameter("marcaVehiculo");
        String modeloVehiculo = request.getParameter("modeloVehiculo");
    
        
        Vehiculo vehiculo = new Vehiculo();
        vehiculo.setPlaca(placaVehiculo);
        vehiculo.setMarca(marcaVehiculo);
        vehiculo.setModelo(modeloVehiculo);
      
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        boolean resultado = vehiculoDAO.actualizarVehiculo(vehiculo);

        if (resultado) {
            response.sendRedirect("VehiculoCRUD.jsp");
        } 
    }
}