package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    private static final String URL = "jdbc:mysql://localhost:3306/mantenimiento2";
    private static final String USUARIO = "root";
    private static final String CONTRASEÑA = "Kanim21%";

    public static Connection getConnection() throws SQLException{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
        }catch(ClassNotFoundException e){
            throw new SQLException("Controlador JDBC no encontrado");
        }
    }
}
