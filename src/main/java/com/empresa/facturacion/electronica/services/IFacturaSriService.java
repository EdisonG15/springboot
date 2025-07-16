package com.empresa.facturacion.electronica.services;

import com.empresa.facturacion.electronica.dto.common.response.StandardResponse;
import com.empresa.facturacion.electronica.dto.facturacion.response.AutorizacionResponse;

public interface IFacturaSriService {

    /**
     * Procesa una factura desde su ID, genera la clave de acceso, el XML, lo firma
     * y lo envía al SRI, finalmente consulta su estado de autorización.
     *
     * @param facturaId El ID de la factura a procesar.
     * @return Un resumen del resultado del procesamiento (ej. clave de acceso y estado).
     * @throws Exception Si ocurre un error en cualquier etapa del proceso.
     */
    StandardResponse procesarYEnviarFactura(Integer facturaId) throws Exception;

    AutorizacionResponse comprobarEstadoDeAutorizacion(String claveAcceso) throws Exception;
}
