package com.empresa.facturacion.electronica.utils;
import com.empresa.facturacion.electronica.entities.factura.FacturaElectronica;
import javax.xml.bind.*;
import javax.xml.namespace.QName;

import org.springframework.stereotype.Component;

import java.io.*;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;

@Component
public class XmlGenerator {
    // Suponiendo que 'factura' es tu objeto FacturaElectronica
// ... (código existente) ...

    public String generateXml(FacturaElectronica factura) throws Exception {
        JAXBContext jaxbContext = JAXBContext.newInstance(FacturaElectronica.class);
        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        jaxbMarshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");

        QName qName = new QName("", "factura");
        JAXBElement<FacturaElectronica> root = new JAXBElement<>(qName, FacturaElectronica.class, factura);

        StringWriter sw = new StringWriter();
        jaxbMarshaller.marshal(root, sw);
        String xmlString = sw.toString();

        // Eliminar standalone="yes"
        xmlString = xmlString.replace("standalone=\"yes\"", "");

        // Ya no necesitas guardar a un archivo "factura_unsigned.xml" para la firma
        // Esto es solo para depuración si lo quieres:
        try (Writer fileWriter = new BufferedWriter(new OutputStreamWriter(
                new FileOutputStream("factura_unsigned_temp.xml"), StandardCharsets.UTF_8))) {
            fileWriter.write(xmlString);
        }

        return xmlString;
    }
}

//    public String generateXml(FacturaElectronica factura) throws Exception {
//        JAXBContext jaxbContext = JAXBContext.newInstance(FacturaElectronica.class);
//        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
//
//        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        jaxbMarshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
//
//
//       // QName qName = new QName( "factura", ""); // "" para prefijo nulo
//        QName qName = new QName("", "factura"); // URI de espacio de nombres vacío y nombre local "factura"
//        JAXBElement<FacturaElectronica> root = new JAXBElement<>(qName, FacturaElectronica.class, factura);
//
//        StringWriter sw = new StringWriter();
//        jaxbMarshaller.marshal(root, sw);
//        String xmlString = sw.toString();
//
//        // Eliminar standalone="yes"
//        xmlString = xmlString.replace("standalone=\"yes\"", "");
//
//        // Guardar archivo
//        try (Writer fileWriter = new BufferedWriter(new OutputStreamWriter(
//                new FileOutputStream("factura_unsigned.xml"), StandardCharsets.UTF_8))) {
//            fileWriter.write(xmlString);
//        }
//
//        return xmlString;
//    }

  //  **********************************************************************************************************************************************
//    public String generateXml(FacturaElectronica factura) throws Exception {
//        JAXBContext jaxbContext = JAXBContext.newInstance(FacturaElectronica.class);
//        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
//
//        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        jaxbMarshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
//
//        // Crear el JAXBElement sin prefijo
//        QName qName = new QName("http://www.sri.gob.ec/comprobantesElectronicos", "factura");
//        JAXBElement<FacturaElectronica> root = new JAXBElement<>(qName, FacturaElectronica.class, factura);
//
//        StringWriter sw = new StringWriter();
//        jaxbMarshaller.marshal(root, sw);
//        String xmlString = sw.toString();
//
//        // Eliminar standalone="yes"
//        xmlString = xmlString.replace("standalone=\"yes\"", "");
//
//        // Guardar archivo
//        try (Writer fileWriter = new BufferedWriter(new OutputStreamWriter(
//                new FileOutputStream("factura_unsigned.xml"), StandardCharsets.UTF_8))) {
//            fileWriter.write(xmlString);
//        }
//
//        return xmlString;
//    }


//    public String generateXml(FacturaElectronica factura) throws Exception {
//        JAXBContext jaxbContext = JAXBContext.newInstance(FacturaElectronica.class);
//        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
//
//        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        jaxbMarshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
//
//        StringWriter sw = new StringWriter();
//        jaxbMarshaller.marshal(factura, sw);
//        String xmlString = sw.toString();
//
//        // Eliminar standalone="yes"
//        xmlString = xmlString.replace("standalone=\"yes\"", "");
//
//        // Opcional: guardar sin standalone
//        try (Writer fileWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("factura_unsigned.xml"), StandardCharsets.UTF_8))) {
//            fileWriter.write(xmlString);
//        }
//
//        return xmlString;
//    }


//
//    public String generateXml(FacturaElectronica factura) throws Exception {
//        JAXBContext jaxbContext = JAXBContext.newInstance(FacturaElectronica.class);
//        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
//
//        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        jaxbMarshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8"); // Asegurar codificación UTF-8
//
//        StringWriter sw = new StringWriter();
//        jaxbMarshaller.marshal(factura, sw);
//        String xmlString = sw.toString();
//
//        // Opcionalmente, guardar en un archivo
//         jaxbMarshaller.marshal(factura, new File("factura_unsigned.xml"));
//
//        return xmlString;
//}

//}