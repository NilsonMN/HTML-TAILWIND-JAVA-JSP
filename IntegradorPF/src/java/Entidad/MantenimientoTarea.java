package Entidad;

public class MantenimientoTarea {
    int codMantenimiento;
    int codTarea;

    public MantenimientoTarea() {
    }

    public MantenimientoTarea(int codMantenimiento, int codTarea) {
        this.codMantenimiento = codMantenimiento;
        this.codTarea = codTarea;
    }

    public int getCodMantenimiento() {
        return codMantenimiento;
    }

    public void setCodMantenimiento(int codMantenimiento) {
        this.codMantenimiento = codMantenimiento;
    }

    public int getCodTarea() {
        return codTarea;
    }

    public void setCodTarea(int codTarea) {
        this.codTarea = codTarea;
    }
    
    
}
