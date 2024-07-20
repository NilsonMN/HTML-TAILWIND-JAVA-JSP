package Servlet;

import Entidad.SaveFallasDTO;
import Entidad.UsuariosDTO;
import Entidad.VehiculoDTO;
import ModeloDao.SaveFallasDAO;
import ModeloDao.UsuariosDAO;
import ModeloDao.VehiculoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReportarFallasServlet", urlPatterns = {"/ReportarFallasServlet"})
public class ReportarFallasServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("buscar".equals(action)) {
                String placa = request.getParameter("placa");
                String id = request.getParameter("id");

                VehiculoDAO vehiculoDao = new VehiculoDAO();
                UsuariosDAO usuariosDao = new UsuariosDAO();

                VehiculoDTO vehiculoDto = vehiculoDao.getMarcaModeloByPlaca(placa);
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

            } else if ("reportar".equals(action)) {
                String tipoFalla = request.getParameter("tipoFallo");
                String descripcion = request.getParameter("descripcion");
                String id = request.getParameter("id");
                String placa = request.getParameter("placa");

                SaveFallasDTO saveFallasDto = new SaveFallasDTO(tipoFalla, 
                        null, descripcion, id, placa, null);
                
                request.setAttribute("mensaje", "Falla reportada exitosamente");
                
                UsuariosDAO usuariosDao = new UsuariosDAO();
                UsuariosDTO usuariosDto = usuariosDao.getId(id);

                if (usuariosDto != null) {
                    request.setAttribute("id", usuariosDto.id());
                } else {
                    request.setAttribute("id", "No encontrado");
                    request.setAttribute("usuarioNoEncontrado", true);
                }
                
                SaveFallasDAO saveFallasDao = new SaveFallasDAO();
                saveFallasDao.registrar(saveFallasDto);

                request.getRequestDispatcher("/ReportarFallas.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
    }
}
