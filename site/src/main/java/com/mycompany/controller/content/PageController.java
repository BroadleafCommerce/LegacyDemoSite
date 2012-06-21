package com.mycompany.controller.content;

import org.broadleafcommerce.cms.web.controller.BroadleafPageController;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class works in combination with the PageHandlerMapping which finds a category based upon
 * the passed in URL.
 */
@Controller("blPageController")
public class PageController extends BroadleafPageController {
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return super.handleRequest(request, response);
	}

}
