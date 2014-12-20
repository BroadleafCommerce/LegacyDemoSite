package com.mycompany.controller.catalog;

import org.broadleafcommerce.core.web.controller.catalog.BroadleafProductOptionController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ProductOptionController extends BroadleafProductOptionController {

    @RequestMapping(value = "/pricing/product", method = RequestMethod.GET)
    public String getPricingForProductOptions(HttpServletRequest request, HttpServletResponse response, Model model,
                                               @RequestParam Map<String, String> pricingData) throws IOException {
        return super.getPricingForProductOptions(request, response, model, pricingData);
    }

    @RequestMapping(value = "/selectable/product", method = RequestMethod.GET)
    public String getSelectableProductOptions(HttpServletRequest request, HttpServletResponse response, Model model,
                                              @RequestParam Map<String, String> productOptionData) throws IOException {
        return super.getSelectableProductOptions(request, response, model, productOptionData);
    }
}
