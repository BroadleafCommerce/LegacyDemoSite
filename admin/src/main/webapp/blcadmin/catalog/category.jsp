<!DOCTYPE HTML>
<html lang="en">
	<jsp:include page="/blcadmin/layout/snippets/head.jsp" />
	<body>
		<jsp:include page="/blcadmin/layout/snippets/header.jsp" />
		<div class="container-fluid">
            <div class="row-fluid">
			<div class="span2">
				<jsp:include page="/blcadmin/layout/snippets/leftNav.jsp" />
			</div>
			<div class="span10">

                <%--<div id="loading-placeholder" class="row">--%>
                    <%--<div class="span4">&nbsp;</div>--%>
                    <%--<div class="span4">--%>
                        <%--<div id="loading-placeholder" class="progress progress-striped active">--%>
                            <%--<div class="bar" style="width: 100%;"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="span4">&nbsp;</div>--%>
                <%--</div>--%>

                <div id="gwt-component">

                </div>
                <jsp:include page="/blcadmin/layout/snippets/footer.jsp" />
			</div>
            </div>
		</div>
        <script type="text/javascript" language="javascript" src="/admin/com.mycompany.gwt.mycompanyAdmin/com.mycompany.gwt.mycompanyAdmin.nocache.js"></script>
    </body>
</html>
