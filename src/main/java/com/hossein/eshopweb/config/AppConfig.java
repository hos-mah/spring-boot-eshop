package com.hossein.eshopweb.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppConfig implements WebMvcConfigurer {

    @Value("${spring.data.rest.base-path}")
    private String[] basePath;

    @Value("${allowed.origins}")
    private String[] theAllowedOrigins;

    @Override
    public void addCorsMappings(CorsRegistry corsRegistry) {
        WebMvcConfigurer.super.addCorsMappings(corsRegistry);
        corsRegistry.addMapping(basePath + "/**").allowedOrigins(theAllowedOrigins);
    }
}
