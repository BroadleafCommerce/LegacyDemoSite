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

import org.broadleafcommerce.core.web.api.wrapper.FulfillmentGroupItemWrapper;
import org.broadleafcommerce.core.web.api.wrapper.FulfillmentGroupWrapper;
import org.broadleafcommerce.core.web.api.wrapper.FulfillmentOptionWrapper;
import org.broadleafcommerce.core.web.api.wrapper.OrderWrapper;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * This is a reference REST API endpoint for fulfillment groups. This can be modified, used as is, or removed. 
 * The purpose is to provide an out of the box RESTful fulfillment group service implementation, but also 
 * to allow the implementor to have fine control over the actual API, URIs, and general JAX-RS annotations.
 * 
 * @author Kelly Tisdell
 *
 */
@RestController
@RequestMapping(value = "/cart/fulfillment/",
    produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE},
    consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
public class FulfillmentEndpoint extends org.broadleafcommerce.core.web.api.endpoint.order.FulfillmentEndpoint {

    @Override
    @RequestMapping(value = "groups", method = RequestMethod.GET)
    public List<FulfillmentGroupWrapper> findFulfillmentGroupsForOrder(HttpServletRequest request) {
        return super.findFulfillmentGroupsForOrder(request);
    }

    @Override
    @RequestMapping(value = "groups", method = RequestMethod.DELETE)
    public OrderWrapper removeAllFulfillmentGroupsFromOrder(HttpServletRequest request,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.removeAllFulfillmentGroupsFromOrder(request, priceOrder);
    }

    @Override
    @RequestMapping(value = "group", method = RequestMethod.POST)
    public FulfillmentGroupWrapper addFulfillmentGroupToOrder(HttpServletRequest request,
            FulfillmentGroupWrapper wrapper,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.addFulfillmentGroupToOrder(request, wrapper, priceOrder);
    }

    @Override
    @RequestMapping(value = "group/{fulfillmentGroupId}", method = RequestMethod.PUT)
    public FulfillmentGroupWrapper addItemToFulfillmentGroup(HttpServletRequest request,
            @PathVariable("fulfillmentGroupId") Long fulfillmentGroupId,
            FulfillmentGroupItemWrapper wrapper,
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
        return super.addItemToFulfillmentGroup(request, fulfillmentGroupId, wrapper, priceOrder);
    }

	@Override
	@RequestMapping(value = "group/{fulfillmentGroupId}/option/{fulfillmentOptionId}", method = RequestMethod.PUT)
	public FulfillmentGroupWrapper addFulfillmentOptionToFulfillmentGroup(
			HttpServletRequest request, 
			@PathVariable("fulfillmentGroupId") Long fulfillmentGroupId,
			@PathVariable("fulfillmentOptionId") Long fulfillmentOptionId, 
            @RequestParam(value = "priceOrder", defaultValue = "true") boolean priceOrder) {
		return super.addFulfillmentOptionToFulfillmentGroup(request,
				fulfillmentGroupId, fulfillmentOptionId, priceOrder);
	}

	@Override
    @RequestMapping(value = "options", method = RequestMethod.GET)
	public List<FulfillmentOptionWrapper> findFulfillmentOptions(
			HttpServletRequest request, 
			@RequestParam("fulfillmentType") String fulfillmentType) {
		return super.findFulfillmentOptions(request, fulfillmentType);
	}

    
}
