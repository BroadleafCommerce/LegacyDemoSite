package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafUpdateAccountController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: jfridye
 * Date: 7/10/12
 * Time: 1:11 PM
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class UpdateAccountController extends BroadleafUpdateAccountController {

    @RequestMapping(value = "/account/myaccount/info", method = RequestMethod.GET)
    public String viewUpdateAccount(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.viewUpdateAccount(request, response, model);
    }


}
