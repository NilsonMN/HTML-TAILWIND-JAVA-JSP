package Entidad;

public class Mantenimiento {
    private int codMantenimiento;
    private String tipo;
    private Vehiculo vehiculo;

    public Mantenimiento() {
    }

    public Mantenimiento(int codMantenimiento, String tipo) {
        this.codMantenimiento = codMantenimiento;
        this.tipo = tipo;
    }

    public Mantenimiento(int codMantenimiento, String tipo, Vehiculo vehiculo) {
        this.codMantenimiento = codMantenimiento;
        this.tipo = tipo;
        this.vehiculo = vehiculo;
    }

    public int getCodMantenimiento() {
        return codMantenimiento;
    }

    public void setCodMantenimiento(int codMantenimiento) {
        this.codMantenimiento = codMantenimiento;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
}
