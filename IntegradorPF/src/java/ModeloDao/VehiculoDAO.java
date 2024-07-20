package ModeloDao;

import Conexion.Conexion;
import Entidad.VehiculoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VehiculoDAO {
    
    private static final String selectByPlaca = "SELECT * FROM "
            + "vehiculo WHERE placa = ?";
    
    public VehiculoDTO getMarcaModeloByPlaca(String placa){
        
        VehiculoDTO objVehiculo = null;
        
        try (Connection con = Conexion.getConnection();
                PreparedStatement ps = con.prepareStatement(selectByPlaca)){
            
            ps.setString(1, placa);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                String nPlaca = rs.getString("placa");
                String marca = rs.getString("marcar");
                String modelo  = rs.getString("modelo");
                
                objVehiculo = new VehiculoDTO(nPlaca, marca, modelo);
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return objVehiculo;
    }
}
