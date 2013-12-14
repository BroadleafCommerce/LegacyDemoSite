/*
  * Copyright 2008-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.checkout;

import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.common.payment.PaymentType;
import org.broadleafcommerce.core.order.domain.FulfillmentGroup;
import org.broadleafcommerce.core.order.domain.FulfillmentOption;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.payment.domain.OrderPayment;
import org.broadleafcommerce.core.web.checkout.model.BillingInfoForm;
import org.broadleafcommerce.core.web.checkout.model.OrderInfoForm;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class CheckoutController extends BroadleafCheckoutController {

    /*
    * The Checkout page for Heat Clinic will have the shipping information pre-populated 
    * with an address if the fulfillment group has an address and fulfillment option 
    * associated with it. It also assumes that there is only one payment info of type 
    * credit card on the order. If so, then the billing address will be pre-populated.
    */
    @RequestMapping("/checkout")
    public String checkout(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm, RedirectAttributes redirectAttributes) {
        prepopulateCheckoutForms(CartState.getCart(), orderInfoForm, shippingForm, billingForm);
        return super.checkout(request, response, model, redirectAttributes);
    }

    @RequestMapping(value = "/checkout/savedetails", method = RequestMethod.POST)
    public String saveGlobalOrderDetails(HttpServletRequest request, Model model, 
            @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm, BindingResult result) throws ServiceException {
        return super.saveGlobalOrderDetails(request, model, orderInfoForm, result);
    }

    protected void prepopulateOrderInfoForm(Order cart, OrderInfoForm orderInfoForm) {
        if (orderInfoForm != null) {
            orderInfoForm.setEmailAddress(cart.getEmailAddress());
        }
    }
    protected void prepopulateCheckoutForms(Order cart, OrderInfoForm orderInfoForm, ShippingInfoForm shippingForm, BillingInfoForm billingForm) {
        prepopulateOrderInfoForm(cart, orderInfoForm);
        FulfillmentGroup firstShippableFulfillmentGroup = fulfillmentGroupService.getFirstShippableFulfillmentGroup(cart);
        if (firstShippableFulfillmentGroup != null) {
            FulfillmentOption fulfillmentOption = firstShippableFulfillmentGroup.getFulfillmentOption();
            if (fulfillmentOption != null) {
                //if the cart has already has fulfillment information
                shippingForm.setAddress(firstShippableFulfillmentGroup.getAddress());
                shippingForm.setFulfillmentOption(fulfillmentOption);
                shippingForm.setFulfillmentOptionId(fulfillmentOption.getId());
            } else {
                //check for a default address for the customer
                CustomerAddress defaultAddress = customerAddressService.findDefaultCustomerAddress(CustomerState.getCustomer().getId());
                if (defaultAddress != null) {
                    shippingForm.setAddress(defaultAddress.getAddress());
                    shippingForm.setAddressName(defaultAddress.getAddressName());
                }
            }
        }

        if (cart.getPayments() != null) {
            for (OrderPayment payment : cart.getPayments()) {
                if (PaymentType.CREDIT_CARD.equals(payment.getType())) {
                    billingForm.setAddress(payment.getBillingAddress());
                }
            }
        }
    }

/*    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public String completeCheckout(HttpServletRequest request, HttpServletResponse response, Model model,
            @ModelAttribute("orderInfoForm") OrderInfoForm orderInfoForm,
            @ModelAttribute("shippingInfoForm") ShippingInfoForm shippingForm,
            @ModelAttribute("billingInfoForm") BillingInfoForm billingForm,
            BindingResult result) throws CheckoutException, PricingException, ServiceException {
        prepopulateCheckoutForms(CartState.getCart(), null, shippingForm, billingForm);
        return super.completeCheckout(request, response, model, billingForm, result);
    }*/



    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        super.initBinder(request, binder);
    }
    
}
