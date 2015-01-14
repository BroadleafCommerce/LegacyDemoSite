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

package com.mycompany.api.endpoint.checkout;

import org.broadleafcommerce.core.web.api.wrapper.OrderPaymentWrapper;
import org.broadleafcommerce.core.web.api.wrapper.OrderWrapper;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * This is a reference REST API endpoint for checkout. This can be modified, used as is, or removed. 
 * The purpose is to provide an out of the box RESTful checkout service implementation, but also 
 * to allow the implementor to have fine control over the actual API, URIs, and general JAX-RS annotations.
 * 
 * @author Kelly Tisdell
 *
 */
@RestController
@RequestMapping(value = "/cart/checkout/",
    produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE},
    consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
public class CheckoutEndpoint extends org.broadleafcommerce.core.web.api.endpoint.checkout.CheckoutEndpoint {

    @Override
    @RequestMapping(value = "payments", method = RequestMethod.GET)
    public List<OrderPaymentWrapper> findPaymentsForOrder(HttpServletRequest request) {
        return super.findPaymentsForOrder(request);
    }

    @Override
    @RequestMapping(value = "payment", method = RequestMethod.POST)
    public OrderPaymentWrapper addPaymentToOrder(HttpServletRequest request,
                                                 OrderPaymentWrapper wrapper) {
        return super.addPaymentToOrder(request, wrapper);
    }

    @Override
    @RequestMapping(value = "payment", method = RequestMethod.DELETE)
    public OrderWrapper removePaymentFromOrder(HttpServletRequest request,
                                               OrderPaymentWrapper wrapper) {
        return super.removePaymentFromOrder(request, wrapper);
    }

    @Override
    @RequestMapping(method = RequestMethod.POST)
    public OrderWrapper performCheckout(HttpServletRequest request) {
        return super.performCheckout(request);
    }

}
