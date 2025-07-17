package com.empresa.facturacion.electronica.services.comprobanteEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.nio.charset.StandardCharsets;
import org.springframework.stereotype.Service;

@Service
public class EmailService {


    private static final Logger log = LoggerFactory.getLogger(EmailService.class);

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendEmailWithAttachments(
            String from,
            String to,
            String subject,
            String body,
            File xmlFile,
            File pdfFile) throws MessagingException {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(
                message,
                true, // true indica que es un correo multipart (para adjuntos)
                StandardCharsets.UTF_8.name()); // Codificación

        helper.setFrom(from);
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(body, true); // true indica que el cuerpo puede ser HTML

        // Adjuntar XML
        if (xmlFile != null && xmlFile.exists() && xmlFile.canRead()) {
            helper.addAttachment(xmlFile.getName(), xmlFile);
            log.info("Adjuntando archivo XML: {}", xmlFile.getName());
        } else {
            log.warn("Archivo XML no encontrado, nulo o no se puede leer para adjuntar.");
        }

        // Adjuntar PDF
        if (pdfFile != null && pdfFile.exists() && pdfFile.canRead()) {
            helper.addAttachment(pdfFile.getName(), pdfFile);
            log.info("Adjuntando archivo PDF: {}", pdfFile.getName());
        } else {
            log.warn("Archivo PDF no encontrado, nulo o no se puede leer para adjuntar.");
        }

        try {
            mailSender.send(message);
            log.info("Correo enviado exitosamente de {} a {} con asunto: {}", from, to, subject);
        } catch (Exception e) {
            log.error("Error al enviar el correo electrónico: {}", e.getMessage(), e);
            throw e; // Relanza la excepción para que sea manejada por el servicio que llama
        }
    }
}
