package Entidad;

public class Conductor {
    
    private Integer id;
    private String nombre;
    private String apllPat;
    private String apllMat;
    private String telefono;
    private String usuarioCond;
    private String contrasenaCond;
    private String licencia;

    public Conductor() {
    }

    public Conductor(Integer id, String nombre, String apllPat, String apllMat, String telefono, String usuarioCond, String contrasenaCond, String licencia) {
        this.id = id;
        this.nombre = nombre;
        this.apllPat = apllPat;
        this.apllMat = apllMat;
        this.telefono = telefono;
        this.usuarioCond = usuarioCond;
        this.contrasenaCond = contrasenaCond;
        this.licencia = licencia;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApllPat() {
        return apllPat;
    }

    public void setApllPat(String apllPat) {
        this.apllPat = apllPat;
    }

    public String getApllMat() {
        return apllMat;
    }

    public void setApllMat(String apllMat) {
        this.apllMat = apllMat;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getUsuarioCond() {
        return usuarioCond;
    }

    public void setUsuarioCond(String usuarioCond) {
        this.usuarioCond = usuarioCond;
    }

    public String getContrasenaCond() {
        return contrasenaCond;
    }

    public void setContrasenaCond(String contrasenaCond) {
        this.contrasenaCond = contrasenaCond;
    }

    public String getLicencia() {
        return licencia;
    }

    public void setLicencia(String licencia) {
        this.licencia = licencia;
    }
    
    
}
