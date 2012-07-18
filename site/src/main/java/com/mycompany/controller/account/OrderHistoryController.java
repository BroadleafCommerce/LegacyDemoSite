package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/account/orders")
public class OrderHistoryController extends BroadleafOrderHistoryController {

	@RequestMapping(method = RequestMethod.GET)
    public String viewOrderHistory(HttpServletRequest request, Model model) {
		return super.viewOrderHistory(request, model);
    }

	@RequestMapping(value = "/{orderNumber}", method = RequestMethod.GET)
    public String viewOrderDetails(HttpServletRequest request, Model model, @PathVariable("orderNumber") String orderNumber) {
		return super.viewOrderDetails(request, model, orderNumber);
    }
    
}
