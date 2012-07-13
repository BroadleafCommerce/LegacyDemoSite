package com.mycompany.controller.checkout;

import org.broadleafcommerce.core.web.checkout.model.OrderMultishipOptionForm;
import org.broadleafcommerce.core.web.checkout.model.ShippingAddressForm;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    	return super.showMultiship(request, response, model);
    }
    
    @RequestMapping(value = "/multiship", method = RequestMethod.POST)
    public String saveMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm) {
    	return super.saveMultiship(request, response, model, orderMultishipOptionForm);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.GET)
    public String showMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model) {
    	return super.showMultishipAddAddress(request, response, model);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.POST)
    public String saveMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addressForm") ShippingAddressForm addressForm) {
    	return super.saveMultishipAddAddress(request, response, model, addressForm);
    }
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
    	super.initBinder(request, binder);
    }
    
}
