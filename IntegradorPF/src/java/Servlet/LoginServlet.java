package Servlet;

import Entidad.UsuariosDTO;
import ModeloDao.UsuariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("password");
        String tipoUsuario = request.getParameter("rol");
        
        System.out.println("Usuario: " + usuario);
        System.out.println("Contraseña: " + contrasena);
        System.out.println("Tipo de usuario: " + tipoUsuario);
        
        UsuariosDAO usuariosDao = new UsuariosDAO();
        UsuariosDTO usuarioDto = usuariosDao.buscarUsuario(usuario, contrasena, tipoUsuario);
        
        if(usuarioDto != null && tipoUsuario.equalsIgnoreCase("Conductor")){
            request.setAttribute("id", usuarioDto.id());
            request.setAttribute("usuario",usuario);
            request.setAttribute("contrasena", contrasena);
            request.setAttribute("tipoUsuario", tipoUsuario);
            request.getRequestDispatcher("ReportarFallas.jsp").forward(request, response);
        }
        if(tipoUsuario.equalsIgnoreCase("Administrador")){
            System.out.println("Tipo de usuario no válido o no definido.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
    }// </editor-fold>

}
