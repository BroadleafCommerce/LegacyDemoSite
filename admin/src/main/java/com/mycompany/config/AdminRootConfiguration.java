package com.mycompany.config;

import org.broadleafcommerce.common.config.EnableBroadleafAdminRootAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author Brandon Hines
 */
@Configuration
@EnableBroadleafAdminRootAutoConfiguration
@ImportResource(value = {
        "classpath:/applicationContext.xml",
        "classpath:/applicationContext-email.xml",
        "/WEB-INF/applicationContext-datasource.xml",
        "/WEB-INF/applicationContext-admin-security.xml",
        "/WEB-INF/applicationContext-admin-filter.xml",
        "/WEB-INF/applicationContext-admin.xml"})
public class AdminRootConfiguration {
}
