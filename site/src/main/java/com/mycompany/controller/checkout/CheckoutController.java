package com.mycompany.controller.checkout;

import org.apache.commons.collections.CollectionUtils;
import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.checkout.service.exception.CheckoutException;
import org.broadleafcommerce.core.order.domain.FulfillmentGroup;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.payment.domain.PaymentInfo;
import org.broadleafcommerce.core.payment.service.type.PaymentInfoType;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderMultishipOptionForm;
import org.broadleafcommerce.core.web.checkout.model.ShippingInfoForm;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.broadleafcommerce.core.web.order.CartState;
import org.broadleafcommerce.profile.core.domain.CustomerAddress;
import org.broadleafcommerce.profile.web.core.CustomerState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

@Controller
@RequestMapping("/checkout")
public class CheckoutController extends BroadleafCheckoutController {

    /*
    * The Checkout page for Heat Clinic will have the shipping information pre-populated 
    * with an address if the fulfillment group has an address and fulfillment option 
    * associated with it. It also assumes that there is only one payment info of type 
    * credit card on the order. If so, then the billing address will be pre-populated.
    */
    @RequestMapping("")
	public String checkout(HttpServletRequest request, HttpServletResponse response, Model model,
	    	@ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
	        @ModelAttribute("billingInfoForm") BillingInfoForm billingForm) {
        prepopulateShippingAndBillingForms(CartState.getCart(), shippingForm, billingForm);
        return super.checkout(request, response, model);
	}
    
    @RequestMapping(value="/singleship", method = RequestMethod.GET)
    public String convertToSingleship(HttpServletRequest request, HttpServletResponse response, Model model) throws PricingException {
        return super.convertToSingleship(request, response, model);
    }

    @RequestMapping(value="/singleship", method = RequestMethod.POST)
    public String saveSingleShip(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm, 
            BindingResult result) throws PricingException, ServiceException {
        return super.saveSingleShip(request, response, model, shippingForm, result);
    }

    @RequestMapping(value = "/multiship", method = RequestMethod.GET)
    public String showMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm, 
    		BindingResult result) throws PricingException {
    	return super.showMultiship(request, response, model);
    }
    
    @RequestMapping(value = "/multiship", method = RequestMethod.POST)
    public String saveMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm, 
    		BindingResult result) throws PricingException, ServiceException {
    	return super.saveMultiship(request, response, model, orderMultishipOptionForm, result);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.GET)
    public String showMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) {
    	return super.showMultishipAddAddress(request, response, model);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.POST)
    public String saveMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) throws ServiceException {
    	return super.saveMultishipAddAddress(request, response, model, addressForm, result);
    }

    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public String completeSecureCreditCardCheckout(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            BindingResult result) throws CheckoutException, PricingException, ServiceException {
        prepopulateShippingAndBillingForms(CartState.getCart(), shippingForm, billingForm);
        return super.completeSecureCreditCardCheckout(request, response, model, billingForm, result);
    }

    protected void prepopulateShippingAndBillingForms(Order cart, ShippingInfoForm shippingForm, BillingInfoForm billingForm) {
        
    	List<FulfillmentGroup> groups = cart.getFulfillmentGroups();
    	
    	if (CollectionUtils.isNotEmpty(groups) && groups.get(0).getFulfillmentOption() != null) {
    		//if the cart has already has fulfillment information
            shippingForm.setAddress(groups.get(0).getAddress());
            shippingForm.setFulfillmentOptionId(groups.get(0).getFulfillmentOption().getId());
        } else {
        	//check for a default address for the customer
        	CustomerAddress defaultAddress = customerAddressService.findDefaultCustomerAddress(CustomerState.getCustomer().getId());
        	if (defaultAddress != null) {
        		shippingForm.setAddress(defaultAddress.getAddress());
        		shippingForm.setAddressName(defaultAddress.getAddressName());
        	}
        }

    	if (cart.getPaymentInfos() != null) {
            for (PaymentInfo paymentInfo : cart.getPaymentInfos()) {
                if (PaymentInfoType.CREDIT_CARD.equals(paymentInfo.getType())) {
                    billingForm.setAddress(paymentInfo.getAddress());
                }
            }
        }
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
    	super.initBinder(request, binder);
    }
    
}
