
package com.mycompany.api.endpoint.checkout;

import org.broadleafcommerce.core.web.api.wrapper.OrderWrapper;
import org.broadleafcommerce.core.web.api.wrapper.PaymentReferenceMapWrapper;
import org.broadleafcommerce.core.web.api.wrapper.PaymentResponseItemWrapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

/**
 * This is a reference REST API endpoint for checkout. This can be modified, used as is, or removed. 
 * The purpose is to provide an out of the box RESTful checkout service implementation, but also 
 * to allow the implementor to have fine control over the actual API, URIs, and general JAX-RS annotations.
 * 
 * @author Kelly Tisdell
 *
 */
@Component
@Scope("singleton")
@Path("/cart/checkout/")
@Produces(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
@Consumes(value = { MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
public class CheckoutEndpoint extends org.broadleafcommerce.core.web.api.endpoint.checkout.CheckoutEndpoint {

    @Override
    @POST
    @Path("payment/response")
    //This should only be called for modules that need to engage the workflow directly without doing a complete checkout.
    //e.g. PayPal for doing an authorize and retrieving the redirect: url to PayPal
    public PaymentResponseItemWrapper executePayment(@Context HttpServletRequest request, PaymentReferenceMapWrapper mapWrapper) {
        return super.executePayment(request, mapWrapper);
    }

    @Override
    @POST
    public OrderWrapper performCheckout(@Context HttpServletRequest request, List<PaymentReferenceMapWrapper> mapWrappers) {
        return super.performCheckout(request, mapWrappers);
    }

}
