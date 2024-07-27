
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ModeloDao.VehiculoDAO;
import java.io.IOException;


@WebServlet(name = "ActualizarKilometrajeServlet", urlPatterns = {"/ActualizarKilometrajeServlet"})
public class ActualizarKilometrajeServlet extends HttpServlet {

    private static final long SerialVersionUID= 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        
        
        String placa = request.getParameter("placa");
        double kilometraje=Double.parseDouble(request.getParameter("kilometraje"));
        
        VehiculoDAO vehiculoDAO= new VehiculoDAO();
        vehiculoDAO.actualizarKilometraje(placa, kilometraje);
        
        response.sendRedirect("AdmindVehiculo.jsp?placa=" + placa);
    }
}
