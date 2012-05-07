<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">

        <div class="mainContentAreaFull clearfix" style="padding:0 0 8px 8px;">
            <form:form method="post" action="${pageContext.request.contextPath}/login_post.htm">
                <div class="orderBorder span-10" style="margin-top:10px;" >
                    <div class="orderTitle" > <b>Login for Existing users</b></div>
                    <table class="formTable">
                        <c:if test="${param.error eq 'true'}">
                            <tr>
                                <td colspan="2"><span style="color:red">Your login credentials were incorrect</span></td>
                            </tr>
                        </c:if>
                            <tr>
                                <td style="text-align:right"><label for="username">Username</label></td>
                                <td><input size="30" cssClass="userField" id="username" name="j_username" /></td>
                            </tr>
                            <tr>
                                <td style="text-align:right"><label for="password">Password</label></td>
                                <td><input size="30" type="password" cssClass="userField" id="password" name="j_password" /></td>
                            </tr>
                            <tr>
                                <td style="text-align:right"><label for="_spring_security_remember_me">Remember Me:</label></td>
                                <td><input type="checkbox" name="_spring_security_remember_me" id="_spring_security_remember_me" /></td>
                            </tr>
                            <tr>
                                <td class="alignCenter" colspan="2">
                                    <button type="submit" value="Login">Login</button>
                                </td>
                            </tr>
                    </table>
                </div>
            </form:form>
            <p>
                (Not registered? Create an account <a href="<c:out value="${pageContext.request.contextPath}"/>/registerCustomer/registerCustomer.htm">here</a> )
            </p>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>

