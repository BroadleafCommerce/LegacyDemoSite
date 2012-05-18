<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">
        <div class="container">
            <div class="page-header">
                <h3 class="pageTitle">Your Shopping Cart</h3>
                <c:choose>
                    <c:when test="${!empty currentCartOrder.orderItems}">
                        <p style="margin-bottom:8px;">Checking out is quick, easy and secure. &nbsp; If you have any questions, please contact support.</p>
            </div>
            <div class="row">
                <div class="span8">
                        <table id="order-details" class="table">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            <form:form modelAttribute="cartSummary" method="POST" name="cartForm">
                                <form:errors path="*" cssClass="errorText"/>
                                <c:forEach items="${currentCartOrder.orderItems}" var="orderItem" varStatus="row">
                                    <c:set var="item" value="${orderItem.sku}"/>
                                    <c:set var="product" value="${item.allParentProducts[0]}"/>
                                    <c:url var="itemUrl" value="/${product.defaultCategory.generatedUrl}">
                                        <c:param name="productId" value="${product.id}"/>
                                    </c:url>
                                    <tr id="row-${row.index}">
                                        <td>
                                            <div class="thumbnail">
                                                <a href="${itemUrl}">
                                                    <img title="${product.name}" width="80" height="60" alt="${product.name}" src='<cms:url value="${product.productMedia.small.url}"/>' />
                                                </a>
                                                <div class="caption">
                                                    <a href="${itemUrl}">${item.name}</a>
                                                </div>
                                            </div>
                                        </td>

                                        <td>
                                            <form:hidden path="rows[${row.index}].orderItem.id"/>
                                            <form:input cssClass="quantityInput" cssStyle="width:30px" maxlength="3" path="rows[${row.index}].quantity" autocomplete="off"/>
                                            <br/>
                                            <input type="submit" name="updateItemQuantity" id="updateQuantity" value="Update" class="btn" />
                                            <br />
                                            <c:url var="removeItemUrl" value="/basket/viewCart.htm">
                                                <c:param name="orderItemId" value="${orderItem.id}"/>
                                                <c:param name="removeItemFromCart" value="true"/>
                                            </c:url>
                                            <a class="cartLinkBtn" href="${removeItemUrl}">Remove</a>
                                        </td>
                                        <td>
                                    <span class="price">
                                        <c:choose>
                                               <c:when test="${item.salePrice != null && item.salePrice.amount != item.retailPrice.amount}">
                                                   <span class="salePrice"><fmt:formatNumber type="currency" value="${item.salePrice.amount}" /></span>
                                                   <br/><span class="originalPrice">reg&nbsp;<fmt:formatNumber type="currency" value="${item.retailPrice.amount}" /></span>
                                               </c:when>
                                               <c:otherwise>
                                                   <fmt:formatNumber type="currency" value="${item.retailPrice.amount}" />
                                               </c:otherwise>
                                           </c:choose>
                                    </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${orderItem.adjustmentValue.amount > 0}" >
                                                    <span class="price" style="color:red;">(<fmt:formatNumber type="currency" value="${orderItem.adjustmentValue.amount}" />)</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="price"> -- &nbsp;&nbsp;&nbsp;</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <span class="price"><fmt:formatNumber type="currency" value="${orderItem.price.amount * orderItem.quantity}" /></span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>

                <div class="span4">
                    <table id="order-summary" class="table
                    ">
                        <tbody>
                            <tr>
                                <td><strong>Subtotal:</strong></td>
                                <td><span class="price">$${currentCartOrder.subTotal}</span></td>
                            </tr>
                            <tr>
                                <c:if test="${(currentCartOrder.orderAdjustmentsValue != null)}">
                                    <td><strong>Order Discount:</strong></td>
                                    <td><span class="price" style="color:red;">($${currentCartOrder.orderAdjustmentsValue})</span></td>
                                </c:if>
                            </tr>
                            <tr>
                                <td><strong>Tax:</strong></td>
                                <td><span class="price">$${currentCartOrder.totalTax}</span></td>
                            </tr>
                            <tr>
                                <td> <strong>Shipping:</strong></td>
                                <td><span class="price">$${currentCartOrder.totalShipping}</span></td>
                            </tr>
                            <tr>
                                <c:if test="${(currentCartOrder.fulfillmentGroupAdjustmentsValue != null)}">
                                    <td><strong>Shipping Discount:</strong></td>
                                    <td><span class="price" style="color:red;">($${currentCartOrder.fulfillmentGroupAdjustmentsValue})</span></td>
                                </c:if>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td><strong>Total:</strong></td>
                                <td><span class="price">$${currentCartOrder.total }</span></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>

            <div class="row">

                <div class="span8 well">
                     Promo Code:
                        <form:input maxlength="10" path="promoCode" autocomplete="off"/>
                        <input type="submit" name="updatePromo" value="Add To Order" class="btn" />


                    Shipping Method:
                        <form:select  id="shipping"  cssClass="shipMethod" path="fulfillmentGroup.method">
                            <form:options items="${fulfillmentGroups}" itemValue="method" itemLabel="method" />
                        </form:select>
                        <input type="hidden" name="updateShipping"  id="shippingButton"/>
                </div>
            </div>



            <div class="row">
                            <div class="span5">
                                <a href="<c:url value="/store" />" class="btn"><i class="icon-arrow-left"></i> Continue Shopping</a>
                                <button type="submit" name="checkout" id="checkout" value="Proceed to Checkout" class="btn btn-primary"><i class="icon-shopping-cart icon-white"></i> Checkout</button>
                            </div>
                            </form:form>
                    </c:when>

                        <c:otherwise>
                            <c:url var="storeUrl" value="/store" />
                            <div style="line-height: 20px; margin-top: 16px;">
                                <b>Your shopping cart is currently empty</b><br>
                                &bull; &nbsp;  <a href="<c:out value="${storeUrl}" />" class="link">Click here</a>
                                to shop from our selection of fine coffees and brewing equipment.
                                <c:if test="${customer.firstName eq null}">
                                    <br>&bull; &nbsp; If you are a registered user,
                                    <a href="<c:out value="${pageContext.request.contextPath}"/>/registerCustomer/registerCustomer.htm" class="link">sign in</a>
                                    to retrieve any saved items.
                                </c:if>
                            </div>
                        </c:otherwise>

                </c:choose>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>