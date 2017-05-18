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

package com.mycompany.api.endpoint.customer;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.broadleafcommerce.rest.api.wrapper.CustomerAddressWrapper;
import com.broadleafcommerce.rest.api.wrapper.CustomerAttributeWrapper;
import com.broadleafcommerce.rest.api.wrapper.CustomerPaymentWrapper;
import com.broadleafcommerce.rest.api.wrapper.CustomerWrapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 *
 */
@RestController
@RequestMapping(value = "/customer",
    produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
public class CustomerEndpoint extends com.broadleafcommerce.rest.api.endpoint.customer.CustomerEndpoint  {

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public CustomerWrapper findCustomerByEmail(HttpServletRequest request,
                                               @RequestParam(value = "email", required = true) String emailAddress) {
        return super.findCustomerByEmail(request, emailAddress);
    }

    @Override
    @RequestMapping(method = RequestMethod.POST,
        consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
    public CustomerWrapper addCustomer(HttpServletRequest request, @RequestBody CustomerWrapper customerWrapper) {
        return super.addCustomer(request, customerWrapper);
    }

    /**
     * This method is weird because we take in a customer object that has an id, but we don't
     * actually look the customer object up by that id to update it. We require a customer id
     */
    @Override
    @RequestMapping(method = RequestMethod.PUT,
        consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
    public CustomerWrapper updateCustomer(HttpServletRequest request, @RequestBody CustomerWrapper customerWrapper) {
        return super.updateCustomer(request, customerWrapper);
    }

    @Override
    @RequestMapping(value = "/attributes", method = RequestMethod.DELETE)
    public CustomerWrapper removeAllAttributes(HttpServletRequest request) {
        return super.removeAllAttributes(request);
    }

    @Override
    @RequestMapping(value = "/attribute", method = RequestMethod.PUT,
        consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
    public CustomerWrapper addAttribute(HttpServletRequest request, @RequestBody CustomerAttributeWrapper wrapper) {
        return super.addAttribute(request, wrapper);
    }

    @Override
    @RequestMapping(value = "/attribute/{attributeName}", method = RequestMethod.DELETE)
    public CustomerWrapper removeAttribute(HttpServletRequest request, @PathVariable("attributeName") String attributeName) {
        return super.removeAttribute(request, attributeName);
    }

    @Override
    @RequestMapping(value = "/addresses", method = RequestMethod.GET)
    public List<CustomerAddressWrapper> findAllAddresses(HttpServletRequest request) {
        return super.findAllAddresses(request);
    }

    @Override
    @RequestMapping(value = "/address", method = RequestMethod.GET)
    public CustomerAddressWrapper findAddress(HttpServletRequest request, @RequestParam("addressName") String addressName) {
        return super.findAddress(request, addressName);
    }


    @Override
    @RequestMapping(value = "/address", method = RequestMethod.PUT)
    public CustomerAddressWrapper addAddress(HttpServletRequest request, @RequestBody CustomerAddressWrapper wrapper) {
        return super.addAddress(request, wrapper);
    }

    @Override
    @RequestMapping(value = "/address/{addressId}", method = RequestMethod.PUT)
    public CustomerAddressWrapper updateAddress(HttpServletRequest request, @PathVariable("addressId") Long customerAddressId,
                                                @RequestBody CustomerAddressWrapper wrapper) {
        return super.updateAddress(request, customerAddressId, wrapper);
    }

    @Override
    @RequestMapping(value = "/addresses", method = RequestMethod.DELETE)
    public CustomerWrapper removeAllAddresses(HttpServletRequest request) {
        return super.removeAllAddresses(request);
    }

    @Override
    @RequestMapping(value = "/address/{addressName}", method = RequestMethod.DELETE)
    public List<CustomerAddressWrapper> removeAddress(HttpServletRequest request, @PathVariable("addressName") String addressName) {
        return super.removeAddress(request, addressName);
    }

    @Override
    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public CustomerPaymentWrapper addCustomerPayment(HttpServletRequest request,
                                                     @RequestBody CustomerPaymentWrapper wrapper) {
        return super.addCustomerPayment(request, wrapper);
    }

    @Override
    @RequestMapping(value = "/payments", method = RequestMethod.DELETE)
    public CustomerWrapper removeAllCustomerPayments(HttpServletRequest request) {
        return super.removeAllCustomerPayments(request);
    }

    @Override
    @RequestMapping(value = "/payment/{paymentId}", method = RequestMethod.DELETE)
    public List<CustomerPaymentWrapper> removeCustomerPayment(HttpServletRequest request, @PathVariable("paymentId") Long paymentId) {
        return super.removeCustomerPayment(request, paymentId);
    }

    @Override
    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public CustomerPaymentWrapper findCustomerPayment(HttpServletRequest request, @RequestParam("paymentId") Long paymentId) {
        return super.findCustomerPayment(request, paymentId);
    }

    @Override
    @RequestMapping(value = "/payments", method = RequestMethod.GET)
    public List<CustomerPaymentWrapper> findAllCustomerPayments(HttpServletRequest request) {
        return super.findAllCustomerPayments(request);
    }
}
