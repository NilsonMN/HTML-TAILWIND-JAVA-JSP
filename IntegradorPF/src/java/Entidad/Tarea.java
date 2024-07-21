package Entidad;

import java.util.Date;

public class Tarea {
    private int codTarea;
    private String nombre;
    private Date fechInicio;
    private Date fechFin;
    private Tecnico tecnico;

    public Tarea() {
    }

    public Tarea(int codTarea, String nombre, Date fechInicio, Date fechFin, Tecnico tecnico) {
        this.codTarea = codTarea;
        this.nombre = nombre;
        this.fechInicio = fechInicio;
        this.fechFin = fechFin;
        this.tecnico = tecnico;
    }

    public int getCodTarea() {
        return codTarea;
    }

    public void setCodTarea(int codTarea) {
        this.codTarea = codTarea;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechInicio() {
        return fechInicio;
    }

    public void setFechInicio(Date fechInicio) {
        this.fechInicio = fechInicio;
    }

    public Date getFechFin() {
        return fechFin;
    }

    public void setFechFin(Date fechFin) {
        this.fechFin = fechFin;
    }

    public Tecnico getTecnico() {
        return tecnico;
    }

    public void setTecnico(Tecnico tecnico) {
        this.tecnico = tecnico;
    }
    
}
