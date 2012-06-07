package com.mycompany.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {
	
	@Resource(name = "blCatalogService")
	protected CatalogService catalogService;

	@RequestMapping("/")
	public String home(HttpServletRequest request, HttpServletResponse response) {
		return "index";
	}
	
	@RequestMapping("/hot-sauces")
	public String hotSauces(HttpServletRequest request, HttpServletResponse response, Model model) {
		Category category = catalogService.findCategoriesByName("Hot Sauces").get(0);
		List<Product> products = catalogService.findProductsForCategory(category);
		
		model.addAttribute("products", products);
		
		return "category";
	}

}
