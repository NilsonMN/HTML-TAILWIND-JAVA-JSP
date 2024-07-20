package Servlet;

import Entidad.UsuariosDTO;
import Entidad.VehiculoDTO;
import ModeloDao.UsuariosDAO;
import ModeloDao.VehiculoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BuscarVehiculoByPlacaServlet", urlPatterns = {"/BuscarVehiculoByPlacaServlet"})
public class BuscarVehiculoByPlacaServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
        String placa = request.getParameter("placa");
        String id = request.getParameter("id");

        System.out.println("ID recibido: " + id);
        System.out.println("Placa recibida: " + placa);

        VehiculoDAO objDao = new VehiculoDAO();
        UsuariosDAO usuariosDao = new UsuariosDAO();

        VehiculoDTO vehiculoDto = objDao.getMarcaModeloByPlaca(placa);
        UsuariosDTO usuariosDto = usuariosDao.getId(id);

        if (usuariosDto != null) {
            request.setAttribute("id", usuariosDto.id());
        } else {
            request.setAttribute("id", "No encontrado");
            request.setAttribute("usuarioNoEncontrado", true);
        }

        if (vehiculoDto != null) {
            request.setAttribute("placa", vehiculoDto.placa());
            request.setAttribute("marca", vehiculoDto.marca());
            request.setAttribute("modelo", vehiculoDto.modelo());
        } else {
            request.setAttribute("marca", "No encontrado");
            request.setAttribute("modelo", "No encontrado");
        }

        request.getRequestDispatcher("/ReportarFallas.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
