package com.mycompany.controller.checkout;

import org.broadleafcommerce.core.checkout.service.exception.CheckoutException;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.payment.domain.PaymentInfo;
import org.broadleafcommerce.core.payment.service.type.PaymentInfoType;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderMultishipOptionForm;
import org.broadleafcommerce.core.web.checkout.model.ShippingInfoForm;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.broadleafcommerce.core.web.order.CartState;
import org.joda.time.DateTime;
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

import java.text.DateFormatSymbols;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
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
	public String checkout(@ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
                           @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            HttpServletRequest request, HttpServletResponse response, Model model) {
        Order cart = CartState.getCart();
        if (cart.getFulfillmentGroups() != null && cart.getFulfillmentGroups().size() > 0 && cart.getFulfillmentGroups().get(0).getAddress() != null) {
            shippingForm.setAddress(cart.getFulfillmentGroups().get(0).getAddress());
            shippingForm.setFulfillmentOptionId(cart.getFulfillmentGroups().get(0).getFulfillmentOption().getId());
        }

        if (cart.getPaymentInfos() != null) {
	        for (PaymentInfo paymentInfo : cart.getPaymentInfos()) {
	            if (PaymentInfoType.CREDIT_CARD == paymentInfo) {
	                billingForm.setAddress(paymentInfo.getAddress());
	            }
	        }
        }

        return super.checkout(request, response, model);
	}

    @RequestMapping(value="/singleship", method = RequestMethod.POST)
    public String saveSingleShip(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm, BindingResult result) throws PricingException {
        checkout(shippingForm, billingForm, request, response, model);
        return super.saveSingleShip(request, response, model, shippingForm, result);
    }

    @RequestMapping(value = "/multiship", method = RequestMethod.GET)
    public String showMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm, BindingResult result) throws PricingException {
    	return super.showMultiship(request, response, model);
    }
    
    @RequestMapping(value = "/multiship", method = RequestMethod.POST)
    public String saveMultiship(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("orderMultishipOptionForm") OrderMultishipOptionForm orderMultishipOptionForm, BindingResult result) throws PricingException {
    	return super.saveMultiship(request, response, model, orderMultishipOptionForm, result);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.GET)
    public String showMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) {
    	return super.showMultishipAddAddress(request, response, model);
    }
    
    @RequestMapping(value = "/add-address", method = RequestMethod.POST)
    public String saveMultishipAddAddress(HttpServletRequest request, HttpServletResponse response, Model model,
    		@ModelAttribute("addressForm") ShippingInfoForm addressForm, BindingResult result) {
    	return super.saveMultishipAddAddress(request, response, model, addressForm, result);
    }

    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public String completeSecureCreditCardCheckout(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            BindingResult result) throws CheckoutException, PricingException {
        checkout(shippingForm, billingForm, request, response, model);

        return super.completeSecureCreditCardCheckout(request, response, model, billingForm, result);
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
    	super.initBinder(request, binder);
    }
    
}
