package com.mycompany.controller.account;

import org.broadleafcommerce.common.security.util.PasswordChange;
import org.broadleafcommerce.core.web.controller.account.BroadleafChangePasswordController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/account/myaccount/password")
public class ChangePasswordController extends BroadleafChangePasswordController {

    @RequestMapping(method = RequestMethod.GET)
    public String viewChangePassword(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.viewChangePassword(request, response, model);
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processChangePassword(HttpServletRequest request, HttpServletResponse response, Model model, PasswordChange passwordChange) {
        return super.processChangePassword(request, response, model, passwordChange);
    }

}
