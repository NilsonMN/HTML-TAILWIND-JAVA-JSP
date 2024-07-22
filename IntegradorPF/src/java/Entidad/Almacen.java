/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

/**
 *
 * @author livia
 */
public class Almacen {
    private int id;
    private String direccion;
    private int idencargado;
    private int dep;

    public Almacen(int id, String direccion, int idencargado, int dep) {
        this.id = id;
        this.direccion = direccion;
        this.idencargado=idencargado;
        this.dep=dep;
    }

    public Almacen() {
        this.id=0;
        this.direccion="";
        this.idencargado=-1;
        this.dep=-1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdencargado() {
        return idencargado;
    }

    public void setIdencargado(int idencargado) {
        this.idencargado = idencargado;
    }

    public int getDep() {
        return dep;
    }

    public void setDep(int dep) {
        this.dep = dep;
    }
    
    
}
