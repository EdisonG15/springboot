package com.empresa.facturacion.electronica.dto.common.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StandardResponse {
    private int code;
    private String message;
    private Map<String, Object> data;
}
