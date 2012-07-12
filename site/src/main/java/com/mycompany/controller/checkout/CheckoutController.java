package com.mycompany.controller.checkout;

import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/checkout")
public class CheckoutController extends BroadleafCheckoutController {

    @RequestMapping("")
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model) {
		return super.checkout(request, response, model);
	}
    
    @RequestMapping(value = "/multiship", method = RequestMethod.GET)
    public String showMultiship(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return super.showMutliship(request, response, model);
    }

}
