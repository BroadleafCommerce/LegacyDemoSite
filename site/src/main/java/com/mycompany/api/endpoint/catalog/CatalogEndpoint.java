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

package com.mycompany.api.endpoint.catalog;

import org.broadleafcommerce.core.web.api.wrapper.CategoriesWrapper;
import org.broadleafcommerce.core.web.api.wrapper.CategoryAttributeWrapper;
import org.broadleafcommerce.core.web.api.wrapper.CategoryWrapper;
import org.broadleafcommerce.core.web.api.wrapper.InventoryWrapper;
import org.broadleafcommerce.core.web.api.wrapper.MediaWrapper;
import org.broadleafcommerce.core.web.api.wrapper.ProductAttributeWrapper;
import org.broadleafcommerce.core.web.api.wrapper.ProductWrapper;
import org.broadleafcommerce.core.web.api.wrapper.RelatedProductWrapper;
import org.broadleafcommerce.core.web.api.wrapper.SearchResultsWrapper;
import org.broadleafcommerce.core.web.api.wrapper.SkuAttributeWrapper;
import org.broadleafcommerce.core.web.api.wrapper.SkuWrapper;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * This is a reference REST API endpoint for catalog. This can be modified, used as is, or removed. 
 * The purpose is to provide an out of the box RESTful catalog service implementation, but also 
 * to allow the implementor to have fine control over the actual API, URIs, and general JAX-RS annotations.
 * 
 * @author Kelly Tisdell
 *
 */
@RestController
@RequestMapping(value = "/catalog/",
    produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE},
    consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
public class CatalogEndpoint extends
        org.broadleafcommerce.core.web.api.endpoint.catalog.CatalogEndpoint {

    @Override
    @RequestMapping(value = "product/{id}", method = RequestMethod.GET)
    public ProductWrapper findProductById(HttpServletRequest request, @PathVariable("id") Long id) {
        return super.findProductById(request, id);
    }

    @Override
    @RequestMapping(value = "search", method = RequestMethod.GET)
    public SearchResultsWrapper findSearchResultsByQuery(HttpServletRequest request,
            @RequestParam("q") String q,
            @RequestParam(value = "pageSize", defaultValue = "15") Integer pageSize,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        return super.findSearchResultsByQuery(request, q, pageSize, page);
    }

    @Override
    @RequestMapping(value = "search/category/{categoryId}", method = RequestMethod.GET)
    public SearchResultsWrapper findSearchResultsByCategoryAndQuery(HttpServletRequest request,
            @PathVariable("categoryId") Long categoryId,
            @RequestParam("q") String q,
            @RequestParam(value = "pageSize", defaultValue = "15") Integer pageSize,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        return super.findSearchResultsByCategoryAndQuery(request, categoryId, q, pageSize, page);
    }

    @Override
    @RequestMapping(value = "product/{id}/skus", method = RequestMethod.GET)
    public List<SkuWrapper> findSkusByProductById(HttpServletRequest request, @PathVariable("id") Long id) {
        return super.findSkusByProductById(request, id);
    }
    
    @Override
    @RequestMapping(value = "product/{id}/defaultSku", method = RequestMethod.GET)
    public SkuWrapper findDefaultSkuByProductId(HttpServletRequest request, @PathVariable("id") Long id) {
        return super.findDefaultSkuByProductId(request, id);
    }

    @Override
    @RequestMapping(value = "categories", method = RequestMethod.GET)
    public CategoriesWrapper findAllCategories(HttpServletRequest request,
            @RequestParam("name") String name,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            @RequestParam(value = "offset", defaultValue = "0") int offset) {
        return super.findAllCategories(request, name, limit, offset);
    }

    @Override
    @RequestMapping(value = "category/{id}/categories", method = RequestMethod.GET)
    public CategoriesWrapper findSubCategories(HttpServletRequest request,
            @PathVariable("id") Long id,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            @RequestParam(value = "offset", defaultValue = "0") int offset,
            @RequestParam(value = "active", defaultValue = "true") boolean active) {
        return super.findSubCategories(request, id, limit, offset, active);
    }

    @Override
    @RequestMapping(value = "category/{id}/activeSubcategories", method = RequestMethod.GET)
    public CategoriesWrapper findActiveSubCategories(HttpServletRequest request,
            @PathVariable("id") Long id,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            @RequestParam(value = "offset", defaultValue = "0") int offset) {
        return super.findActiveSubCategories(request, id, limit, offset);
    }

    @Override
    @RequestMapping(value = "category/{id}", method = RequestMethod.GET)
    public CategoryWrapper findCategoryById(HttpServletRequest request,
            @PathVariable("id") Long id,
            @RequestParam(value = "productLimit", defaultValue = "20") int productLimit,
            @RequestParam(value = "productOffset", defaultValue = "0") int productOffset,
            @RequestParam(value = "subcategoryLimit", defaultValue = "20") int subcategoryLimit,
            @RequestParam(value = "subcategoryOffset", defaultValue = "0") int subcategoryOffset) {
        return super.findCategoryById(request, id, productLimit, productOffset,
                subcategoryLimit, subcategoryOffset);
    }

    @Override
    @RequestMapping(value = "category", method = RequestMethod.GET)
    public CategoryWrapper findCategoryByIdOrName(HttpServletRequest request,
            @RequestParam("searchParameter") String searchParameter,
            @RequestParam(value = "productLimit", defaultValue = "20") int productLimit,
            @RequestParam(value = "productOffset", defaultValue = "0") int productOffset,
            @RequestParam(value = "subcategoryLimit", defaultValue = "20") int subcategoryLimit,
            @RequestParam(value = "subcategoryOffset", defaultValue = "0") int subcategoryOffset) {
        return super.findCategoryByIdOrName(request, searchParameter,
                productLimit, productOffset, subcategoryLimit, subcategoryOffset);
    }

    @Override
    @RequestMapping(value = "category/{id}/category-attributes", method = RequestMethod.GET)
    public List<CategoryAttributeWrapper> findCategoryAttributesForCategory(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findCategoryAttributesForCategory(request, id);
    }

    @Override
    @RequestMapping(value = "product/{id}/related-products/upsale", method = RequestMethod.GET)
    public List<RelatedProductWrapper> findUpSaleProductsByProduct(HttpServletRequest request,
            @PathVariable("id") Long id,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            @RequestParam(value = "offset", defaultValue = "0") int offset) {
        return super.findUpSaleProductsByProduct(request, id, limit, offset);
    }

    @Override
    @RequestMapping(value = "product/{id}/related-products/crosssale", method = RequestMethod.GET)
    public List<RelatedProductWrapper> findCrossSaleProductsByProduct(HttpServletRequest request,
            @PathVariable("id") Long id,
            @RequestParam(value = "limit", defaultValue = "20") int limit,
            @RequestParam(value = "offset", defaultValue = "0") int offset) {
        return super.findCrossSaleProductsByProduct(request, id, limit, offset);
    }

    @Override
    @RequestMapping(value = "product/{id}/product-attributes", method = RequestMethod.GET)
    public List<ProductAttributeWrapper> findProductAttributesForProduct(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findProductAttributesForProduct(request, id);
    }

    @Override
    @RequestMapping(value = "sku/{id}/sku-attributes", method = RequestMethod.GET)
    public List<SkuAttributeWrapper> findSkuAttributesForSku(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findSkuAttributesForSku(request, id);
    }

    @Override
    @RequestMapping(value = "sku/{id}/media", method = RequestMethod.GET)
    public List<MediaWrapper> findMediaForSku(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findMediaForSku(request, id);
    }

    @Override
    @RequestMapping(value = "sku/{id}", method = RequestMethod.GET)
    public SkuWrapper findSkuById(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findSkuById(request, id);
    }
    
    @Override
    @RequestMapping(value = "sku/inventory", method = RequestMethod.GET)
    public List<InventoryWrapper> findInventoryForSkus(HttpServletRequest request,
            @RequestParam("id") List<Long> ids) {
        return super.findInventoryForSkus(request, ids);
    }

    @Override
    @RequestMapping(value = "product/{id}/media", method = RequestMethod.GET)
    public List<MediaWrapper> findMediaForProduct(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findMediaForProduct(request, id);
    }

    @Override
    @RequestMapping(value = "category/{id}/media", method = RequestMethod.GET)
    public List<MediaWrapper> findMediaForCategory(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findMediaForCategory(request, id);
    }

    @Override
    @RequestMapping(value = "product/{id}/categories", method = RequestMethod.GET)
    public CategoriesWrapper findParentCategoriesForProduct(HttpServletRequest request,
            @PathVariable("id") Long id) {
        return super.findParentCategoriesForProduct(request, id);
    }
}
