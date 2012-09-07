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

            <h2>Product Search</h2>
            <div class="row">
                <div class="span12">
                    <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="name">Name</label>
                            <div class="controls">
                                <input type="text" id="name" placeholder="Name">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="retailPrice">Retail Price</label>
                            <div class="controls">
                                <div class="input-prepend input-append">
                                    <span class="add-on">$</span><input id="retailPrice" size="16" type="text"><span class="add-on">.00</span>
                                </div>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="salePrice">Sale Price</label>
                            <div class="controls">
                                <div class="input-prepend input-append">
                                    <span class="add-on">$</span><input id="salePrice" size="16" type="text"><span class="add-on">.00</span>
                                </div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <hr/>

            <div id="gwt-component">

            </div>
            <jsp:include page="/blcadmin/layout/snippets/footer.jsp" />
        </div>
    </div>
</div>
<script type="text/javascript" language="javascript" src="/admin/com.mycompany.gwt.mycompanyAdmin/com.mycompany.gwt.mycompanyAdmin.nocache.js"></script>
</body>
</html>
