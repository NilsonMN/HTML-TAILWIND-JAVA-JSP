package Entidad;

public class Materiales {
    private int codMaterial;
    private String nombres;

    public Materiales() {
    }

    public Materiales(int codMaterial, String nombres) {
        this.codMaterial = codMaterial;
        this.nombres = nombres;
    }

    public int getCodMaterial() {
        return codMaterial;
    }

    public void setCodMaterial(int codMaterial) {
        this.codMaterial = codMaterial;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    
}
