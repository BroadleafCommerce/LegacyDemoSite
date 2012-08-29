<%@ include file="/snippets/include.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
	<jsp:include page="snippets/head.jsp" />
	<body>
		<jsp:include page="snippets/header.jsp" />
		<div class="container-fluid">
			<div class="span2">
				<jsp:include page="../snippets/widgets/profile.jsp" />
				<jsp:include page="snippets/leftNav.jsp" />
			</div>
			<div class="span10">
				<jsp:include page="../snippets/widgets/breadcrumb.jsp" />
				<div>
					${param.content}
				</div>
			</div>
		</div>
		<jsp:include page="snippets/footer.jsp" />
	</body>
</html>
	
	