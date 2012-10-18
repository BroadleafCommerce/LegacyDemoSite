<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/admin/admin_login.css" />
      <title>Broadleaf Commerce - Administrative Application Login</title>
   </head>
   <body id="bg" class="en">
        <c:choose>
            <c:when test="${errorCode == 'notFound'}">
                <div id="login-error">No matching user found.</div>
            </c:when>
            <c:when test="${errorCode == 'inactiveUser'}">
                <div id="login-error">The username associated with the email you entered is marked as inactive.   Please contact an administrator to activate the account.</div>
            </c:when>
            <c:when test="${errorCode == 'invalidToken' || errorCode == 'tokenExpired'}">
                <div id="login-error">The token entered is invalid or expired.     To request a new token, choose the "Forgot Password" link below.</div>
            </c:when>
            <c:when test="${errorCode == 'tokenUsed'}">
                <div id="login-error">The token entered has already been processed.   No new updates were made.   To request a new token, choose the "Forgot Password" link below.</div>
            </c:when>
            <c:when test="${errorCode == 'inactiveUser'}">
                <div id="login-error">The username associated with the email you entered is marked as inactive.   Please contact an administrator to activate the account.</div>
            </c:when>
            <c:when test="${errorCode == 'invalidPassword'}">
                <div id="login-error">Please enter a valid password.</div>
            </c:when>
            <c:when test="${errorCode == 'passwordMismatch'}">
                <div id="login-error">The password and confirm password fields did not match.</div>
            </c:when>
            <c:when test="${param.messageCode == 'passwordTokenSent'}">
                <div id="login-message">A reset password email was sent to the address associated with your account.  Enter the token from your email in the form below to reset your password.</div>
            </c:when>
        </c:choose>

        <div id="content">
            <div id="logo"></div>
            <form:form cssClass="login-form" modelAttribute="resetPasswordForm" method="post">
                <table class="login">
                    <tr><td><label for="username_field" class="user">Username:</label><form:input id="username_field" cssClass="input-username" path="username"/></td></tr>
                    <tr><td><label for="password_field" class="pass">Old Password:</label><form:password id="old_password_field" cssClass="input-pass" path="oldPassword"/></td></tr>
                    <tr><td><label for="password_field" class="pass">New Password:</label><form:password id="password_field" cssClass="input-pass" path="password"/></td></tr>
                    <tr><td><label for="confirm_password_field" class="pass">Verify New Password:</label><form:password id="confirm_password_field" cssClass="input-pass" path="confirmPassword"/></td></tr>
                    <tr id="LoginBtn"><td><input id="submitButton" type="submit" value="Reset Password"></td></tr>
                </table>
            </form:form>
        </div>

        <div id="foot" class="forgot">
            <a href="login">Login</a> -
            <a href="forgotUsername">Forgot username</a> -
            <a href="forgotPassword">Forgot password</a>
        </div>
   </body>
</html>