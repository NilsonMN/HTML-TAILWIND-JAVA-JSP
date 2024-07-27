/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

import java.util.Date;

/**
 *
 * @author DIEGO
 */
public class SoliMats {
    private int codTarea;
    private int codMaterial;
    private int cantidad;
    private Date fecha;

    public SoliMats(int codTarea, int codMaterial, int cantidad, Date fecha) {
        this.codTarea = codTarea;
        this.codMaterial = codMaterial;
        this.cantidad = cantidad;
        this.fecha = fecha;
    }

    public SoliMats() {
        this.codTarea = -1;
        this.codMaterial = -1;
        this.cantidad = -1;
        this.fecha = null;
    }

    public int getCodTarea() {
        return codTarea;
    }

    public void setCodTarea(int codTarea) {
        this.codTarea = codTarea;
    }

    public int getCodMaterial() {
        return codMaterial;
    }

    public void setCodMaterial(int codMaterial) {
        this.codMaterial = codMaterial;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
}
