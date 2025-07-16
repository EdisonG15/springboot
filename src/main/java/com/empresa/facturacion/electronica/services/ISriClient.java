package com.empresa.facturacion.electronica.services;

import com.empresa.facturacion.electronica.dto.facturacion.response.AutorizacionResponse;

public interface ISriClient {
    /**
     * Envía un XML firmado al servicio de recepción de comprobantes del SRI.
     *
     * @param signedXml El XML de la factura ya firmado digitalmente.
     * @return La respuesta XML o String del SRI.
     * @throws Exception Si ocurre un error durante la comunicación con el SRI.
     */
    String enviarFacturaASri(String signedXml,Integer idComprobante) throws Exception;

    /**
     * Consulta el estado de autorización de un comprobante en el SRI.
     *
     * @param claveAcceso La clave de acceso del comprobante.
     * @return El estado de autorización o una respuesta del SRI.
     * @throws Exception Si ocurre un error durante la comunicación con el SRI.
     */
    AutorizacionResponse comprobarEstadoDeAutorizacion(String claveAcceso) throws Exception;
}
