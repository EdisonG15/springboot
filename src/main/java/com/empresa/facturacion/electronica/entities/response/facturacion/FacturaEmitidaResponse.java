package com.empresa.facturacion.electronica.entities.response.facturacion;

public class FacturaEmitidaResponse {
    private String claveAcceso;
    private String estadoAutorizacion;
    private String mensaje;

    public String getClaveAcceso() {
        return claveAcceso;
    }

    public void setClaveAcceso(String claveAcceso) {
        this.claveAcceso = claveAcceso;
    }

    public String getEstadoAutorizacion() {
        return estadoAutorizacion;
    }

    public void setEstadoAutorizacion(String estadoAutorizacion) {
        this.estadoAutorizacion = estadoAutorizacion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}
