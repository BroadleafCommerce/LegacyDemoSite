<%@ include file="/WEB-INF/jsp/include.jsp" %>

<c:choose>
	<c:when test="${!empty displayProducts}">
		<div class="row-fluid" >
            <div class="span10 pull-right">
				<form:form method="post" modelAttribute="catalogSort" name="sortForm">
					<b>Sort by:</b> 
					<form:select id="catalogSort" path="sort" >
		   		 		<form:option value="featured" >Featured</form:option>
		   		 		<form:option value="priceL">Price - Low to High</form:option>
		   		 		<form:option value="priceH">Price - High to Low</form:option>
		   		 		<form:option value="manufacturerA">Manufacturer A-Z</form:option>
						<form:option value="manufacturerZ">Manufacturer Z-A</form:option>
					</form:select>
				</form:form>
            </div>
		</div>
        <%--<div class="well">--%>
            <ul class="thumbnails">

                <c:forEach var="product" items="${displayProducts}" varStatus="status">
                    <li class="span2">

                        <c:choose>
                            <c:when test="${!( empty displayProduct.promoMessage)}">
                                <div class="span-13 columns productResults featuredProduct">
                            </c:when>
                            <c:otherwise>
                                <div class="thumbnail">
                            </c:otherwise>
                        </c:choose>
                                    <a href="<c:out value="${pageContext.request.contextPath}"/>/${currentCategory.generatedUrl}?productId=${product.id}">
                                        <img border="0" title="${product.name}" alt="${product.name}" src='<cms:url value="${product.productMedia.small.url}"/>' width="75"/>
                                    </a>
                                <div class="caption">
                                    <p><blc:productLink product="${product}" /></p>
                                    <c:if test="${!(empty product.manufacturer) }" >
                                        <b>Manufacturer:</b> ${product.manufacturer}
                                    </c:if>
                                    <c:if test="${!(empty product.model) }" >
                                        <b>Model:</b> ${product.model}
                                    </c:if>

                                          <p>
                                            <c:choose>
                                                <c:when test="${product.sku.salePrice != null && product.sku.salePrice != product.sku.retailPrice }" >
                                                    Sale: <span class="salePrice">$<c:out value="${product.sku.salePrice}" /></span>
                                                    <br/><span class="originalPrice">$<c:out value="${product.sku.retailPrice}" /></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="salePrice">$<c:out value="${product.sku.retailPrice}" /></span>
                                                </c:otherwise>
                                            </c:choose>
                                          </p>
                                          <p>
                                            <a class="btn btn-primary" href="<c:url value="/basket/addItem.htm">
                                                <c:param name="skuId" value="${product.sku.id}"/>
                                                <c:param name="productId" value="${product.id}"/>
                                                <c:param name="categoryId" value="${product.defaultCategory.id}"/>
                                                <c:param name="quantity" value="1"/> </c:url>">Add to Cart
                                            </a>
                                          </p>
                                </div>
                                <c:choose>
                                    <c:when test="${ !( empty displayProduct.promoMessage)}">
                                        <div class="span-13">
                                            <span class="featuredProductPromo"> <b>${displayProduct.promoMessage} </b></span>
                                        </div>
                                    </c:when>
                                </c:choose>
                        </div>

                    </li>
                </c:forEach>
            </ul>
        <%--</div>--%>
	</c:when>
</c:choose>