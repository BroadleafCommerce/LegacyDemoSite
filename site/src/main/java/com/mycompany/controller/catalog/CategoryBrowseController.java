package com.mycompany.controller.catalog;

import org.broadleafcommerce.core.web.controller.catalog.DefaultCategoryBrowseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class CategoryBrowseController extends DefaultCategoryBrowseController {
	
	//FIXME-APA: This needs to be dynamic
	@RequestMapping("/hot-sauces")
	public String hotSauces(HttpServletRequest request, HttpServletResponse response, Model model) {
		return super.hotSauces(request, response, model);
	}
	
	//FIXME-APA: This needs to be dynamic
	@RequestMapping("/hot-sauces/{productId}")
	public String productDetail(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable Long productId) {
		return super.productDetail(request, response, model, productId);
	}
	
}
