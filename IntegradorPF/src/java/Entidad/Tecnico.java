package Entidad;

public class Tecnico {
    private int codTecnico;
    private String nombre;
    private String apllPat;
    private String apllMat;
    private String telefono;
    private String usuarioTec;
    private String contrasenatTec;

    public Tecnico() {
    }

    public Tecnico(int codTecnico, String nombre, String apllPat, String apllMat) {
        this.codTecnico = codTecnico;
        this.nombre = nombre;
        this.apllPat = apllPat;
        this.apllMat = apllMat;
    }

    public Tecnico(int codTecnico, String nombre, String apllPat, String apllMat, String telefono, String usuarioTec, String contrasenatTec) {
        this.codTecnico = codTecnico;
        this.nombre = nombre;
        this.apllPat = apllPat;
        this.apllMat = apllMat;
        this.telefono = telefono;
        this.usuarioTec = usuarioTec;
        this.contrasenatTec = contrasenatTec;
    }

    public int getCodTecnico() {
        return codTecnico;
    }

    public void setCodTecnico(int codTecnico) {
        this.codTecnico = codTecnico;
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

    public String getUsuarioTec() {
        return usuarioTec;
    }

    public void setUsuarioTec(String usuarioTec) {
        this.usuarioTec = usuarioTec;
    }

    public String getContrasenatTec() {
        return contrasenatTec;
    }

    public void setContrasenatTec(String contrasenatTec) {
        this.contrasenatTec = contrasenatTec;
    }
    
    
    
    
}
