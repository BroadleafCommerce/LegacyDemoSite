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
package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.broadleafcommerce.admin.web.controller.BroadleafAdminModulesController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author jfridye
 * Date: 9/12/12
 * Time: 11:34 AM
 */
@Controller
public class AdminModulesController extends BroadleafAdminModulesController {

    @Override
    @RequestMapping(value = "/modules", method = RequestMethod.GET)
    public String viewModules(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.viewModules(request, response, model);
    }
}
