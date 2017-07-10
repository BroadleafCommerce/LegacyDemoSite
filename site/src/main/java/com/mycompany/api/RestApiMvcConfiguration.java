package com.mycompany.api;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.broadleafcommerce.rest.api.BroadleafRestApiMvcConfiguration;


@Configuration
@ComponentScan("com.mycompany.api")
public class RestApiMvcConfiguration extends BroadleafRestApiMvcConfiguration {
    
}
