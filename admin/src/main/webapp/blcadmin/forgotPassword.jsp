<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/admin/admin_login.css" />
      <title>Broadleaf Commerce - Administrative Application Forgot Username</title>
      
      <script language="javascript">
          function setSubmitUrl(form)
          {
            var hash = encodeURI(self.document.location.hash.substring(1));
            form.action = "blcadmin/resetPassword#" + hash;
            return true;
          }
      </script>
   </head>
   <body id="bg" class="en">
        <c:choose>
            <c:when test="${errorCode == 'invalidUser'}">
                <div id="login-error">No matching username found.</div>
            </c:when>
            <c:when test="${errorCode == 'emailNotFound'}">
                <div id="login-error">The requested username does not have a valid email address.  Please contact an administrator.</div>
            </c:when>
            <c:when test="${errorCode == 'inactiveUser'}">
                <div id="login-error">The username you entered is marked as inactive.   Please contact an administrator to activate your account.</div>
            </c:when>
            <c:when test="${not empty param.errorCode}">
                <div id="login-error">Unknown error.</div>
            </c:when>
        </c:choose>


        <div id="content">
            <div id="logo"></div>
            <form class="login-form" onSubmit="return setSubmitUrl(this);" method="post">
                <table class="login">
                    <tr><td><label for="username_field" class="user">Username:</label><input id="username_field" class="input-username" name="username" type="text"></td></tr>
                    <tr><td><input id="submitButton" type="submit" value="Reset Password"></td></tr>
                </table>
            </form>
        </div>
        <div id="foot" class="forgot">
            <a href="forgotUsername">Forgot username</a> -
            <a href="login">Return to Login</a>
        </div>
   </body>
</html>