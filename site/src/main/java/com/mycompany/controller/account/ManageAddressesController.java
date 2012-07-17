package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafManageAddressesController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/account/addresses")
public class ManageAddressesController extends BroadleafManageAddressesController {

    @RequestMapping(method = RequestMethod.GET)
    public String viewManageAddresses(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.viewManageAddresses(request, response, model);
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processManageAddresses(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.processManageAddresses(request, response, model);
    }

}
