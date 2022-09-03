package com.hossein.eshopweb.monitor;

import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Endpoint(id = "custom")
@Component
public class CustomEndpoint {

    @ReadOperation
    public Map<String, String> customEndpoint(String id){
        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        return map;
    }

}
