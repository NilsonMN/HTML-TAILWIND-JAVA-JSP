package Entidad;

public class ListaSolicitudDetalles {

    SolicitudesApro solicitudes;
    Supervisor supervisor;
    Tecnico tecnico;
    Vehiculo vehiculo;
    
    
    public ListaSolicitudDetalles() {
    }

    public ListaSolicitudDetalles(SolicitudesApro solicitudes, Supervisor supervisor, Tecnico tecnico, Vehiculo vehiculo) {
        this.solicitudes = solicitudes;
        this.supervisor = supervisor;
        this.tecnico = tecnico;
        this.vehiculo = vehiculo;
    }


    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }

    public Tecnico getTecnico() {
        return tecnico;
    }

    public void setTecnico(Tecnico tecnico) {
        this.tecnico = tecnico;
    }

    public Supervisor getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Supervisor supervisor) {
        this.supervisor = supervisor;
    }

    public SolicitudesApro getSolicitudes() {
        return solicitudes;
    }

    public void setSolicitudes(SolicitudesApro solicitudes) {
        this.solicitudes = solicitudes;
    }
    
    
    
}
