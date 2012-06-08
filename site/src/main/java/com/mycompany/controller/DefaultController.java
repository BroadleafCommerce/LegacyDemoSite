package com.mycompany.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.CartService;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {
	
	@Resource(name = "blCatalogService")
	protected CatalogService catalogService;
	
    @Resource(name="blCartService")
    protected CartService cartService;
    
    @Resource(name="blCustomerState")
    protected CustomerState customerState;

	@RequestMapping("/")
	public String home(HttpServletRequest request, HttpServletResponse response) {
		return "index";
	}
	
	@RequestMapping("/hot-sauces")
	public String hotSauces(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		Category category = catalogService.findCategoriesByName("Hot Sauces").get(0);
		List<Product> products = catalogService.findProductsForCategory(category);
		
		Order cart = cartService.createNewCartForCustomer(customerState.getCustomer(request));
		
		Sku sku = catalogService.findSkuById(15L);
		OrderItemRequestDTO itemRequest = new OrderItemRequestDTO();
		
		itemRequest.setQuantity(1);
		itemRequest.setSkuId(sku.getId());   
		
		cartService.addItemToOrder(cart.getId(), itemRequest, false);
		
		model.addAttribute("products", products);
		model.addAttribute("cart", cart);
		
		return "category";
	}
	
	@RequestMapping("/hot_sauces/{productId}")
	public String productDetail(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable Long productId) throws PricingException {
		Product product = catalogService.findProductById(productId);
		
		Order cart = cartService.createNewCartForCustomer(customerState.getCustomer(request));
		
		if (productId % 2 == 0) {
			OrderItemRequestDTO itemRequest = new OrderItemRequestDTO();
			itemRequest.setQuantity(1);
			itemRequest.setProductId(product.getId());
			
			cartService.addItemToOrder(cart.getId(), itemRequest, false);
		}
		
		model.addAttribute("product", product);
		model.addAttribute("cart", cart);
		
		return "product";
	}
	

}
