<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
       <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
       <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/resources/css/admin.css" />
      <title>Broadleaf Commerce - Administrative Application Login</title>
      
   </head>

   <body>
        <div id="login">
            <div id="logo">
                <img src="${pageContext.request.contextPath}/resources/img/broadleaf_admin_header_logo.png" />
            </div>
            <form action="${pageContext.request.contextPath}/admin/login_admin_post" method="post" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="username_field">Username</label>
                    <div class="controls">
                        <input type="text" id="username_field" name="j_username" autofocus="autofocus" />
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password_field">Password</label>
                    <div class="controls">
                        <input type="password" id="password_field" name="j_password" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn" >Sign In</button>
                    </div>
                </div>
            </form>
        </div>
        <c:choose>
            <c:when test="${not empty param.login_error}">
                <p class="alert alert-error"><strong>Invalid username / password combination.</strong></p>
            </c:when>
            <c:when test="${param.messageCode == 'usernameSent'}">
                <p class="alert alert-success">Your username was sent to the email address on file.</p>
            </c:when>
            <c:when test="${param.messageCode == 'passwordReset'}">
                <p class="alert alert-success">Your password has been reset.  Please login with your new password.</p>
            </c:when>
        </c:choose>
        <div id="security-options">
            <a href="<c:out value="${pageContext.request.contextPath}"/>/blcadmin/forgotUsername">Forgot username</a> -
            <a href="<c:out value="${pageContext.request.contextPath}"/>/blcadmin/forgotPassword">Forgot password</a> -
            <a href="<c:out value="${pageContext.request.contextPath}"/>/blcadmin/changePassword">Change password</a>
        </div>
        <script src="${pageContext.request.contextPath}/resources/js/lib/jquery-1.8.0.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/security.js"></script>
   </body>
</html>