package com.empresa.facturacion.electronica.conf;

import com.empresa.facturacion.electronica.utils.ClaveAccesoGenerator;
import com.empresa.facturacion.electronica.utils.XmlSigner;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

//@Configuration
@Configuration
public class FirmaConfig {

    @Value("${firma.keystore.path}")
    private String keystorePath;

    @Value("${firma.keystore.password}")
    private String keystorePassword;

    @Value("${firma.alias}")
    private String alias;

    @Value("${firma.key.password}")
    private String privateKeyPassword;
    // --- ¡ESTE ES EL CAMBIO CLAVE! ---
    // Este método le dice a Spring cómo construir un bean de tipo XmlSigner
    @Bean
    public XmlSigner xmlSigner() {
        // Retornamos una nueva instancia de XmlSigner, usando los valores
        // que Spring ya inyectó en las variables de esta clase (FirmaConfig).
        return new XmlSigner(keystorePath, keystorePassword, alias, privateKeyPassword);
    }

    // --- ¡ESTE ES EL CAMBIO FINAL PARA ClaveAccesoGenerator! ---
    @Bean
    public ClaveAccesoGenerator claveAccesoGenerator(
            @Value("${emisor.ruc}") String rucEmisor,
            @Value("${sri.ambiente}") String tipoAmbiente,
            @Value("${emisor.coddoc}") String codDoc, // Corresponde a "01" en tu properties
            @Value("${emisor.estab}") String serieEstab, // Corresponde a "001" en tu properties
            @Value("${emisor.ptoemi}") String ptoEmi // Corresponde a "001" en tu properties
    ) {
        // Se asume que tu ClaveAccesoGenerator tiene este constructor exacto.
        // Los nombres de los parámetros no importan, solo el orden y tipo.
        return new ClaveAccesoGenerator(rucEmisor, tipoAmbiente, codDoc, serieEstab, ptoEmi);
    }
    public String getKeystorePath() {
        return keystorePath;
    }

    public void setKeystorePath(String keystorePath) {
        this.keystorePath = keystorePath;
    }

    public String getKeystorePassword() {
        return keystorePassword;
    }

    public void setKeystorePassword(String keystorePassword) {
        this.keystorePassword = keystorePassword;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getPrivateKeyPassword() {
        return privateKeyPassword;
    }

    public void setPrivateKeyPassword(String privateKeyPassword) {
        this.privateKeyPassword = privateKeyPassword;
    }
}
