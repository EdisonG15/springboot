package com.empresa.facturacion.electronica.entities.response.sri;
// Archivo: SriAuthorizationResult.java
import java.util.ArrayList;
import java.util.List;

public class SriAuthorizationResult {
    private String status; // Ej: AUTORIZADO, NO AUTORIZADO, EN PROCESO
    private String authorizationNumber;
    private String authorizationDate;
    private List<String> messages; // Mensajes de error o informativos

    public SriAuthorizationResult() {
        this.messages = new ArrayList<>();
    }

    // Getters y Setters (o simplemente Getters si decides construir el objeto internamente)

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAuthorizationNumber() {
        return authorizationNumber;
    }

    public void setAuthorizationNumber(String authorizationNumber) {
        this.authorizationNumber = authorizationNumber;
    }

    public String getAuthorizationDate() {
        return authorizationDate;
    }

    public void setAuthorizationDate(String authorizationDate) {
        this.authorizationDate = authorizationDate;
    }

    public List<String> getMessages() {
        return messages;
    }

    public void addMessage(String message) {
        this.messages.add(message);
    }

    @Override
    public String toString() {
        return "Estado: " + status +
                ", Número de Autorización: " + (authorizationNumber != null ? authorizationNumber : "N/A") +
                ", Fecha de Autorización: " + (authorizationDate != null ? authorizationDate : "N/A") +
                ", Mensajes: " + (messages.isEmpty() ? "Ninguno" : String.join("; ", messages));
    }
}
