package com.empresa.facturacion.electronica.services;
import javax.xml.ws.handler.LogicalHandler;
import javax.xml.ws.handler.LogicalMessageContext;
import javax.xml.ws.handler.MessageContext;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayOutputStream;

import java.io.IOException;
import java.util.logging.Logger;
public class SoapLoggingHandler implements LogicalHandler<LogicalMessageContext> {

    private static final Logger log = Logger.getLogger(SoapLoggingHandler.class.getName());

    @Override
    public boolean handleMessage(LogicalMessageContext context) {
        Boolean outboundProperty = (Boolean) context.get(MessageContext.MESSAGE_OUTBOUND_PROPERTY);

        if (Boolean.TRUE.equals(outboundProperty)) {
            log.info("SOAP Request:");
        } else {
            log.info("SOAP Response:");
        }

        try {
            Source payload = context.getMessage().getPayload();
            if (payload != null) {
                Transformer transformer = TransformerFactory.newInstance().newTransformer();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                transformer.transform(payload, new StreamResult(baos));
                log.info(baos.toString("UTF-8"));
            }
        } catch (Exception e) {
            log.severe("Error al loggear mensaje SOAP: " + e.getMessage());
        }

        return true;
    }

    @Override
    public boolean handleFault(LogicalMessageContext context) {
        log.warning("SOAP Fault detected:");
        try {
            Source payload = context.getMessage().getPayload();
            if (payload != null) {
                Transformer transformer = TransformerFactory.newInstance().newTransformer();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                transformer.transform(payload, new StreamResult(baos));
                log.warning(baos.toString("UTF-8"));
            }
        } catch (Exception e) {
            log.severe("Error al loggear fault SOAP: " + e.getMessage());
        }
        return true;
    }

    @Override
    public void close(MessageContext context) {
        // No es necesario hacer nada aquí para el logging simple
    }
}