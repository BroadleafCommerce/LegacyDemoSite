<%@ include file="/blcadmin/snippets/include.jsp" %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css" />
        <title>Broadleaf Commerce - Administrative Application Reset Password</title>
    </head>

    <body>

        <div id="login">
            <div id="logo">
                <img src="${pageContext.request.contextPath}/resources/img/broadleaf_admin_header_logo.png" />
            </div>
            <form:form action="${pageContext.request.contextPath}/blcadmin/resetPassword" method="post" cssClass="form-horizontal" modelAttribute="resetPasswordForm">
                <div class="control-group">
                    <label class="control-label" for="username_field">Username</label>
                    <div class="controls">
                        <form:input id="username_field" path="username" autofocus="autofocus" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="token_field">Token</label>
                    <div class="controls">
                        <form:input id="token_field" path="token" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password_field">New Password</label>
                    <div class="controls">
                        <form:password id="password_field" path="password" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="confirm_password_field">Confirm New Password</label>
                    <div class="controls">
                        <form:password id="confirm_password_field" path="confirmPassword" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn" >Reset Password</button>
                    </div>
                </div>
            </form:form>
        </div>

        <c:choose>
            <c:when test="${errorCode == 'notFound'}">
                <p class="alert alert-error"><strong>No matching user found.</strong></p>
            </c:when>
            <c:when test="${errorCode == 'inactiveUser'}">
                <p class="alert alert-error"><strong>The username associated with the email you entered is marked as inactive.   Please contact an administrator to activate the account.</strong></p>
            </c:when>
            <c:when test="${errorCode == 'invalidToken' or errorCode == 'tokenExpired'}">
                <p class="alert alert-error"><strong>The token entered is invalid or expired.     To request a new token, choose the "Forgot Password" link below.</strong></p>
            </c:when>
            <c:when test="${errorCode == 'tokenUsed'}">
                <p class="alert alert-error"><strong>The token entered has already been processed.   No new updates were made.   To request a new token, choose the "Forgot Password" link below.</strong></p>
            </c:when>
            <c:when test="${errorCode == 'inactiveUser'}">
                <p class="alert alert-error"><strong>The username associated with the email you entered is marked as inactive.   Please contact an administrator to activate the account.</strong></p>
            </c:when>
            <c:when test="${errorCode == 'invalidPassword'}">
                <p class="alert alert-error"><strong>Please enter a valid password.</strong></p>
            </c:when>
            <c:when test="${errorCode == 'passwordMismatch'}">
                <p class="alert alert-error"><strong>The password and confirm password fields did not match.</strong></p>
            </c:when>
            <c:when test="${param.messageCode == 'passwordTokenSent'}">
                <p class="alert alert-success"><strong>A reset password email was sent to the address associated with your account.  Enter the token from your email in the form below to reset your password.</strong></p>
            </c:when>
        </c:choose>

        <div id="security-options">
            <a href="${pageContext.request.contextPath}/blcadmin/login">Login</a> |
            <a href="${pageContext.request.contextPath}/blcadmin/forgotUsername">Forgot username</a> |
            <a href="${pageContext.request.contextPath}/blcadmin/forgotPassword">Forgot password</a>
        </div>

        <script src="${pageContext.request.contextPath}/resources/js/lib/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/security.js"></script>

    </body>

</html>