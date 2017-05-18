package com.mycompany.api.endpoint.promotionmessage;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.broadleafcommerce.rest.api.wrapper.PromotionMessageDTOWrapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Chris Kittrell (ckittrell)
 */
@RestController
@RequestMapping(value = "/promotion-messages/",
                produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
public class PromotionMessageEndpoint extends com.broadleafcommerce.rest.api.endpoint.promotionmessage.PromotionMessageEndpoint {

    @Override
    @RequestMapping(value = "{productId}", method = RequestMethod.GET)
    public Map<String, List<PromotionMessageDTOWrapper>> findPromotionMessagesForProduct(HttpServletRequest request,
                                            @PathVariable("productId") Long productId) {
        return super.findPromotionMessagesForProduct(request, productId);
    }

}
