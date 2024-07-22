/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Conexion.Conexion;
import Entidad.Almacen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author livia
 */
public class AlmacenDAO {

    public static List<Almacen> listarAl() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Almacen> al = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM almacen";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Almacen alm = new Almacen();
                alm.setId(rs.getInt("codAlmacen"));
                alm.setDireccion(rs.getString("direcc"));
                alm.setIdencargado(rs.getInt("codEncargadoAlm"));
                alm.setDep(rs.getInt("codDepAlm"));
                al.add(alm);
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
        return al;
    }

    public String obtDep(int id) throws SQLException {
        String dep = "";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Conexion.getConnection();
            String sql = "SELECT nomDepAlm FROM departamentoalm WHERE codDepAlm=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                dep=rs.getString("nomDepAlm");
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

        return dep;
    }
}
