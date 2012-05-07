<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html>
<head>

<!-- Blueprint Framework CSS -->
<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/blueprint/screen.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/bootstrap.css" />
<style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
</style>
<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/bootstrap-responsive.css"/>
<%--<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/product.css" />--%>



<!--[if lt IE 8]>
<link rel="stylesheet" href="css/blueprint/ie.css" type="text/css" media="screen, projection">
<![endif]-->

<!--[if IE]>
<link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.request.contextPath}"/>/css/ieConditional.css" />
<![endif]-->

    <%--Pull jquery from googleapis--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


    <%--Bootstrap scripts--%>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap-transition.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap-button.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/bootstrap-carousel.js"></script>

    <%--<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/jquery-1.3.2.js"></script>--%>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/behaviors.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/ui.core.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/ui.slider.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/thickbox-compressed.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/product.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/checkout.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/ui.stars.js"></script>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/catalog.js"></script>
    <%--Autofill script for testing purposes--%>
    <script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}"/>/js/checkout-autofill.js"></script>

</head>
<body>
<tags:sandboxRibbon jqueryUIDatepicker="${pageContext.request.contextPath}/js/ui.datepicker.js"/>
<%--<div style="height: 100px; width: 300px">--%>
    <%--My Company--%>

<%--</div>--%>