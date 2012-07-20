package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafManageAddressesController;

//@Controller
//@RequestMapping("/account/addresses")
public class ManageAddressesController extends BroadleafManageAddressesController {

	/*
	 * 
	 *  there is already managecustomeraddresscontroller. these two had conflicting bean defintions
	 * 
	 * 
    @RequestMapping(method = RequestMethod.GET)
    public String viewManageAddresses(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.viewManageAddresses(request, response, model);
    }

    @RequestMapping(method = RequestMethod.POST)
    public String processManageAddresses(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.processManageAddresses(request, response, model);
    }
    */

}
