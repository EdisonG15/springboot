package com.empresa.facturacion.electronica.utils;
import org.apache.fop.apps.*;
import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.*;
import java.io.*;
import java.nio.file.Path;

public class FacturaPdfGenerator {
    public void generarPDFConFOP(Path xmlPath, InputStream xslStream, Path pdfOutputPath) throws Exception {
        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();

        try (OutputStream out = new FileOutputStream(pdfOutputPath.toFile())) {
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
            Transformer transformer = TransformerFactory.newInstance().newTransformer(new StreamSource(xslStream));
            Source src = new StreamSource(xmlPath.toFile());
            Result res = new SAXResult(fop.getDefaultHandler());
            transformer.transform(src, res);
        }
    }
//    public void generarPDFConFOP(Path xmlPath, Path xslPath, Path pdfOutputPath) throws Exception {
//        FopFactory fopFactory = FopFactory.newInstance(new File(".").toURI());
//        FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
//
//        try (OutputStream out = new FileOutputStream(pdfOutputPath.toFile())) {
//            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
//            Transformer transformer = TransformerFactory.newInstance()
//                    .newTransformer(new StreamSource(xslPath.toFile()));
//            Source src = new StreamSource(xmlPath.toFile());
//            Result res = new SAXResult(fop.getDefaultHandler());
//            transformer.transform(src, res);
//        }
//    }
}
