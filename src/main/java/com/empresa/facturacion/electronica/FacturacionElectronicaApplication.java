package com.empresa.facturacion.electronica;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class
FacturacionElectronicaApplication {

	public static void main(String[] args) {
		SpringApplication.run(FacturacionElectronicaApplication.class, args);
		// Configura estas propiedades SOLO si estás usando un proxy
//		System.setProperty("http.proxyHost", "tu.proxy.host"); // Reemplaza con la IP o nombre de host de tu proxy
//		System.setProperty("http.proxyPort", "8080");          // Reemplaza con el puerto de tu proxy (ej. 8080, 3128)
//		System.setProperty("https.proxyHost", "tu.proxy.host");
//		System.setProperty("https.proxyPort", "8080");

//		System.setProperty("http.proxyHost", "proxy.gob.ec");
//		System.setProperty("http.proxyPort", "8080");
//		System.setProperty("https.proxyHost", "proxy.gob.ec");
//		System.setProperty("https.proxyPort", "8080");


// Si tu proxy requiere autenticación (menos común, pero posible)
// System.setProperty("http.proxyUser", "usuario");
// System.setProperty("http.proxyPassword", "contraseña");
	}

}
