package Servlet;

import Entidad.UsuariosDTO;
import ModeloDao.UsuariosDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    UsuariosDAO usuariosDao = new UsuariosDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("Salir".equalsIgnoreCase(accion)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        if ("Ingresar".equalsIgnoreCase(accion)) {
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("password");
            String tipoUsuario = request.getParameter("rol").toLowerCase();

            UsuariosDTO usuarioDto = usuariosDao.buscarUsuario(usuario, contrasena, tipoUsuario);

            if (usuarioDto != null && tipoUsuario.equalsIgnoreCase("Conductor")) {
                HttpSession session = request.getSession();
                session.setAttribute("id", usuarioDto.id());
                session.setAttribute("nombre", usuarioDto.nombre());
                session.setAttribute("apllPat", usuarioDto.apllPat());

                String path = request.getContextPath() + "/Vistas/Conductor/ReportarFallas.jsp";
                response.sendRedirect(path);
            } else if (usuarioDto != null && tipoUsuario.equalsIgnoreCase("tecnico")) {
                HttpSession session = request.getSession();
                session.setAttribute("id", usuarioDto.id());
                session.setAttribute("nombre", usuarioDto.nombre());
                session.setAttribute("apllPat", usuarioDto.apllPat());

                String path = request.getContextPath() + "/Vistas/Tecnico/TareaPendiente.jsp";
                response.sendRedirect(path);
            } else if (usuarioDto != null && tipoUsuario.equalsIgnoreCase("supervisor")) {
                HttpSession session = request.getSession();
                session.setAttribute("id", usuarioDto.id());
                session.setAttribute("nombre", usuarioDto.nombre());
                session.setAttribute("apllPat", usuarioDto.apllPat());

                String path = request.getContextPath() + "/error.jsp";//completar la ruta
                response.sendRedirect(path);
            } else if (usuarioDto != null && tipoUsuario.equalsIgnoreCase("adminalmacen")) {
                HttpSession session = request.getSession();
                session.setAttribute("id", usuarioDto.id());
                session.setAttribute("nombre", usuarioDto.nombre());
                session.setAttribute("apllPat", usuarioDto.apllPat());

                String path = request.getContextPath() + "/Vistas/Almacen/ProductosAl.jsp";
                response.sendRedirect(path);
            } else if (usuarioDto != null && tipoUsuario.equalsIgnoreCase("adminvehiculos")) {
                HttpSession session = request.getSession();
                session.setAttribute("id", usuarioDto.id());
                session.setAttribute("nombre", usuarioDto.nombre());
                session.setAttribute("apllPat", usuarioDto.apllPat());

                String path = request.getContextPath()+"/MenuFlota.jsp";//completar la ruta
                response.sendRedirect(path);
            }
            else {
                response.sendRedirect(request.getContextPath() + "/index.jsp?error=Usuario o contraseña incorrectos");
            }
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
