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
      
      <script language="javascript">
          function setSubmitUrl(form)
          {
            var hash = encodeURI(self.document.location.hash.substring(1));
            form.action = "${pageContext.request.contextPath}/admin/login_admin_post#" + hash;
            return true;
          }
      </script>
   </head>
   <body id="bg" class="en">
        <c:choose>
            <c:when test="${not empty param.login_error}">
                <div id="login-error">Invalid username / password combination.</div>
            </c:when>
            <c:when test="${param.messageCode == 'usernameSent'}">
                <div id="login-message">Your username was sent to the email address on file.</div>
            </c:when>
            <c:when test="${param.messageCode == 'passwordReset'}">
                <div id="login-message">Your password has been reset.  Please login with your new password.</div>
            </c:when>
        </c:choose>

        <div id="content">
            <div id="logo"></div>
            <form class="login-form" onSubmit="return setSubmitUrl(this);" method="post">
                <table class="login">
                    <tr><td><label for="username_field" class="user">Username</label><input id="username_field" class="input-username" name="j_username" type="text"></td></tr>
                    <tr><td><label for="password_field" class="pass">Password</label><input id="password_field" class="input-pass" name="j_password" type="password"></td></tr>
                    <tr><td><input id="submitButton" type="submit" name="_spring_security_remember_me" value="Sign In"></td></tr>
                </table>
            </form>
        </div>
        <div id="foot" class="forgot">
            <a href="forgotUsername">Forgot username</a> -
            <a href="forgotPassword">Forgot password</a> -
            <a href="changePassword">Change password</a>
        </div>
   </body>
</html>