package com.mycompany.web.config;

import org.broadleafcommerce.common.config.EnableBroadleafSiteServletAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * @author Brandon Hines (bhines@broadleafcommerce.com)
 */
@Configuration
@EnableBroadleafSiteServletAutoConfiguration
@ImportResource({"/WEB-INF/applicationContext-servlet.xml"})
public class SiteServletContextConfiguration {
}
