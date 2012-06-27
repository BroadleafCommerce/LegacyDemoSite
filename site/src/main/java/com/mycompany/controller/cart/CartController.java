package com.mycompany.controller.cart;


import org.broadleafcommerce.core.catalog.domain.Product;
import org.broadleafcommerce.core.offer.service.exception.OfferMaxUseExceededException;
import org.broadleafcommerce.core.order.service.exception.ItemNotFoundException;
import org.broadleafcommerce.core.order.service.exception.RequiredAttributeNotProvidedException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.controller.cart.BroadleafCartController;
import org.broadleafcommerce.core.web.order.CartState;
import org.broadleafcommerce.core.web.order.model.AddToCartItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/cart")
public class CartController extends BroadleafCartController {
	
	@RequestMapping("")
	public String cart(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		return super.cart(request, response, model);
	}
	
	/*
	 * The Heat Clnic does not show the cart when a product is added. Instead, when the product is added via an AJAX
	 * POST that requests JSON, we only need to return a few attributes to update the state of the page. The most
	 * efficient way to do this is to call the regular add controller method, but instead return a map that contains
	 * the necessary attributes. By using the @ResposeBody tag, Spring will automatically use Jackson to convert the
	 * returned object into JSON for easy processing via JavaScript.
	 */
	@RequestMapping(value = "/add", produces = "application/json")
	public @ResponseBody Map<String, Object> addJson(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		try {
			super.add(request, response, model, addToCartItem);
			
			responseMap.put("productName", catalogService.findProductById(addToCartItem.getProductId()).getName());
			responseMap.put("quantityAdded", addToCartItem.getQuantity());
			responseMap.put("cartItemCount", String.valueOf(CartState.getCart(request).getItemCount()));
			if (addToCartItem.getItemAttributes() == null || addToCartItem.getItemAttributes().size() == 0) {
				// We don't want to return a productId to hide actions for when it is a product that has multiple
				// product options. The user may want the product in another version of the options as well.
				responseMap.put("productId", addToCartItem.getProductId());
			}
		} catch (RequiredAttributeNotProvidedException e) {
			responseMap.put("error", "allOptionsRequired");
		}
		
		return responseMap;
	}
	
	/*
	 * The Heat Clinic does not support adding products with required product options from a category browse page
	 * when JavaScript is disabled. When this occurs, we will redirect the user to the full product details page 
	 * for the given product so that the required options may be chosen.
	 */
	@RequestMapping(value = "/add", produces = "text/html")
	public String add(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException {
		try {
			return super.add(request, response, model, addToCartItem);
		} catch (RequiredAttributeNotProvidedException e) {
			Product product = catalogService.findProductById(addToCartItem.getProductId());
			return "redirect:" + product.getUrl();
		}
	}
	
	@RequestMapping("/updateQuantity")
	public String updateQuantity(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, ItemNotFoundException {
		return super.updateQuantity(request, response, model, addToCartItem);
	}
	
	@RequestMapping("/remove")
	public String remove(HttpServletRequest request, HttpServletResponse response, Model model,
			@ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, ItemNotFoundException {
		return super.remove(request, response, model, addToCartItem);
	}
	
	@RequestMapping("/empty")
	public String empty(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
		return super.empty(request, response, model);
		
	}
	
	@RequestMapping("/promo")
	public String addPromo(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam("promoCode") String customerOffer) throws IOException, PricingException {
		return super.addPromo(request, response, model, customerOffer);
	}
	
	@RequestMapping("/promo/remove")
	public String removePromo(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam("offerCodeId") Long offerCodeId) throws IOException, PricingException {
		return super.removePromo(request, response, model, offerCodeId);
	}
	
}
