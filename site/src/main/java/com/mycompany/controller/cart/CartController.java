package com.mycompany.controller.cart;

import org.broadleafcommerce.core.order.service.exception.ItemNotFoundException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.controller.cart.BroadleafCartController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController extends BroadleafCartController {
	
	@RequestMapping("")
	public String cart(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		return super.cart(request, response, model);
	}
	
	@RequestMapping("/add")
	public @ResponseBody Map<String, Object> add(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam Long productId,
			@RequestParam Integer quantity) throws IOException, PricingException {
		return super.add(request, response, model, productId, quantity);
	}
	
	@RequestMapping("/updateQuantity")
	public @ResponseBody Map<String, Object> updateQuantity(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam Long orderItemId,
			@RequestParam Integer newQuantity) throws IOException, PricingException, ItemNotFoundException {
		return super.updateQuantity(request, response, model, orderItemId, newQuantity);
	}
	
	@RequestMapping("/remove")
	public @ResponseBody Map<String, Object> remove(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam Long orderItemId) throws IOException, PricingException {
		return super.remove(request, response, model, orderItemId);
	}
	
	@RequestMapping("/empty")
	public String empty(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		return super.empty(request, response, model);
	}
	
}
