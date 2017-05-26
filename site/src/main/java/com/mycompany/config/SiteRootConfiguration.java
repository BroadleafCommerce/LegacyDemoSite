package com.mycompany.config;

import org.broadleafcommerce.common.config.EnableBroadleafSiteRootAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author Brandon Hines
 */
@Configuration
@EnableBroadleafSiteRootAutoConfiguration
@ImportResource(value = {
        "classpath:/applicationContext.xml",
        "classpath:/applicationContext-email.xml",
        "/WEB-INF/applicationContext-datasource.xml",
        "/WEB-INF/applicationContext-rest-api-security.xml",
        "/WEB-INF/applicationContext-security.xml",
        "/WEB-INF/applicationContext-filter.xml",
        "/WEB-INF/applicationContext-workflow.xml",
        "/WEB-INF/applicationContext.xml"})
public class SiteRootConfiguration {
}
