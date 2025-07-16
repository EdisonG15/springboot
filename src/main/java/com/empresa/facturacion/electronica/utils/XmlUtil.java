package com.empresa.facturacion.electronica.utils;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
public class XmlUtil {

    public static String readXmlFromResources(String fileName) {
        ClassLoader classLoader = XmlUtil.class.getClassLoader();
        try (InputStream inputStream = classLoader.getResourceAsStream(fileName)) {
            if (inputStream == null) {
                throw new RuntimeException("Archivo no encontrado: " + fileName);
            }
            Scanner scanner = new Scanner(inputStream, StandardCharsets.UTF_8.name());
            String xml = scanner.useDelimiter("\\A").next();
            scanner.close();
            return xml;
        } catch (Exception e) {
            throw new RuntimeException("Error al leer el XML: " + fileName, e);
        }
    }
}
