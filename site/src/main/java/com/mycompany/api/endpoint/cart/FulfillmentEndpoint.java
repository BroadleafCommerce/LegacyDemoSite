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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

/**
 * This is a reference REST API endpoint for fulfillment groups. This can be modified, used as is, or removed. 
 * The purpose is to provide an out of the box RESTful fulfillment group service implementation, but also 
 * to allow the implementor to have fine control over the actual API, URIs, and general JAX-RS annotations.
 * 
 * @author Kelly Tisdell
 *
 */
@Component
@Scope("singleton")
@Path("/cart/fulfillment/")
@Produces(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
@Consumes(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
public class FulfillmentEndpoint extends org.broadleafcommerce.core.web.api.endpoint.order.FulfillmentEndpoint {

    @Override
    @GET
    @Path("groups")
    public List<FulfillmentGroupWrapper> findFulfillmentGroupsForOrder(@Context HttpServletRequest request) {
        return super.findFulfillmentGroupsForOrder(request);
    }

    @Override
    @DELETE
    @Path("groups")
    public OrderWrapper removeAllFulfillmentGroupsFromOrder(@Context HttpServletRequest request,
            @QueryParam("priceOrder") @DefaultValue("true") boolean priceOrder) {
        return super.removeAllFulfillmentGroupsFromOrder(request, priceOrder);
    }

    @Override
    @POST
    @Path("group")
    public FulfillmentGroupWrapper addFulfillmentGroupToOrder(@Context HttpServletRequest request,
            FulfillmentGroupWrapper wrapper,
            @QueryParam("priceOrder") @DefaultValue("true") boolean priceOrder) {
        return super.addFulfillmentGroupToOrder(request, wrapper, priceOrder);
    }

    @Override
    @PUT
    @Path("group/{fulfillmentGroupId}")
    public FulfillmentGroupWrapper addItemToFulfillmentGroup(@Context HttpServletRequest request,
            @PathParam("fulfillmentGroupId") Long fulfillmentGroupId,
            FulfillmentGroupItemWrapper wrapper,
            @QueryParam("priceOrder") @DefaultValue("true") boolean priceOrder) {
        return super.addItemToFulfillmentGroup(request, fulfillmentGroupId, wrapper, priceOrder);
    }

	@Override
	@PUT
	@Path("group/{fulfillmentGroupId}/option/{fulfillmentOptionId}")
	public FulfillmentGroupWrapper addFulfillmentOptionToFulfillmentGroup(
			@Context HttpServletRequest request, 
			@PathParam("fulfillmentGroupId") Long fulfillmentGroupId,
			@PathParam("fulfillmentOptionId") Long fulfillmentOptionId, 
			@QueryParam("priceOrder") @DefaultValue("true") boolean priceOrder) {
		return super.addFulfillmentOptionToFulfillmentGroup(request,
				fulfillmentGroupId, fulfillmentOptionId, priceOrder);
	}

	@Override
	@GET
	@Path("options")
	public List<FulfillmentOptionWrapper> findFulfillmentOptions(
			@Context HttpServletRequest request, 
			@QueryParam("fulfillmentType") String fulfillmentType) {
		return super.findFulfillmentOptions(request, fulfillmentType);
	}

    
}
