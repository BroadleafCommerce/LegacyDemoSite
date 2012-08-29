<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
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
				<div class="hero-unit">
					<h1>Hello, world!</h1>
					<p>This is a template for a simple marketing or informational
						website. It includes a large callout called the hero unit and
						three supporting pieces of content. Use it as a starting point to
						create something more unique.
					</p>
					<p>
						<a class="btn btn-primary btn-large">Learn more</a>
					</p>
				</div>
			</div>
		</div>
		<jsp:include page="snippets/footer.jsp" />
	</body>
</html>
	
	