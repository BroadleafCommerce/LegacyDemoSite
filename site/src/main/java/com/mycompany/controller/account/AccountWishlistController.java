package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafAccountWishlistController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/account/wishlist")
public class AccountWishlistController extends BroadleafAccountWishlistController {

    @RequestMapping(method = RequestMethod.GET)
    public String viewAccountWishlist(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return super.viewWishlist(request, response, model);
    }

}
