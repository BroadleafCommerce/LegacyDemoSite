<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">
		<div class="mainContent">
			<h2 style="color: rgb(86, 111, 50);">You have successfully registered.</h2>
			<a href='<c:url value="/store"/>'>Continue Shopping</a>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>