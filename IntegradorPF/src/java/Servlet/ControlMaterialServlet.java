/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Entidad.Materiales;
import Entidad.SoliMats;
import ModeloDao.MaterialesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author livia
 */
public class ControlMaterialServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion.equals("Agregar")) {
            String nomM = request.getParameter("nombre");
            int stock = Integer.parseInt(request.getParameter("stock"));
            int idAl = Integer.parseInt(request.getParameter("almacen"));
            Materiales m = new Materiales();
            MaterialesDAO mdao = new MaterialesDAO();
            m.setNombres(nomM);
            m.setStock(stock);
            mdao.agregar(m, idAl);
            response.sendRedirect(request.getContextPath() + "/Vistas/Almacen/ControlMaterial.jsp");
        } else if (accion.equals("aprobar")) {
            String[] codMateriales = request.getParameterValues("codMaterial");
            String[] cantidades = request.getParameterValues("cantidad");
            int codTarea = Integer.parseInt(request.getParameter("codTarea"));
            List<SoliMats> soliMatsList = new ArrayList<>();
            for (int i = 0; i < codMateriales.length; i++) {
                SoliMats soliMats = new SoliMats();
                soliMats.setCodMaterial(Integer.parseInt(codMateriales[i]));
                soliMats.setCantidad(Integer.parseInt(cantidades[i]));
                soliMatsList.add(soliMats);
            }
            MaterialesDAO materialDao = new MaterialesDAO();
            boolean ac = materialDao.actualizarCantidad(soliMatsList);

            if (ac) {
                MaterialesDAO mdaos = new MaterialesDAO();
                boolean bo = mdaos.borrar(codTarea);
                if (bo) {
                    request.setAttribute("alert", "success: Operación realizada correctamente.");
                } else {
                    request.setAttribute("alert", "error: Error al borrar la tarea.");
                }
            } else {
                request.setAttribute("alert", "error: Error al actualizar los materiales.");
            }
            request.getRequestDispatcher(request.getContextPath() + "/Vistas/Almacen/SolicitudMats.jsp").forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
