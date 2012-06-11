package com.mycompany.controller;

import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.service.CartService;
import org.broadleafcommerce.core.order.service.call.OrderItemRequestDTO;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@Controller
public class DefaultController {
	
	@Resource(name = "blCatalogService")
	protected CatalogService catalogService;
	
    @Resource(name="blCartService")
    protected CartService cartService;
    
    @Resource(name="blCustomerState")
    protected CustomerState customerState;
    
    @ModelAttribute(value = "cart")
    protected Order getCart(HttpServletRequest request) {
    	Customer customer = customerState.getCustomer(request);
    	Order cart = cartService.findCartForCustomer(customer);
    	
    	if (cart == null) { 
    		cart = cartService.createNewCartForCustomer(customer);
    	}
    	
    	return cart;
    }
    
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
	
	@RequestMapping({"/login", "/register"})
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		return ajaxRender("modals/login", request, model);
	}
	
	@RequestMapping("/clearcart")
	public String clearcart(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
    	Customer customer = customerState.getCustomer(request);
    	Order cart = cartService.findCartForCustomer(customer);
    	cartService.cancelOrder(cart);
    	return "redirect:/";
	}
	
	@RequestMapping("/cart")
	public String cart(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		return ajaxRender("modals/cart", request, model);
	}
	
	@RequestMapping("/hot-sauces/{productId}")
	public String productDetail(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable Long productId) {
		Product product = catalogService.findProductById(productId);
		
		model.addAttribute("product", product);
		return "product";
	}
	
	@RequestMapping("/test")
	@ResponseBody
	public String addToCar1t(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "OK";
	}
			
	@RequestMapping("/addToCart")
	public String addToCart(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="productId") Long productId) throws IOException {
		Customer customer = customerState.getCustomer(request);
		Order cart = null;
		try {
			cart = addSkuToCart(customer, productId);
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		if (isAjaxRequest(request)) {
			// If it's an AJAX request, the request expects that the total number of items in the
			// cart is returned so that it can update the header
			if (cart != null) {
				response.getWriter().write(String.valueOf(cart.getItemCount()));
			}
			return null;
		}
		
		return "redirect:/cart";
	}
	
	
    protected Order addSkuToCart(Customer customer, Long productId) throws PricingException {
		Order cart = cartService.findCartForCustomer(customer);
		if (cart == null) {
			cart = cartService.createNewCartForCustomer(customer);
		}
		
		Product product = catalogService.findProductById(productId);
		OrderItemRequestDTO itemRequest = new OrderItemRequestDTO();
		
		itemRequest.setQuantity(1);
		itemRequest.setProductId(product.getId());   
		
		cartService.addItemToOrder(cart.getId(), itemRequest, false);
		
		cart = cartService.save(cart,  true);
		return cart;
    }
		
    protected boolean isAjaxRequest(HttpServletRequest request) {
    	return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
    
    protected String ajaxRender(String modalPath, HttpServletRequest request, Model model) {
    	if (isAjaxRequest(request)) {
    		return modalPath;
    	} else {
    		model.addAttribute("modalPath", modalPath);
    		return "modalContainer";
    	}
    }


}
