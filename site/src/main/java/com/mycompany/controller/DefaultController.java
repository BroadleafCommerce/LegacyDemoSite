package com.mycompany.controller;

import org.broadleafcommerce.core.catalog.domain.Category;
import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.broadleafcommerce.core.order.domain.DiscreteOrderItem;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping("/checkout")
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		return "checkout";
	}
	
	@RequestMapping("/hot-sauces/{productId}")
	public String productDetail(HttpServletRequest request, HttpServletResponse response, Model model,
			@PathVariable Long productId) {
		Product product = catalogService.findProductById(productId);
		
		model.addAttribute("product", product);
		return "product";
	}
	
	@RequestMapping("/remove")
	public @ResponseBody Map<String, String> remove(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="orderItemId") Long orderItemId) throws IOException {
		Customer customer = customerState.getCustomer(request);
		Order cart = cartService.findCartForCustomer(customer);
		
		try {
			Long productId = null;
			for (DiscreteOrderItem doi : cart.getDiscreteOrderItems()) {
				if (doi.getId().equals(orderItemId)) {
					productId = doi.getProduct().getId();
				}
			}
			cart = cartService.removeItemFromOrder(cart.getId(), orderItemId);
			cart = cartService.save(cart, true);
			
			Map<String, String> responseMap = new HashMap<String, String>();
			responseMap.put("productId", String.valueOf(productId));
			responseMap.put("cartItemCount", String.valueOf(cart.getItemCount()));
			
			if (isAjaxRequest(request)) {
				return responseMap;
			} else {
				sendRedirect(request, response, "/cart");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
			
		return null;
	}
			
	//FIXME: Needs to reference SKUs, not Products
	@RequestMapping("/addToCart")
	public @ResponseBody Map<String, String> addToCart(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="productId") Long productId) throws IOException {
		Customer customer = customerState.getCustomer(request);
		Order cart = cartService.findCartForCustomer(customer);
		if (cart == null) {
			cart = cartService.createNewCartForCustomer(customer);
		}
		
		try {
			Product product = catalogService.findProductById(productId);
			OrderItemRequestDTO itemRequest = new OrderItemRequestDTO();
			
			itemRequest.setQuantity(1);
			itemRequest.setProductId(product.getId());   
			
			cartService.addItemToOrder(cart.getId(), itemRequest, false);
			cart = cartService.save(cart,  true);
			
			Map<String, String> responseMap = new HashMap<String, String>();
			responseMap.put("productId", String.valueOf(productId));
			responseMap.put("cartItemCount", String.valueOf(cart.getItemCount()));
			
			if (isAjaxRequest(request)) {
				return responseMap;
			} else {
				sendRedirect(request, response, "/cart");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		
		return null;
	}
	
	/**
	 * A helper method that takes care of concatenating the current request context
	 * to the desired path to forward the user to
	 * 
	 * @param request
	 * @param response
	 * @param path - the desired non-context-specific path to redirect the user to
	 */
	protected void sendRedirect(HttpServletRequest request, HttpServletResponse response, String path) {
		try {
			response.sendRedirect(request.getContextPath() + path);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	/**
	 * A helper method that returns whether or not the given request was invoked via an AJAX call
	 * 
	 * @param request
	 * @return - whether or not it was an AJAX request
	 */
    protected boolean isAjaxRequest(HttpServletRequest request) {
    	return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
    }
    
    /**
     * A helper method that will correctly handle either returning the partial content requested (to be displayed
     * in a modal or only update a certain part of a page for example) or render it in the modalContainer template.
     * It will determine which rendering method to use based on whether or not it was an AJAX request.
     * 
     * @param modalPath - the path to the partial content view
     * @param request
     * @param model
     * @return the String that should be returned by the method responsible for returning a view. Typically this
     * will be the method with the @RequestMapping annotation
     */
    protected String ajaxRender(String modalPath, HttpServletRequest request, Model model) {
    	if (isAjaxRequest(request)) {
    		return modalPath;
    	} else {
    		model.addAttribute("modalPath", modalPath);
    		return "modalContainer";
    	}
    }


}
