package Entidad;

public class Supervisor {
    int codSupervisor;
    String nombreSuper;
    String apePat;
    String apeMat;

    public Supervisor() {
    }

    public Supervisor(int codSupervisor, String nombreSuper, String apePat, String apeMat) {
        this.codSupervisor = codSupervisor;
        this.nombreSuper = nombreSuper;
        this.apePat = apePat;
        this.apeMat = apeMat;
    }

    public int getCodSupervisor() {
        return codSupervisor;
    }

    public void setCodSupervisor(int codSupervisor) {
        this.codSupervisor = codSupervisor;
    }

    public String getNombreSuper() {
        return nombreSuper;
    }

    public void setNombreSuper(String nombreSuper) {
        this.nombreSuper = nombreSuper;
    }

    public String getApePat() {
        return apePat;
    }

    public void setApePat(String apePat) {
        this.apePat = apePat;
    }

    public String getApeMat() {
        return apeMat;
    }

    public void setApeMat(String apeMat) {
        this.apeMat = apeMat;
    }
    
    
    
}
