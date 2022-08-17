
package com.hossein.eshopweb.config;

import com.okta.spring.boot.oauth.Okta;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.actuate.autoconfigure.security.servlet.EndpointRequest;
//import org.springframework.boot.actuate.health.HealthEndpoint;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.savedrequest.NullRequestCache;


@Configuration
@EnableWebSecurity
public class SecurityWebConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/api/orders/**").authenticated()
//                .antMatchers(HttpMethod.GET, "/*").permitAll()
                .and().oauth2ResourceServer()
                .jwt();
//                .requestMatchers(EndpointRequest.to(HealthEndpoint.class)).permitAll()
//                .requestMatchers(EndpointRequest.toAnyEndpoint()).permitAll();
        http.cors();

        /* csrf perform checks on POST using cookies and by default is enabled
           if we don't use cookies for session tracking, csrf says it is unauthorized
         */
        http.csrf().disable();

        Okta.configureResourceServer401ResponseBody(http);
    }
//    @Autowired
//    private AuthenticationEntryPoint authenticationEntryPoint;
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().
//                authorizeRequests().antMatchers(HttpMethod.GET, "/**").hasAnyRole("ADMIN", "USER")
//                .antMatchers(HttpMethod.POST, "/api/**").hasAnyRole("ADMIN", "USER")
//                .antMatchers(HttpMethod.POST, "/routeB/**").hasRole("ADMIN")
//                .antMatchers(HttpMethod.DELETE, "/routeB/**").hasRole("ADMIN").and().
//                requestCache().requestCache(new NullRequestCache()).and().
//                httpBasic().authenticationEntryPoint(authenticationEntryPoint).and().
//                cors().and().
//                csrf().disable();
//    }

//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http.httpBasic().and().authorizeRequests()
//                .antMatchers(HttpMethod.POST, "/api/**").permitAll()
//                .antMatchers(HttpMethod.PUT, "/api/**").permitAll()
//                .antMatchers("/api/orders/**").authenticated()
//                .antMatchers(HttpMethod.GET, "/*").permitAll()
//                .and().oauth2ResourceServer()
//                .jwt();
////                .requestMatchers(EndpointRequest.to(HealthEndpoint.class)).permitAll()
////                .requestMatchers(EndpointRequest.toAnyEndpoint()).permitAll();
//        http.cors()
//                .and().csrf().disable();
//        return Okta.configureResourceServer401ResponseBody(http).build();
//    }
}

