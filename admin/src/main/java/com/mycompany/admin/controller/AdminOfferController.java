/*
 * Copyright 2008-2012 the original author or authors.
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

import org.broadleafcommerce.openadmin.web.controller.entity.BroadleafAdminOfferController;
import org.broadleafcommerce.openadmin.web.form.entity.EntityForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Elbert Bautista (elbertbautista)
 */
@Controller
@RequestMapping("offer")
public class AdminOfferController extends BroadleafAdminOfferController {

    @Override
    @RequestMapping(method = RequestMethod.GET)
    public String viewEntityList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        return super.viewEntityList(request, response, model);
    }

    @Override
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String viewEntityForm(HttpServletRequest request, HttpServletResponse response, Model model,
                                 @PathVariable String id) throws Exception {
        return super.viewEntityForm(request, response, model, id);
    }

    @Override
    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public String saveEntity(HttpServletRequest request, HttpServletResponse response, Model model,
                             @PathVariable String id,
                             @ModelAttribute EntityForm entityForm, BindingResult result,
                             RedirectAttributes ra) throws Exception {
        return super.saveEntity(request, response, model, id, entityForm, result, ra);
    }

    @Override
    @RequestMapping(value = "/{id}/{collectionField}/add", method = RequestMethod.GET)
    public String showAddCollectionItem(HttpServletRequest request, HttpServletResponse response, Model model,
                                        @PathVariable String id,
                                        @PathVariable String collectionField) throws Exception {
        return super.showAddCollectionItem(request, response, model, id, collectionField);
    }

    @Override
    @RequestMapping(value = "/{id}/{collectionField}/add", method = RequestMethod.POST)
    public String addCollectionItem(HttpServletRequest request, HttpServletResponse response, Model model,
                                    @PathVariable String id,
                                    @PathVariable String collectionField,
                                    @ModelAttribute EntityForm entityForm) throws Exception {
        return super.addCollectionItem(request, response, model, id, collectionField, entityForm);
    }

    @Override
    @RequestMapping(value = "/{id}/{collectionField}/{collectionItemId}/delete", method = RequestMethod.POST)
    public String removeCollectionItem(HttpServletRequest request, HttpServletResponse response, Model model,
                                       @PathVariable String id,
                                       @PathVariable String collectionField,
                                       @PathVariable String collectionItemId) throws Exception {
        return super.removeCollectionItem(request, response, model, id, collectionField, collectionItemId);
    }

    @Override
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        super.initBinder(binder);
    }

}

