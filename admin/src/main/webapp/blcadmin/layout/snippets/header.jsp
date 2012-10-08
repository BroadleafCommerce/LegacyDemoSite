<header>	
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
                <div class="row-fluid">
                    <div class="span2">
                        <a class="brand" href="#"><img src="${pageContext.request.contextPath}/resources/img/broadleaf_admin_header_logo.png" /></a>
                    </div>
                    <div class="span10">
                        <div class="menu-options">
                            <a class="btn btn-danger pull-right logout" href="${pageContext.request.contextPath}/adminLogout.htm" title="Logout"><i class="icon-off icon-white"></i></a>
                            <div class="btn-group pull-right">
                                <a class="btn btn-inverse dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="icon-user icon-white"></i> jfridye <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/blcadmin/changePassword">Change Password...</a></li>
                                    <li><a href="#">Edit Profile...</a></li>
                                </ul>
                            </div>
                            <form class="navbar-search pull-left">
                                <input id="quick-search"type="text" class="search-query" placeholder="Search in Customers">
                            </form>
                            <div id="loading-placeholder" class="progress progress-striped active pull-left">
                                <div class="bar" style="width: 100%;">Loading...</div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</header>
