/*
 * Copyright 2008-2009 the original author or authors.
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

import org.broadleafcommerce.openadmin.web.controller.BroadleafUserManagementController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserManagementController extends BroadleafUserManagementController {

    @Override
    @RequestMapping(value="/blcadmin/userAdmin/user", method= RequestMethod.GET)
    public String user(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.user(request, response, model);
    }

    @Override
    @RequestMapping(value="/blcadmin/userAdmin/role", method= RequestMethod.GET)
    public String role(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.role(request, response, model);
    }

    @Override
    @RequestMapping(value="/blcadmin/userAdmin/permission", method= RequestMethod.GET)
    public String permission(HttpServletRequest request, HttpServletResponse response, Model model) {
        return super.permission(request, response, model);
    }

}
