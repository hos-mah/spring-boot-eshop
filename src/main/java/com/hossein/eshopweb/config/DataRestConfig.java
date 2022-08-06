package com.hossein.eshopweb.config;

import com.hossein.eshopweb.entity.Country;
import com.hossein.eshopweb.entity.Product;
import com.hossein.eshopweb.entity.ProductCategory;
import com.hossein.eshopweb.entity.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Configuration
public class DataRestConfig implements RepositoryRestConfigurer {
    private EntityManager entityManager;

    @Value("${allowed.origins}")
    private String[] theAllowedOrigins;

    @Autowired
    public DataRestConfig(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {

        HttpMethod[] unSupportActions = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE, HttpMethod.PATCH};
        disableHttpMethods(Product.class, config, unSupportActions);
        disableHttpMethods(ProductCategory.class, config, unSupportActions);
        disableHttpMethods(Country.class, config, unSupportActions);
        disableHttpMethods(State.class, config, unSupportActions);

        //expose id of entities
        exposeIds(config);

        cors.addMapping(config.getBasePath() + "/**").allowedOrigins(theAllowedOrigins);

    }

    private void disableHttpMethods(Class theEntityClass, RepositoryRestConfiguration config, HttpMethod[] unSupportActions) {
        config.getExposureConfiguration()
                .forDomainType(theEntityClass)
                .withItemExposure(((metdata, httpMethods) -> httpMethods.disable(unSupportActions)))
                .withCollectionExposure(((metdata, httpMethods) -> httpMethods.disable(unSupportActions)));
    }

    private void exposeIds(RepositoryRestConfiguration config) {
        Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();

        List<Class> entityClasses = new ArrayList<>();

        for (EntityType<?> entity : entities) {
            entityClasses.add(entity.getJavaType());
        }

        Class[] classes = entityClasses.toArray(new Class[0]);

        config.exposeIdsFor(classes);
    }
}
