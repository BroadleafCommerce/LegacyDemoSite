/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.mycompany.admin.controller;

import org.springframework.stereotype.Controller;
import org.broadleafcommerce.openadmin.web.controller.BroadleafAdminModulesController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jfridye
 * @see org.broadleafcommerce.openadmin.web.handler.AdminNavigationHandlerMapping
 * Date: 9/12/12
 * Time: 11:34 AM
 */
@Controller("blAdminModulesController")
public class AdminModulesController extends BroadleafAdminModulesController {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return super.handleRequest(request, response);
    }

}
