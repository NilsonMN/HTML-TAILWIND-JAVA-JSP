
package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ModeloDao.VehiculoDAO;
import Entidad.Vehiculo;


@WebServlet("/AsignarMantenimientoServlet")

public class AsignarMantenimientoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String placa = request.getParameter("placa");

        
        VehiculoDAO vehiculoDAO = new VehiculoDAO();
        Vehiculo vehiculo = vehiculoDAO.getVehiculoByPlaca(placa);

       
        response.sendRedirect("MenuFlota.jsp?placa=" + placa);
    }  
}