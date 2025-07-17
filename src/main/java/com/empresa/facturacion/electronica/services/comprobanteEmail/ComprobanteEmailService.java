package com.empresa.facturacion.electronica.services.comprobanteEmail;

import com.empresa.facturacion.electronica.dto.common.response.StandardResponse;

public interface ComprobanteEmailService {
     StandardResponse enviarComprobantePorCorreo(String claveAcceso) throws Exception ;
}
