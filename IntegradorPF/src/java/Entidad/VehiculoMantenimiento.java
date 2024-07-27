package Entidad;

public class VehiculoMantenimiento {
    int codMantenimiento;
    String placa;

    public VehiculoMantenimiento() {
    }

    public VehiculoMantenimiento(int codMantenimiento, String placa) {
        this.codMantenimiento = codMantenimiento;
        this.placa = placa;
    }

    public int getCodMantenimiento() {
        return codMantenimiento;
    }

    public void setCodMantenimiento(int codMantenimiento) {
        this.codMantenimiento = codMantenimiento;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
    
}
