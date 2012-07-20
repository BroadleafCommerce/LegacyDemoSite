package com.mycompany.controller.account;

import org.broadleafcommerce.core.order.service.exception.AddToCartException;
import org.broadleafcommerce.core.order.service.exception.RemoveFromCartException;
import org.broadleafcommerce.core.order.service.exception.RequiredAttributeNotProvidedException;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.controller.account.BroadleafManageWishlistController;
import org.broadleafcommerce.core.web.order.model.AddToCartItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/account/wishlist")
public class ManageWishlistController extends BroadleafManageWishlistController {

    public static final String WISHLIST_ORDER_NAME = "wishlist";

    @RequestMapping(method = RequestMethod.GET)
    public String viewAccountWishlist(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.viewWishlist(request, response, model, WISHLIST_ORDER_NAME);
    }
    
    @RequestMapping(value = "/add", produces = "application/json")
    public @ResponseBody Map<String, Object> addJson(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("addToCartItem") AddToCartItem addToCartItem) throws IOException, PricingException, AddToCartException {
        Map<String, Object> responseMap = new HashMap<String, Object>();
        try {
            super.add(request, response, model, addToCartItem, WISHLIST_ORDER_NAME);
            
            responseMap.put("productName", catalogService.findProductById(addToCartItem.getProductId()).getName());
            responseMap.put("quantityAdded", addToCartItem.getQuantity());
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

    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String removeItemFromWishlist(HttpServletRequest request, HttpServletResponse response, Model model,
                                         String wishlistName,  @ModelAttribute("orderItemId") Long itemId) throws RemoveFromCartException {
        return super.removeItemFromWishlist(request, response, model, WISHLIST_ORDER_NAME, itemId);
    }

    @RequestMapping(value = "/moveItemToCart", method = RequestMethod.POST)
    public String moveItemToCart(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("itemId") Long itemId) throws IOException, PricingException, AddToCartException {
        try {
            return super.moveItemToCart(request, response, model, WISHLIST_ORDER_NAME, itemId);   
        } catch (RemoveFromCartException e) {
            
        } catch (AddToCartException e) {
            
        }
        
        return getAccountWishlistView();
    }

    @RequestMapping(value = "/moveListToCart", method = RequestMethod.POST)
    public String moveListToCart(HttpServletRequest request, HttpServletResponse response, Model model)
            throws IOException, PricingException, AddToCartException {
        try {
            return super.moveListToCart(request, response, model, WISHLIST_ORDER_NAME);  
        } catch (RemoveFromCartException e) {
            
        } catch (AddToCartException e) {
            
        }
        
        return getAccountWishlistView();
    }

}
