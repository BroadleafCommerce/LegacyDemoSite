package com.mycompany.api;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.broadleafcommerce.rest.api.BroadleafRestApiMvcConfiguration;


@Configuration
@EnableWebMvc
@ComponentScan("com.mycompany.api")
public class RestApiMvcConfiguration extends BroadleafRestApiMvcConfiguration {
    
}
