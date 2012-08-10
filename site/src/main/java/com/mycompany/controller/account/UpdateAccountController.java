package com.mycompany.controller.account;

import org.broadleafcommerce.common.exception.ServiceException;
import org.broadleafcommerce.core.web.controller.account.BroadleafUpdateAccountController;
import org.broadleafcommerce.core.web.controller.account.UpdateAccountForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/account")
public class UpdateAccountController extends BroadleafUpdateAccountController {

    @RequestMapping(method = RequestMethod.GET)
    public String viewUpdateAccount(HttpServletRequest request, Model model, @ModelAttribute("updateAccountForm") UpdateAccountForm form) {
        return super.viewUpdateAccount(request, model, form);
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processUpdateAccount(HttpServletRequest request, Model model, @ModelAttribute("updateAccountForm") UpdateAccountForm form, BindingResult result, RedirectAttributes redirectAttributes) throws ServiceException {
        return super.processUpdateAccount(request, model, form, result, redirectAttributes);
    }


}
