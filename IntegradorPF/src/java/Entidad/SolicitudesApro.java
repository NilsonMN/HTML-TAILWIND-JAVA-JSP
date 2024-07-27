package Entidad;

public class SolicitudesApro {
    int codSoli;
    String fechaSoli;
    String descripcionSoli;
    int codSupervisor;
    int codTecnico;
    String placa;

    public SolicitudesApro() {
    }

    public SolicitudesApro(int codSoli, String fechaSoli, String descripcionSoli, int codSupervisor, int codTecnico,String placa) {
        this.codSoli = codSoli;
        this.fechaSoli = fechaSoli;
        this.descripcionSoli = descripcionSoli;
        this.codSupervisor = codSupervisor;
        this.codTecnico = codTecnico;
        this.placa = placa;
    }

    public int getCodSoli() {
        return codSoli;
    }

    public void setCodSoli(int codSoli) {
        this.codSoli = codSoli;
    }

    public String getFechaSoli() {
        return fechaSoli;
    }

    public void setFechaSoli(String fechaSoli) {
        this.fechaSoli = fechaSoli;
    }

    public String getDescripcionSoli() {
        return descripcionSoli;
    }

    public void setDescripcionSoli(String descripcionSoli) {
        this.descripcionSoli = descripcionSoli;
    }

    public int getCodSupervisor() {
        return codSupervisor;
    }

    public void setCodSupervisor(int codSupervisor) {
        this.codSupervisor = codSupervisor;
    }

    public int getCodTecnico() {
        return codTecnico;
    }

    public void setCodTecnico(int codTecnico) {
        this.codTecnico = codTecnico;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }
    
}
