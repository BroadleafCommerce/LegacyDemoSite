package com.mycompany.web.config;

import org.broadleafcommerce.common.config.EnableBroadleafAdminServletAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author Brandon Hines
 */
@Configuration
@EnableBroadleafAdminServletAutoConfiguration
@ImportResource({"/WEB-INF/applicationContext-servlet-admin.xml"})
public class AdminServletContextConfiguration {
}
