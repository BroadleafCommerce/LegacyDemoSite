package com.mycompany.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.core.web.controller.account.BroadleafManageCustomerAddressesController;
import org.broadleafcommerce.core.web.controller.account.CustomerAddressForm;
import org.broadleafcommerce.profile.core.domain.Country;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.core.domain.State;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/account/addresses")
public class ManageCustomerAddressesController extends BroadleafManageCustomerAddressesController {

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
    	super.initBinder(request, binder);
    }
	
    @ModelAttribute("states")
    protected List<State> populateStates() {
    	return super.populateStates();
    }
    
    @ModelAttribute("countries")
    protected List<Country> populateCountries() {
    	return super.populateCountries();
    }
    
    @ModelAttribute("customerAddresses")
    protected List<CustomerAddress> populateCustomerAddresses() {
    	return super.populateCustomerAddresses();
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String viewCustomerAddresses(HttpServletRequest request, Model model) {
        return super.viewCustomerAddresses(request, model);
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public String addCustomerAddress(HttpServletRequest request, Model model, @ModelAttribute("customerAddressForm") CustomerAddressForm form, BindingResult result) {
        return super.addCustomerAddress(request, model, form, result);
    }
    
    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.GET)
    public String viewCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId) {
    	return super.viewCustomerAddress(request, model, customerAddressId);
    }

    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST)
    public String updateCustomerAddress(HttpServletRequest request, Model model, @PathVariable("customerAddressId") Long customerAddressId, @ModelAttribute("customerAddressForm") CustomerAddressForm form, BindingResult result) {
    	return super.updateCustomerAddress(request, model, customerAddressId, form, result);
    }

    @RequestMapping(value = "/{customerAddressId}", method = RequestMethod.POST, params="removeAddress=Remove")
    public String removeCustomerAddress(HttpServletRequest request, @PathVariable("customerAddressId") Long customerAddressId) {
    	return super.removeCustomerAddress(request, customerAddressId);
    }
    
    
}
