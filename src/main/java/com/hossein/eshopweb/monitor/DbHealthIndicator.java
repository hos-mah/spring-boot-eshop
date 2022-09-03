package com.hossein.eshopweb.monitor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.boot.actuate.jdbc.DataSourceHealthIndicator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

@Component
public class DbHealthIndicator implements HealthIndicator {
    @Autowired
    JdbcTemplate template;

    @Value("${spring.datasource.driver-class-name}")
    String driverClassName;

    @Value("${spring.datasource.url}")
    String dbUrl;

    @Value("${spring.datasource.username}")
    String username;

    @Value("${spring.datasource.password}")
    String password;

    @Override
    public Health health() {
        DriverManagerDataSource ds = new DriverManagerDataSource(dbUrl, username, password);
        ds.setDriverClassName(driverClassName);
        DataSourceHealthIndicator dataSourceHealthIndicator = new DataSourceHealthIndicator(ds);
        return dataSourceHealthIndicator.getHealth(true);

    }

}
