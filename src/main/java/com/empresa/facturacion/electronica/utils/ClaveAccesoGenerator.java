package com.empresa.facturacion.electronica.utils;

import org.springframework.context.annotation.Bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class ClaveAccesoGenerator {

    private final String rucEmisor;
    private final String tipoAmbiente; // "1" para pruebas, "2" para producción
    private final String codDoc; // "01" para factura
    private final String serieEstab; // Ej. "001"
    private final String ptoEmi;     // Ej. "001"

    public ClaveAccesoGenerator(String rucEmisor, String tipoAmbiente, String codDoc, String serieEstab, String ptoEmi) {
        if (rucEmisor == null || rucEmisor.length() != 13) {
            throw new IllegalArgumentException("RUC del emisor debe tener 13 dígitos.");
        }
        if (!"1".equals(tipoAmbiente) && !"2".equals(tipoAmbiente)) {
            throw new IllegalArgumentException("Tipo de ambiente debe ser '1' (pruebas) o '2' (producción).");
        }
        if (codDoc == null || codDoc.length() != 2) {
            throw new IllegalArgumentException("Código de documento debe tener 2 dígitos (ej. '01').");
        }
        if (serieEstab == null || serieEstab.length() != 3) {
            throw new IllegalArgumentException("Serie de establecimiento debe tener 3 dígitos (ej. '001').");
        }
        if (ptoEmi == null || ptoEmi.length() != 3) {
            throw new IllegalArgumentException("Punto de emisión debe tener 3 dígitos (ej. '001').");
        }

        this.rucEmisor = rucEmisor;
        this.tipoAmbiente = tipoAmbiente;
        this.codDoc = codDoc;
        this.serieEstab = serieEstab;
        this.ptoEmi = ptoEmi;
    }


    /**
     * Genera la Clave de Acceso de 49 dígitos.
     *
     * @param fechaEmision La fecha de emisión del comprobante.
     * @param secuencial El número secuencial del comprobante (ej. 1, 2, 3...). Se formateará a 9 dígitos.
     * @param tipoEmision "1" para emisión normal, "2" para contingencia.
     * @return La Clave de Acceso generada.
     * @throws IllegalArgumentException Si los parámetros no son válidos.
     */
    public String generateClaveAcceso(Date fechaEmision, long secuencial, String tipoEmision) {
        if (!"1".equals(tipoEmision) && !"2".equals(tipoEmision)) {
            throw new IllegalArgumentException("Tipo de emisión debe ser '1' (normal) o '2' (contingencia).");
        }

        // 1. Fecha de Emisión (ddMMyyyy)
        SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy");
        String fechaEmisionStr = sdf.format(fechaEmision);

        // 6. Número de Documento (Secuencial) - 9 dígitos, rellenar con ceros a la izquierda
        String secuencialStr = String.format("%09d", secuencial);

        // 7. Código Numérico - 8 dígitos aleatorios
        String codigoNumerico = String.format("%08d", new Random().nextInt(100_000_000)); // Genera un número de 0 a 99,999,999

        // Construir la clave sin el dígito verificador (48 dígitos)
        StringBuilder claveSinDV = new StringBuilder();
        claveSinDV.append(fechaEmisionStr)          // 8
                .append(codDoc)                    // 2
                .append(rucEmisor)                 // 13
                .append(tipoAmbiente)              // 1
                .append(serieEstab)                // 3
                .append(ptoEmi)                    // 3
                .append(secuencialStr)             // 9
                .append(codigoNumerico)            // 8
                .append(tipoEmision);              // 1
        // Total: 8+2+13+1+3+3+9+8+1 = 48 dígitos

        // 8. Dígito Verificador (Módulo 11)
        int digitoVerificador = calculateModulo11(claveSinDV.toString());

        // Clave de Acceso final (49 dígitos)
        return claveSinDV.append(digitoVerificador).toString();
    }

    /**
     * Calcula el dígito verificador usando el algoritmo Módulo 11.
     *
     * @param data Los dígitos sobre los cuales calcular el módulo 11.
     * @return El dígito verificador (0-9).
     */
    private int calculateModulo11(String data) {
        int sum = 0;
        int factor = 2; // Inicia con 2

        // Recorrer la cadena de derecha a izquierda
        for (int i = data.length() - 1; i >= 0; i--) {
            int digit = Character.getNumericValue(data.charAt(i));
            sum += digit * factor;
            factor++;
            if (factor > 7) { // La secuencia de pesos es 2,3,4,5,6,7 y se repite
                factor = 2;
            }
        }

        int remainder = sum % 11;
        int dv;

        if (remainder == 0) {
            dv = 0;
        } else if (remainder == 1) {
            dv = 1; // Según especificación del SRI, si el residuo es 1, el DV es 1.
        } else {
            dv = 11 - remainder;
        }

        return dv;
    }
}
