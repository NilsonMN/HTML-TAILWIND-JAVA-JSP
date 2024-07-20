package Entidad;

import java.time.LocalDateTime;

public record SaveFallasDTO(
        String tpFalla,
        LocalDateTime fecha,
        String descripcion,
        String codConductor,
        String placa,
        String estado
        ) {

}
