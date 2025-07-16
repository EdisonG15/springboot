package com.empresa.facturacion.electronica.utils;
import org.apache.xml.security.Init;
import org.apache.xml.security.c14n.Canonicalizer;
import org.apache.xml.security.keys.KeyInfo;
import org.apache.xml.security.signature.XMLSignature;
import org.apache.xml.security.transforms.Transforms;
import org.apache.xml.security.utils.Constants;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

import javax.security.auth.x500.X500Principal;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayInputStream;
import java.io.StringWriter;
import java.math.BigInteger;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;
//import org.apache.xml.security.Init;
//import org.apache.xml.security.c14n.Canonicalizer;
//import org.apache.xml.security.signature.XMLSignature;
//import org.apache.xml.security.transforms.Transforms;
//import org.apache.xml.security.utils.Constants;
//import org.apache.xml.security.utils.XMLUtils;
//import org.apache.xml.security.signature.ObjectContainer;
//import org.apache.xml.security.keys.KeyInfo;
//import org.apache.xml.security.keys.content.X509Data;
//import org.apache.xml.security.algorithms.MessageDigestAlgorithm; // Importar esto
//
//import org.w3c.dom.Document;
//import org.w3c.dom.Element;
//import org.w3c.dom.NodeList;
//import org.xml.sax.InputSource;
//
//import javax.security.auth.x500.X500Principal;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;
//import javax.xml.transform.OutputKeys;
//import javax.xml.transform.Transformer;
//import javax.xml.transform.TransformerFactory;
//import javax.xml.transform.dom.DOMSource;
//import javax.xml.transform.stream.StreamResult;
//import javax.xml.bind.JAXBContext;
//import javax.xml.bind.Marshaller;
//import javax.xml.bind.JAXBElement;
//import javax.xml.namespace.QName;
//
//import java.io.*;
//import java.nio.charset.StandardCharsets;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//import java.security.KeyStore;
//import java.security.MessageDigest;
//import java.security.PrivateKey;
//import java.security.cert.Certificate;
//import java.security.cert.X509Certificate;
//import java.text.SimpleDateFormat;
//import java.util.*;


public class XmlSigner {
    private final String keystorePath;
    private final String keystorePassword;
    private final String privateKeyAlias;
    private final String privateKeyPassword;

    // --- CAMBIO CLAVE: Algoritmos para versión 1.1.0 (SHA-256)
    private static final String SIGNATURE_ALGORITHM_V1_1_0 = "http://www.w3.org/2001/04/xmldsig-more#rsa-sha256";
    private static final String DIGEST_ALGORITHM_V1_1_0 = "http://www.w3.org/2001/04/xmlenc#sha256";
    // Si necesitas soportar 1.0.0, tendrías que mantener los SHA1 y usar la lógica condicional
    // pero el facturador del SRI usa 1.1.0 con SHA256.

    static {
        Init.init();
    }

    public XmlSigner(String keystorePath, String keystorePassword, String privateKeyAlias, String privateKeyPassword) {
        this.keystorePath = keystorePath;
        this.keystorePassword = keystorePassword;
        this.privateKeyAlias = privateKeyAlias;
        this.privateKeyPassword = privateKeyPassword;
    }

    public String signXml(String xmlString, String xmlVersion) throws Exception {

        String signatureAlgorithm;
        String digestAlgorithm;
        String certDigestAlgorithm;

        // --- CAMBIO CLAVE: Asumiendo que SIEMPRE usaremos 1.1.0 como el facturador del SRI
        // Si tu XML de entrada es 1.0.0, NECESITAS cambiarlo a 1.1.0 antes de firmar.
        // O bien, asegurar que el xmlVersion que se pasa aquí sea "1.1.0"
        if (!"1.1.0".equals(xmlVersion)) {
            System.out.println("Advertencia: Se recomienda usar XML version 1.1.0 para el SRI con SHA-256. Se forzará SHA-256.");
        }
        signatureAlgorithm = SIGNATURE_ALGORITHM_V1_1_0;
        digestAlgorithm = DIGEST_ALGORITHM_V1_1_0;
        certDigestAlgorithm = DIGEST_ALGORITHM_V1_1_0;
        // --- FIN CAMBIO CLAVE ---


        // Cargar el certificado y la clave privada
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(new java.io.FileInputStream(keystorePath), keystorePassword.toCharArray());

        PrivateKey privateKey = (PrivateKey) ks.getKey(privateKeyAlias, privateKeyPassword.toCharArray());
        X509Certificate userCert = (X509Certificate) ks.getCertificate(privateKeyAlias);

        // Parsear el XML
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setNamespaceAware(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(new InputSource(new ByteArrayInputStream(xmlString.getBytes("UTF-8"))));

        // Obtener el elemento raíz y asegurar el ID para la referencia
        Element rootElement = doc.getDocumentElement();
        rootElement.setAttribute("id", "comprobante");
        rootElement.setIdAttribute("id", true);
        // --- CAMBIO CLAVE: Asegurarse que la versión del comprobante es "1.1.0"
        rootElement.setAttribute("version", "1.1.0");
        // --- FIN CAMBIO CLAVE ---

        // Generar IDs únicos para la firma y las propiedades XAdES
        // --- CAMBIO CLAVE: Los IDs en el SRI Facturador son UUIDs con prefijo "xmldsig-"
        String signatureId = "xmldsig-" + UUID.randomUUID().toString();
        String signedPropertiesId = signatureId + "-signedprops";
        String mainReferenceId = signatureId + "-ref0"; // Nuevo ID para la referencia principal
        // El ds:Object en el facturador del SRI no tiene ID, pero QualifyingProperties sí,
        // no es necesario un ID para ds:Object si ya tenemos el Target en QualifyingProperties
        // String objectId = signatureId + "-Object" + UUID.randomUUID().toString().replace("-", ""); // Esto ya no es estrictamente necesario si no se usa
        // --- FIN CAMBIO CLAVE ---

        // Crear el objeto XMLSignature
        // --- CAMBIO CLAVE: CanonicalizationMethod para SignedInfo es Inclusivo, no Exclusivo
        XMLSignature sig = new XMLSignature(doc, null, signatureAlgorithm, Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS); // ALGO_ID_C14N_OMIT_COMMENTS es el inclusivo
        sig.setId(signatureId);
        // --- FIN CAMBIO CLAVE ---

        // Adjuntar la firma al elemento raíz
        rootElement.appendChild(sig.getElement());

        // Referencia principal al documento XML (el comprobante)
//        Transforms transforms = new Transforms(doc);
//        transforms.addTransform(Transforms.TRANSFORM_ENVELOPED_SIGNATURE);
//        // --- CAMBIO CLAVE: Añadir Id a la referencia principal
//        org.apache.xml.security.signature.Reference mainRef = sig.addDocument("#comprobante", transforms, digestAlgorithm);
//        mainRef.setId(mainReferenceId);
//        // --- FIN CAMBIO CLAVE ---


        // Referencia principal al documento XML (el comprobante)
        Transforms transforms = new Transforms(doc);
        transforms.addTransform(Transforms.TRANSFORM_ENVELOPED_SIGNATURE);

        // --- CAMBIO CLAVE: Llama a addDocument sin capturar el retorno
        sig.addDocument("#comprobante", transforms, digestAlgorithm);

        // --- CAMBIO CLAVE: Obtiene la referencia del SignedInfo de la firma
        // La referencia principal es la primera (índice 0)
        org.apache.xml.security.signature.Reference mainRef = (org.apache.xml.security.signature.Reference) sig.getSignedInfo().item(0);
        mainRef.setId(mainReferenceId); // Asigna el ID aquí
        // --- FIN CAMBIO CLAVE ---

        // --- Configuración XAdES ---
        // Crear el contenedor de propiedades XAdES (ds:Object)
        org.apache.xml.security.signature.ObjectContainer objectContainer = new org.apache.xml.security.signature.ObjectContainer(doc);
        // --- CAMBIO CLAVE: El ObjectContainer en el XML del SRI no tiene un ID, así que lo quitamos
        // objectContainer.setId(objectId);
        // objectContainer.getElement().setIdAttribute("Id", true); // No es necesario si no hay ID
        // --- FIN CAMBIO CLAVE ---
        sig.appendObject(objectContainer);

        // Crear las QualifyingProperties
        // --- CAMBIO CLAVE: Usar namespace prefix "xades" y añadir xades141 namespace
        Element qualifyingProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:QualifyingProperties");
        qualifyingProperties.setAttributeNS("http://www.w3.org/2000/xmlns/", "xmlns:xades141", "http://uri.etsi.org/01903/v1.4.1#");
        // --- FIN CAMBIO CLAVE ---
        qualifyingProperties.setAttribute("Target", "#" + signatureId);
        objectContainer.getElement().appendChild(qualifyingProperties);

        // Crear las SignedProperties
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element signedProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SignedProperties");
        signedProperties.setAttribute("Id", signedPropertiesId);
        signedProperties.setIdAttribute("Id", true);
        qualifyingProperties.appendChild(signedProperties);

        // --- SignedSignatureProperties ---
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element signedSignatureProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SignedSignatureProperties");
        signedProperties.appendChild(signedSignatureProperties);

        // SigningTime
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element signingTime = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SigningTime");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
        sdf.setTimeZone(TimeZone.getTimeZone("America/Guayaquil"));
        signingTime.setTextContent(sdf.format(new Date()));
        signedSignatureProperties.appendChild(signingTime);

        // SigningCertificate
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element signingCertificate = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SigningCertificate");
        Element cert = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:Cert");
        signingCertificate.appendChild(cert);

        // CertDigest
        // --- CAMBIO CLAVE: Usar namespace prefix "xades" para CertDigest y sus hijos
        Element certDigest = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:CertDigest");
        Element digestMethodElement = doc.createElementNS(Constants.SignatureSpecNS, "ds:DigestMethod"); // ds: siempre
        digestMethodElement.setAttribute("Algorithm", certDigestAlgorithm);
        certDigest.appendChild(digestMethodElement);

        byte[] certHash = java.security.MessageDigest.getInstance("SHA-256").digest(userCert.getEncoded()); // Siempre SHA-256 para certDigest
        Element digestValueElement = doc.createElementNS(Constants.SignatureSpecNS, "ds:DigestValue"); // ds: siempre
        digestValueElement.setTextContent(Base64.getEncoder().encodeToString(certHash));
        certDigest.appendChild(digestValueElement);
        cert.appendChild(certDigest);

        // IssuerSerial
        // --- CAMBIO CLAVE: Usar namespace prefix "xades" para IssuerSerial
        Element issuerSerial = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:IssuerSerial");
        Element issuerName = doc.createElementNS(Constants.SignatureSpecNS, "ds:X509IssuerName"); // ds: siempre

        // --- CAMBIO CLAVE: NO LIMPIAR X509IssuerName. Devolverlo a su estado original (RFC2253).
        issuerName.setTextContent(userCert.getIssuerX500Principal().getName(X500Principal.RFC2253));
        // --- FIN CAMBIO CLAVE ---

        Element serialNumber = doc.createElementNS(Constants.SignatureSpecNS, "ds:X509SerialNumber"); // ds: siempre
        BigInteger certSerial = userCert.getSerialNumber();
        serialNumber.setTextContent(certSerial.toString()); // Mantener decimal

        issuerSerial.appendChild(issuerName);
        issuerSerial.appendChild(serialNumber);
        cert.appendChild(issuerSerial);
        signedSignatureProperties.appendChild(signingCertificate);

        // --- SignedDataObjectProperties ---
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element signedDataObjectProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SignedDataObjectProperties");
        signedProperties.appendChild(signedDataObjectProperties);

        // DataObjectFormat
        // --- CAMBIO CLAVE: Usar namespace prefix "xades" y referenciar mainReferenceId
        Element dataObjectFormat = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:DataObjectFormat");
        dataObjectFormat.setAttribute("ObjectReference", "#" + mainReferenceId); // Referencia a la nueva ID de la referencia principal
        signedDataObjectProperties.appendChild(dataObjectFormat);

        // Description
        // --- CAMBIO CLAVE: Cambiar texto de la descripción
        Element description = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:Description");
        description.setTextContent("FIRMA DIGITAL SRI"); // Coincide con el facturador del SRI
        dataObjectFormat.appendChild(description);

        // MimeType
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element mimeType = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:MimeType");
        mimeType.setTextContent("text/xml");
        dataObjectFormat.appendChild(mimeType);

        // Encoding
        // --- CAMBIO CLAVE: Usar namespace prefix "xades"
        Element encoding = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:Encoding");
        encoding.setTextContent("UTF-8");
        dataObjectFormat.appendChild(encoding);

//        // REFERENCIAR LAS PROPIEDADES XADES
//        Transforms xadesTransforms = new Transforms(doc);
//        xadesTransforms.addTransform(Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS);
//        // --- CAMBIO CLAVE: Añadir el atributo Type y usar el DigestMethod correcto
//        org.apache.xml.security.signature.Reference signedPropsRef = sig.addDocument("#" + signedPropertiesId, xadesTransforms, digestAlgorithm);
//        signedPropsRef.setType("http://uri.etsi.org/01903#SignedProperties");
//        // --- FIN CAMBIO CLAVE ---
        // REFERENCIAR LAS PROPIEDADES XADES
        Transforms xadesTransforms = new Transforms(doc);
        xadesTransforms.addTransform(Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS);

        // --- CAMBIO CLAVE: Llama a addDocument sin capturar el retorno
        sig.addDocument("#" + signedPropertiesId, xadesTransforms, digestAlgorithm);

        // --- CAMBIO CLAVE: Obtiene la referencia del SignedInfo de la firma
        // La referencia a signedPropsId es la segunda (índice 1)
        org.apache.xml.security.signature.Reference signedPropsRef =
                (org.apache.xml.security.signature.Reference) sig.getSignedInfo().item(1);
        signedPropsRef.setType("http://uri.etsi.org/01903#SignedProperties");
        // --- FIN CAMBIO CLAVE ---
        // Añadir el KeyInfo con el certificado X.509
        KeyInfo keyInfo = sig.getKeyInfo();
        // --- CAMBIO CLAVE: No se le da ID al KeyInfo en el facturador del SRI.
        // String keyInfoGeneratedId = "Certificate" + UUID.randomUUID().toString().replace("-", "");
        // keyInfo.setId(keyInfoGeneratedId);
        // keyInfo.getElement().setIdAttribute("Id", true);
        // --- FIN CAMBIO CLAVE ---
        org.apache.xml.security.keys.content.X509Data x509Data = new org.apache.xml.security.keys.content.X509Data(doc);
        x509Data.addCertificate(userCert);
        keyInfo.add(x509Data);

        // Firmar el documento
        sig.sign(privateKey);

        // Convertir el Document a String
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
        transformer.setOutputProperty(OutputKeys.INDENT, "no"); // Mantener no indentado como el facturador del SRI para mayor compatibilidad
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");

        StringWriter writer = new StringWriter();
        transformer.transform(new DOMSource(doc), new StreamResult(writer));

        String signedXmlString = writer.getBuffer().toString();
        signedXmlString = signedXmlString.replace("&#13;", ""); // Mantener esto, por si acaso

        return signedXmlString;
    }

}
//    private String keystorePath;
//    private String keystorePassword;
//    private String privateKeyAlias;
//    private String privateKeyPassword;
//
//    // Constantes para los algoritmos (puedes hacerlos configurables si lo deseas)
//    // Para v1.0.0 con SHA1 (como Megadatos)
//    private static final String SIGNATURE_ALGORITHM_V1_0_0 = XMLSignature.ALGO_ID_SIGNATURE_RSA_SHA1;
//    private static final String DIGEST_ALGORITHM_V1_0_0 = MessageDigestAlgorithm.ALGO_ID_DIGEST_SHA1;
//
//    // Para v1.1.0 con SHA256 (como Factura Gratis)
//    private static final String SIGNATURE_ALGORITHM_V1_1_0 = XMLSignature.ALGO_ID_SIGNATURE_RSA_SHA256;
//    private static final String DIGEST_ALGORITHM_V1_1_0 = MessageDigestAlgorithm.ALGO_ID_DIGEST_SHA256;
//    public XmlSigner(String keystorePath, String keystorePassword, String privateKeyAlias, String privateKeyPassword) {
//        this.keystorePath = keystorePath;
//        this.keystorePassword = keystorePassword;
//        this.privateKeyAlias = privateKeyAlias;
//        this.privateKeyPassword = privateKeyPassword;
//        if (!Init.isInitialized()) {
//            Init.init();
//        }
//    }

//    public String signXml(String xmlString, String xmlVersion) throws Exception {
//        String signatureAlgorithm;
//        String digestAlgorithm;
//
//        if ("1.0.0".equals(xmlVersion)) {
//            signatureAlgorithm = SIGNATURE_ALGORITHM_V1_0_0;
//            digestAlgorithm = DIGEST_ALGORITHM_V1_0_0;
//        } else if ("1.1.0".equals(xmlVersion)) {
//            signatureAlgorithm = SIGNATURE_ALGORITHM_V1_1_0;
//            digestAlgorithm = DIGEST_ALGORITHM_V1_1_0;
//        } else {
//            throw new IllegalArgumentException("Versión de XML no soportada para la firma: " + xmlVersion);
//        }
//
//        KeyStore keyStore = KeyStore.getInstance("PKCS12");
//        try (InputStream keyFile = new FileInputStream(keystorePath)) {
//            keyStore.load(keyFile, keystorePassword.toCharArray());
//        }
//
//        PrivateKey privateKey = (PrivateKey) keyStore.getKey(privateKeyAlias, privateKeyPassword.toCharArray());
//        Certificate[] certChain = keyStore.getCertificateChain(privateKeyAlias);
//
//        if (certChain == null || certChain.length == 0) {
//            throw new Exception("No se encontró la cadena de certificados para el alias: " + privateKeyAlias);
//        }
//
//        X509Certificate userCert = (X509Certificate) certChain[0];
//
//        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//        dbf.setNamespaceAware(true);
//        DocumentBuilder builder = dbf.newDocumentBuilder();
//
//        Document doc = builder.parse(new ByteArrayInputStream(xmlString.getBytes(StandardCharsets.UTF_8)));
//
//        Element rootElement = doc.getDocumentElement();
//        if (rootElement.getAttribute("id").isEmpty()) {
//            rootElement.setAttribute("id", "comprobante");
//        }
//        rootElement.setIdAttribute("id", true);
//
//        XMLSignature sig = new XMLSignature(doc, null, signatureAlgorithm, Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS);
//        rootElement.appendChild(sig.getElement());
//
//        Transforms transforms = new Transforms(doc);
//        transforms.addTransform(Transforms.TRANSFORM_ENVELOPED_SIGNATURE);
//        sig.addDocument("#comprobante", transforms, digestAlgorithm);
//
//        String xadesSigId = "xmldsig-" + UUID.randomUUID().toString().replace("-", "");
//        String signedPropsId = xadesSigId + "-signedprops";
//
//        sig.getElement().setAttribute("Id", xadesSigId);
//
//        // --- INICIO SECCIÓN XAdES ---
//        Element qualifyingProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:QualifyingProperties");
//        qualifyingProperties.setAttribute("Target", "#" + xadesSigId);
//
//        org.apache.xml.security.signature.ObjectContainer objectContainer = new org.apache.xml.security.signature.ObjectContainer(doc);
//        objectContainer.appendChild(qualifyingProperties);
//        sig.appendObject(objectContainer);
//
//        Element signedProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SignedProperties");
//        signedProperties.setAttribute("Id", signedPropsId);
//        signedProperties.setIdAttribute("Id", true);
//        qualifyingProperties.appendChild(signedProperties);
//
//        Element signedSignatureProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SignedSignatureProperties");
//        signedProperties.appendChild(signedSignatureProperties);
//
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
//        sdf.setTimeZone(TimeZone.getTimeZone("America/Guayaquil"));
//        Element signingTime = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SigningTime");
//        signingTime.setTextContent(sdf.format(new Date()));
//        signedSignatureProperties.appendChild(signingTime);
//
//        Element signingCertificate = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SigningCertificate");
//        Element certElement = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:Cert");
//        signingCertificate.appendChild(certElement);
//
//        Element certDigestElement = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:CertDigest");
//        Element digestMethodCert = doc.createElementNS("http://www.w3.org/2000/09/xmldsig#", "ds:DigestMethod");
//        digestMethodCert.setAttribute("Algorithm", digestAlgorithm);
//        certDigestElement.appendChild(digestMethodCert);
//
//        MessageDigest md = MessageDigest.getInstance(digestAlgorithm.endsWith("sha256") ? "SHA-256" : "SHA-1");
//        byte[] certHash = md.digest(userCert.getEncoded());
//        Element digestValueCert = doc.createElementNS("http://www.w3.org/2000/09/xmldsig#", "ds:DigestValue");
//        digestValueCert.setTextContent(Base64.getEncoder().encodeToString(certHash));
//        certDigestElement.appendChild(digestValueCert);
//        certElement.appendChild(certDigestElement);
//
//        Element issuerSerial = doc.createElementNS("http://www.w3.org/2000/09/xmldsig#", "ds:IssuerSerial");
//        Element issuerName = doc.createElementNS("http://www.w3.org/2000/09/xmldsig#", "ds:X509IssuerName");
//
//        // Limpieza del formato del IssuerName (se mantiene sin trim())
//        String originalIssuerName = userCert.getIssuerX500Principal().getName(X500Principal.RFC2253);
////        String cleanIssuerName = originalIssuerName.replaceAll("2\\.5\\.4\\.97=[^,]+,", "");
////        issuerName.setTextContent(cleanIssuerName);
//        String issuerNameRaw = userCert.getIssuerX500Principal().getName(X500Principal.RFC2253);
//        issuerName.setTextContent(issuerNameRaw);
//
//
//        Element serialNumber = doc.createElementNS("http://www.w3.org/2000/09/xmldsig#", "ds:X509SerialNumber");
//        // --- CAMBIO CRÍTICO AQUÍ: Número de serie a hexadecimal ---
//       // serialNumber.setTextContent(userCert.getSerialNumber().toString(16).toUpperCase());
//        serialNumber.setTextContent(userCert.getSerialNumber().toString());
//        // --- FIN DEL CAMBIO ---
//
//        issuerSerial.appendChild(issuerName);
//        issuerSerial.appendChild(serialNumber);
//        certElement.appendChild(issuerSerial);
//        signedSignatureProperties.appendChild(signingCertificate);
//
//        Element signedDataObjectProperties = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:SignedDataObjectProperties");
//        signedProperties.appendChild(signedDataObjectProperties);
//
//        Element dataObjectFormat = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:DataObjectFormat");
//        dataObjectFormat.setAttribute("ObjectReference", "#comprobante");
//        signedDataObjectProperties.appendChild(dataObjectFormat);
//
//        Element description = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:Description");
//        description.setTextContent("FIRMA DIGITAL SRI");
//        dataObjectFormat.appendChild(description);
//
//        Element mimeType = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:MimeType");
//        mimeType.setTextContent("text/xml");
//        dataObjectFormat.appendChild(mimeType);
//
//        Element encoding = doc.createElementNS("http://uri.etsi.org/01903/v1.3.2#", "xades:Encoding");
//        encoding.setTextContent("UTF-8");
//        dataObjectFormat.appendChild(encoding);
//
//        Transforms xadesTransforms = new Transforms(doc);
//        xadesTransforms.addTransform(Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS);
//
//        sig.addDocument("#" + signedPropsId, xadesTransforms, digestAlgorithm);
//
//        Element signatureElement = sig.getElement();
//        Element signedInfoElement = (Element) signatureElement.getElementsByTagNameNS(Constants.SignatureSpecNS, Constants._TAG_SIGNEDINFO).item(0);
//        NodeList referenceNodes = signedInfoElement.getElementsByTagNameNS(Constants.SignatureSpecNS, Constants._TAG_REFERENCE);
//
//        if (referenceNodes.getLength() > 1) {
//            Element xadesReferenceElement = (Element) referenceNodes.item(1);
//            if (xadesReferenceElement != null) {
//                xadesReferenceElement.setAttribute("Type", "http://uri.etsi.org/01903#SignedProperties");
//            } else {
//                System.err.println("ERROR: No se pudo encontrar el elemento ds:Reference para las propiedades XAdES.");
//            }
//        } else {
//            System.err.println("ADVERTENCIA: No se encontraron suficientes elementos ds:Reference.");
//        }
//
//        // --- FIN SECCIÓN XAdES ---
//
//        KeyInfo keyInfo = sig.getKeyInfo();
//        X509Data x509Data = new X509Data(doc);
//        for (Certificate cert : certChain) {
//            x509Data.addCertificate((X509Certificate) cert);
//        }
//        keyInfo.add(x509Data);
//
//        sig.sign(privateKey);
//
//        TransformerFactory tf = TransformerFactory.newInstance();
//        Transformer transformer = tf.newTransformer();
//        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
//        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
//        transformer.setOutputProperty(OutputKeys.INDENT, "no");
//        transformer.setOutputProperty(OutputKeys.STANDALONE, "no");
//
//        StringWriter writer = new StringWriter();
//        transformer.transform(new DOMSource(doc), new StreamResult(writer));
//
//        return writer.toString().replace("&#13;", "");
//    }
//}






