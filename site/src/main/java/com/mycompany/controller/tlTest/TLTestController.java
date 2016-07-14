package com.mycompany.controller.tlTest;

import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/test")
public class TLTestController {

    @Resource
    protected CatalogService catalogService;

    @RequestMapping
    public String test(Model model) {
        Product product = catalogService.findProductById(1L);
        model.addAttribute("product", product);
        return "/test";
    }
}
