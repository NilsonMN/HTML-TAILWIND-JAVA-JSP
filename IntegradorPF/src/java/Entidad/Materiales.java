package Entidad;

public class Materiales {
    private int codMaterial;
    private String nombres;
    private int stock;

    public Materiales() {
    }

    public Materiales(int codMaterial, String nombres, int stock) {
        this.codMaterial = codMaterial;
        this.nombres = nombres;
        this.stock=stock;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
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
