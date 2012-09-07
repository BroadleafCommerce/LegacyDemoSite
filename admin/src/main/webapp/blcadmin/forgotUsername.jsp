<%@ include file="/blcadmin/snippets/include.jsp" %>
<!DOCTYPE html>

<html lang="en">
   <head>
       <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css" />
      <title>Broadleaf Commerce - Administrative Application Forgot Username</title>
   </head>

   <body>
       <div id="login">
           <div id="logo">
               <img src="${pageContext.request.contextPath}/resources/img/broadleaf_admin_header_logo.png" />
           </div>
           <form action="${pageContext.request.contextPath}/blcadmin/forgotUsername" method="post" class="form-horizontal">
               <div class="control-group">
                   <label class="control-label" for="email_field">Email</label>
                   <div class="controls">
                       <input type="email" id="email_field" name="emailAddress" autofocus="autofocus" />
                   </div>
               </div>
               <div class="control-group">
                   <div class="controls">
                       <button type="submit" class="btn" >Send Username</button>
                   </div>
               </div>
           </form>
       </div>

       <c:choose>
           <c:when test="${errorCode == 'notFound'}">
               <p class="alert alert-error"><strong>No matching user found.</strong></p>
           </c:when>
           <c:when test="${errorCode == 'inactiveUser'}">
               <p class="alert alert-success"><strong>The username associated with the email you entered is marked as inactive. Please contact an administrator to activate the account.</strong></p>
           </c:when>
           <c:when test="${not empty param.errorCode}">
               <p class="alert alert-success"><strong>Unknown error.</strong></p>
           </c:when>
       </c:choose>

       <div id="security-options">
           <a href="${pageContext.request.contextPath}/blcadmin/forgotPassword">Forgot password</a> |
           <a href="${pageContext.request.contextPath}/blcadmin/login">Return to login</a>
       </div>

       <script src="${pageContext.request.contextPath}/resources/js/lib/jquery-1.8.0.min.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/security.js"></script>

   </body>

</html>