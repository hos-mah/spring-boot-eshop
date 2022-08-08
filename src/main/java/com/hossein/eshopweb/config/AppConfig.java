package com.hossein.eshopweb.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/*
This class meant to be used for a central  CrossOrigin handler for RestController but for what ever reason it is not working
redundant as @CrossOrigin in RestController only works
 */
@Configuration
@EnableWebMvc
public class AppConfig implements WebMvcConfigurer {

    @Value("${spring.data.rest.base-path}")
    private String[] basePath;

    @Value("${allowed.origins}")
    private String[] theAllowedOrigins;

    @Override
    public void addCorsMappings(CorsRegistry corsRegistry) {
        corsRegistry.addMapping(basePath + "/**").allowedOrigins(theAllowedOrigins);
    }
}
