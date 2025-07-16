package com.empresa.facturacion.electronica.utils;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.BufferedOutputStream;
import java.io.OutputStream;
// import java.net.URI; // No la necesitamos si usamos Path.toUri() directamente
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths; // Necesitamos esta para Paths.get()

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PdfGenerator {

    private static final Logger log = LoggerFactory.getLogger(PdfGenerator.class);

    public static Path generatePdf(Path xmlFilePath, Path xsltFilePath, Path outputPdfPath) throws Exception {

        // --- CAMBIO CLAVE AQUÍ ---
        // Obtener la URI del directorio de trabajo de forma segura y portable
        // Paths.get("").toUri() obtendrá la URI del directorio de trabajo actual
        // y manejará correctamente las barras de Windows/Linux.
        // FopFactory fopFactory = FopFactory.newInstance(new URI("file:///" + System.getProperty("user.dir").replace("\\", "/") + "/")); // Esta es una forma, pero la de abajo es más robusta.
        FopFactory fopFactory = FopFactory.newInstance(Paths.get("").toUri()); // Linea 35 actualizada
        // Si tu XSLT tiene referencias a imágenes/recursos que están dentro del JAR
        // o en el classpath (ej. src/main/resources/images/logo.png),
        // FopFactory fopFactory = FopFactory.newInstance(PdfGenerator.class.getResource("/").toURI());
        // sería una mejor opción para que FOP pueda resolverlos internamente.
        // Para empezar, con Paths.get("").toUri() debería funcionar si los recursos están en el directorio de trabajo o rutas absolutas.


        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        try (OutputStream out = new BufferedOutputStream(Files.newOutputStream(outputPdfPath))) {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

            // Setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(xsltFilePath.toFile()));

            // Set up input (XML) and output (FOP)
            Source src = new StreamSource(xmlFilePath.toFile());
            Result res = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            transformer.transform(src, res);

            log.info("PDF generado correctamente en: " + outputPdfPath.toAbsolutePath());
            return outputPdfPath;

        } catch (Exception e) {
            log.error("Error durante la generación del PDF: {}", e.getMessage(), e);
            throw e;
        }
    }
}