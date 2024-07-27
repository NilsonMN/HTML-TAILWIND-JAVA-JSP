/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Conexion.Conexion;
import Entidad.SoliMats;
import Entidad.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DIEGO
 */
public class SoliMatsDAO {

    public static List<SoliMats> listSM() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SoliMats> sm = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM material_tarea";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                SoliMats smts = new SoliMats();
                smts.setCodMaterial(rs.getInt("codMaterial"));
                smts.setCantidad(rs.getInt("cantidad"));
                smts.setCodTarea(rs.getInt("codTarea"));
                smts.setFecha(rs.getDate("fecha"));
                sm.add(smts);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return sm;
    }

    public String obtTec(int id) throws SQLException {
        String nom = "";
        String aP = "";
        String aM = "";
        String nombre = "";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Conexion.getConnection();
            String sql = "SELECT tecnico.nombre, tecnico.apllPat, tecnico.apllMat "
                    + "FROM tarea "
                    + "INNER JOIN tecnico ON tarea.codTecnico = tecnico.codTecnico "
                    + "WHERE tarea.codTarea = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {  // Cambiado while a if porque solo se espera un resultado
                nom = rs.getString("nombre");
                aP = rs.getString("apllPat");
                aM = rs.getString("apllMat");
                nombre = nom + " " + aP + " " + aM;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return nombre;
    }

    public String obtMat(int id) throws SQLException {
        String nom = "";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Conexion.getConnection();
            String sql = "SELECT nombres FROM materiales WHERE codMaterial=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                nom = rs.getString("nombres");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return nom;
    }

    public String obtSede(int id) throws SQLException {
        String dir = "";
        String dep = "";
        String nom = "";
        int idA = -1;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM almacen "
                    + "INNER JOIN almacen_materiales ON almacen.codAlmacen = almacen_materiales.codAlmacen "
                    + "WHERE almacen_materiales.codMaterial = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                dir = rs.getString("direcc");
                idA = rs.getInt("codAlmacen");
                AlmacenDAO adao = new AlmacenDAO();
                dep = adao.obtDep(idA);
                nom = dep + " " + dir;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return nom;
    }

    public static List<SoliMats> listSMTa(int id) throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SoliMats> sm = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM material_tarea WHERE codTarea=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                SoliMats smts = new SoliMats();
                smts.setCodMaterial(rs.getInt("codMaterial"));
                smts.setCantidad(rs.getInt("cantidad"));
                smts.setCodTarea(rs.getInt("codTarea"));
                smts.setFecha(rs.getDate("fecha"));
                sm.add(smts);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return sm;
    }
}
