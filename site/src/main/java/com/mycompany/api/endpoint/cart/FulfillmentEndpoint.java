
package com.mycompany.api.endpoint.cart;

import org.broadleafcommerce.core.web.api.wrapper.FulfillmentGroupItemWrapper;
import org.broadleafcommerce.core.web.api.wrapper.FulfillmentGroupWrapper;
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

}
