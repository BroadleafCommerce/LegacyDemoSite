/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mycompany.controller.account;

import org.broadleafcommerce.core.web.controller.account.BroadleafAccountController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * The controller responsible for all actions involving logging a customer in
 */
@Controller
public class AccountController extends BroadleafAccountController {
	
	@RequestMapping("/account/myaccount")
	public String myaccount(HttpServletRequest request, HttpServletResponse response, Model model) {
		return super.myaccount(request, response, model);
	}		
}
