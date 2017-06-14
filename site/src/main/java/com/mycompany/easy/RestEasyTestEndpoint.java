package com.mycompany.easy;

import org.broadleafcommerce.core.catalog.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("/test")
@Component
public class RestEasyTestEndpoint {

    @Autowired
    protected CatalogService catalogService;
    
    @GET
    @Path("")
    public Response printTest() {
        String result = "Rest Easy Example\n";
        if (catalogService != null) {
            result += "Catalog Service is not null\n";
            result += "We have " + catalogService.findAllSkus().size() + " Skus";
        }
        return Response.status(200).entity(result).build();
    }
}
