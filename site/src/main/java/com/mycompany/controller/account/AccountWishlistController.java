package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafAccountWishlistController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/account/myaccont/wishlist")
public class AccountWishlistController extends BroadleafAccountWishlistController {

    @RequestMapping(method = RequestMethod.GET)
    public String viewAccountWishlist(HttpServletRequest request, Model model) {
        return super.ajaxRender(getAccountWishlistView(), request, model);
    }

}
