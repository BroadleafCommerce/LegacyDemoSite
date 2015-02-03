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

package com.mycompany.api.endpoint.cart;

import org.broadleafcommerce.core.web.api.wrapper.OrderWrapper;
import org.springframework.http.MediaType;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * This is a reference REST API endpoint for cart. This can be modified, used as is, or removed. 
 * The purpose is to provide an out of the box RESTful cart service implementation, but also 
 * to allow the implementor to have fine control over the actual API, URIs, and general JAX-RS annotations.
 * 
 * @author Kelly Tisdell
 *
 */
@RestController
@RequestMapping(value = "/cart",
    produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE},
    consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
public class CartEndpoint extends org.broadleafcommerce.core.web.api.endpoint.order.CartEndpoint {

    @Override
    @RequestMapping(value = "", method = RequestMethod.GET)
    public OrderWrapper findCartForCustomer(HttpServletRequest request) {
        return super.findCartForCustomer(request);
    }

    @Override
    @RequestMapping(value = "", method = RequestMethod.POST)
    public OrderWrapper createNewCartForCustomer(HttpServletRequest request) {
        return super.createNewCartForCustomer(request);
    }

    @Override
    @RequestMapping(value = "{productId}", method = RequestMethod.POST)
    public OrderWrapper addProductToOrder(HttpServletRequest request,
            @RequestParam MultiValueMap<String, String> requestParams,
            @PathVariable("productId") Long productId,
            @RequestParam("categoryId") Long categoryId,
            @RequestParam(value = "quantity", defaultValue = "1") int quantity,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.addProductToOrder(request, requestParams, productId, categoryId, quantity, priceOrder);
    }

    @Override
    @RequestMapping(value = "items/{itemId}", method = RequestMethod.DELETE)
    public OrderWrapper removeItemFromOrder(HttpServletRequest request,
            @PathVariable("itemId") Long itemId,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.removeItemFromOrder(request, itemId, priceOrder);
    }

    @Override
    @RequestMapping(value = "items/{itemId}", method = RequestMethod.PUT)
    public OrderWrapper updateItemQuantity(HttpServletRequest request,
            @PathVariable("itemId") Long itemId,
            @RequestParam("quantity") Integer quantity,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.updateItemQuantity(request, itemId, quantity, priceOrder);
    }

    @Override
    @RequestMapping(value = "items/{itemId}/options", method = RequestMethod.PUT)
    public OrderWrapper updateProductOptions(HttpServletRequest request,
            @RequestParam MultiValueMap<String, String> requestParams,
            @PathVariable("itemId") Long itemId,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.updateProductOptions(request, requestParams, itemId, priceOrder);
    }

    @Override
    @RequestMapping(value = "offer", method = RequestMethod.POST)
    public OrderWrapper addOfferCode(HttpServletRequest request,
            @RequestParam("promoCode") String promoCode,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.addOfferCode(request, promoCode, priceOrder);
    }

    @Override
    @RequestMapping(value = "offer", method = RequestMethod.DELETE)
    public OrderWrapper removeOfferCode(HttpServletRequest request,
            @RequestParam("promoCode") String promoCode,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.removeOfferCode(request, promoCode, priceOrder);
    }

    @Override
    @RequestMapping(value = "offers", method = RequestMethod.DELETE)
    public OrderWrapper removeAllOfferCodes(HttpServletRequest request,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.removeAllOfferCodes(request, priceOrder);
    }
}
