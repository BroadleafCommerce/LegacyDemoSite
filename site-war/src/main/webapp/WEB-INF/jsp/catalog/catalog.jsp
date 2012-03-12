<%@ include file="/WEB-INF/jsp/include.jsp" %>
<jsp:include page="/WEB-INF/jsp/header.jsp" />
<div class="mainContentAreaFull" style="padding:8px;">
<c:choose>
	<c:when test="${!empty displayProducts}">
		<table>
	 	<c:forEach var="product" items="${displayProducts}" varStatus="status">
	 			<tr>
				<td>
					${product.name}  <br/>
					<c:if test="${!(empty product.manufacturer) }" >
						<span> <b>Manufacturer:</b> ${product.manufacturer} </span> <br/>
					</c:if>
					<c:if test="${!(empty product.model) }" >
						<span> <b>Model:</b> ${product.model} </span> <br/>
					</c:if>
				<td>
				<td>
					$<c:out value="${product.sku.retailPrice}" />
				</td>
				<td>
					<a class="addCartBtn" href="<c:url value="/basket/addItem.htm">
					    <c:param name="skuId" value="${product.sku.id}"/>
                        <c:param name="productId" value="${product.id}"/>
						<c:param name="categoryId" value="${product.defaultCategory.id}"/>
						<c:param name="quantity" value="1"/> </c:url>">Add to Cart</a>
				</td>
				</tr>
		</c:forEach>
		</table>
	</c:when>
</c:choose>
</div>
<jsp:include page="/WEB-INF/jsp/footer.jsp" />