<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">
	<div class="mainContent container">
		<h3 class="pageTitle" ><b>Order Details</b></h3>
		<jsp:include page="/WEB-INF/jsp/orderSnippet.jsp" />
	</div>
	</tiles:putAttribute>
</tiles:insertDefinition>