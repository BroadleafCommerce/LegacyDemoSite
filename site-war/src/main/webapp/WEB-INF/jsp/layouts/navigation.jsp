<%@ include file="/WEB-INF/jsp/include.jsp" %>

<blc:categoryLookup var="navCategory" categoryName="Store" />

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
         <div class="container">

             <a class="brand" href="#">Broadleaf Commerce - Archetype</a>

             <ul class="nav">

                 <li class="${currentCategory.generatedUrl==null?'active':''}">
                     <a  href="<c:out value="${pageContext.request.contextPath}"/>/store">Home</a>
                 </li>

                 <c:forEach var="childCategory" items="${navCategory.childCategories}" varStatus="status">
                     <li class="${currentCategory.generatedUrl==childCategory.generatedUrl ? 'active':''}">
                         <a href="<c:out value="${pageContext.request.contextPath}"/>/${childCategory.generatedUrl}">${childCategory.name}</a>
                     </li>
                 </c:forEach>

                 <li class="divider-vertical"></li>

             </ul>

             <form class="navbar-search pull-left" method="post" action="<c:out value="${pageContext.request.contextPath}"/>/search/results.htm">
                 <input class="search-query" type="text" name="queryString" id="queryString" size="30" placeholder="Search" />
             </form>



             <ul class="nav pull-right">
                 <li>
                     <c:choose>
                         <c:when test="${customer.anonymous}">
                             <%--<a href="<c:out value="${pageContext.request.contextPath}"/>/account/login.htm">Login</a>--%>



                             <a data-toggle="modal" href="#myModal">Login</a>


                         </c:when>
                         <c:otherwise>
                             <a href="<c:out value="${pageContext.request.contextPath}"/>/profile/myAccount.htm">Hello <c:out value="${customer.firstName}"/></a>
                             <a href="<c:out value="${pageContext.request.contextPath}"/>/logout.htm">Logout</a>
                         </c:otherwise>
                     </c:choose>
                 </li>

                 <li><a href="<c:out value="${pageContext.request.contextPath}"/>/orders/findOrder.htm" > Find Order </a></li>
                 <li><a href="<c:out value="${pageContext.request.contextPath}"/>/basket/viewCart.htm">View Cart</a></li>

             </ul>


       </div>
    </div>
</div>

<%--<jsp:include page="/WEB-INF/jsp/account/login.jsp" />--%>

<%--Modal used to log the user in--%>
<div id="myModal" class="modal hide fade" style="width: 350px; position: absolute; left: 58%;"  >
    <div class="modal-header">
        <button class="close" data-dismiss="modal">x</button>
        <h3>Login</h3>
    </div>
    <div class="modal-body">
        <form class="well" action="${pageContext.request.contextPath}/login_post.htm">
            <div class="row-fluid">
                <div class="span3">
                    <label>USERNAME</label>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span3">
                    <input id="username" name="j_username" size="30" type="text" class="input-xlarge" placeholder="username">
                </div>
            </div>
            <div class="row-fluid">
                <div class="span8">
                    <label>PASSWORD</label>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span8">
                    <input id="password" name="j_password" size="30" type="password" class="input-xlarge" placeholder="password">
                </div>
            </div>

            <div class="row-fluid">
                <c:if test="${param.error eq 'true'}">
                    <%--<span class="help-block" style="color:red">Your login credentials were incorrect</span>--%>
                    <div class="alert alert-error">
                        Your login credentials were incorrect
                    </div>
                </c:if>
            </div>


            <div class="row-fluid">
                <div class="span6">
                    <button type="submit" class="btn">Log in</button>
                    <%--<button id="fat-btn" data-loading-text="verifying..." class="btn">Log in</button>--%>


                </div>
                <div class="span6">
                    <label class="checkbox">
                        <input type="checkbox" name="_spring_security_remember_me" id="_spring_security_remember_me">
                        <label for="_spring_security_remember_me">Keep me logged in</label>
                    </label>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <a href="<c:out value="${pageContext.request.contextPath}"/>/registerCustomer/registerCustomer.htm">Create an account</a>
        <a href="#" data-dismiss="modal" class="btn">Close</a>
    </div>
</div>