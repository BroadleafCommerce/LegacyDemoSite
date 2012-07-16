package com.mycompany.controller.checkout;

import org.apache.commons.validator.GenericValidator;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.payment.domain.PaymentInfo;
import org.broadleafcommerce.core.payment.service.type.PaymentInfoType;
import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderMultishipOptionForm;
import org.broadleafcommerce.core.pricing.service.exception.PricingException;
import org.broadleafcommerce.core.web.checkout.model.ShippingInfoForm;
import org.broadleafcommerce.core.web.controller.checkout.BroadleafCheckoutController;
import org.broadleafcommerce.core.web.order.CartState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
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

    /*
    * The Checkout page for Heat Clinic will have the shipping information pre-populated with an address if the fulfillment group has an address and fulfillment option associated with it.
    * It also assumes that there is only one payment info of type credit card on the order. If so, then the billing address will be pre-populated.
    */
    @RequestMapping("")
	public String checkout(@ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
                           @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            HttpServletRequest request, HttpServletResponse response, Model model) {
        Order cart = CartState.getCart();
        if (cart.getFulfillmentGroups().get(0).getAddress() != null) {
            shippingForm.setAddress(cart.getFulfillmentGroups().get(0).getAddress());
            shippingForm.setFulfillmentOptionId(cart.getFulfillmentGroups().get(0).getFulfillmentOption().getId());
        }

        for (PaymentInfo paymentInfo : cart.getPaymentInfos()) {
            if (PaymentInfoType.CREDIT_CARD == paymentInfo) {
                billingForm.setAddress(paymentInfo.getAddress());
            }
        }

        return super.checkout(request, response, model);
	}

    /*
      * The Heat Clinic requires that Shipping Address Email be filled out and that a State be selected.
      * Note: In BroadleafCommerce, State is optional to handle international addresses.
      * We will add any custom validations after calling super.saveSingleShippingAddress()
      *
      * Notice that we also include billingInfoForm in the request in case of any validation errors since
      * this is a single page checkout.
      * Spring EL will know how to bind the forms on the page accordingly.
       *
      */
    @RequestMapping(value="/singleship", method = RequestMethod.POST)
    public String saveSingleShip(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm, BindingResult result) throws PricingException {
        String path = super.saveSingleShip(request, response, model, shippingForm, result);

        ValidationUtils.rejectIfEmptyOrWhitespace(result, "address.emailAddress", "emailAddress.required");
        if (!GenericValidator.isEmail(shippingForm.getAddress().getEmailAddress())) {
            result.rejectValue("address.emailAddress", "emailAddress.invalid", null, null);
        }

        if (shippingForm.getAddress().getState() == null) {
            result.rejectValue("address.state", "state.required", null, null);
        }

        if (result.hasErrors()) {
            checkout(request, response, model);
            return isAjaxRequest(request) ? "ajax/checkout" : "/checkout";
        }

        return  path;
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
    		@ModelAttribute("addressForm") ShippingInfoForm addressForm) {
    	return super.saveMultishipAddAddress(request, response, model, addressForm);
    }
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
    	super.initBinder(request, binder);
    }
    
}
