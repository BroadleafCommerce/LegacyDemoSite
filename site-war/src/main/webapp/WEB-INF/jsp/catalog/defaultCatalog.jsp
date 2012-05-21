<%--
  Created by IntelliJ IDEA.
  User: jerryocanas
  Date: 3/12/12
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">

        <script>
            function updateSearchFilterResults() {
                $('#mainContent').prepend("<div class='grayedOut'><img style='margin-top:25px' src='<c:out value="${pageContext.request.contextPath}"/>/images/ajaxLoading.gif'/></div>");
                var postData = $('#refineSearch').serializeArray();
                postData.push({name:'ajax',value:'true'});
                $('#mainContent').load($('#refineSearch').attr('action'), postData);
            }

            $(document).ready(function(){
                $("#catalogSort").change(function () {
                    document.sortForm.submit();
                });
            });

        </script>

        <div class="breadcrumb">
            <blc:breadcrumb categoryList="${breadcrumbCategories}" />
        </div>


        <div class="container-fluid">
            <div class="row-fluid">
                <%--Sidebar content--%>
                <div class="span2">
                    <form:form method="post" id="refineSearch" commandName="doSearch">
                        <blc:searchFilter categories="${displayCategories}" queryString="">
                            <blc:searchFilterItem property="name" displayTitle="Categories" />
                        </blc:searchFilter>
                        <blc:searchFilter products="${displayProducts}" queryString="">
                            Narrow results by:
                            <blc:searchFilterItem property="manufacturer" displayTitle="Manufacturers"/>
                            <br />
                            <blc:searchFilterItem property="sku.salePrice" displayTitle="Prices" displayType="sliderRange"/>
                        </blc:searchFilter>

                        <blc:displayFeaturedProducts products="${displayProducts}" var="featuredProducts" maxFeatures="3">
                            <br/><br/>
                            <c:if test="${!(empty featuredProducts)}">
                                <h3>Featured </h3>
                                <c:forEach var="product" items="${featuredProducts}" >
                                    <div align="center">
                                        <a href="<c:out value="${pageContext.request.contextPath}"/>/${currentCategory.generatedUrl}?productId=${product.id}">
                                            <c:out value="${product.name}"/>
                                        </a><br>
                                        <a href="<c:out value="${pageContext.request.contextPath}"/>/${currentCategory.generatedUrl}?productId=${product.id}">
                                            <img border="0" src='<cms:url value="${product.productMedia.small.url}"/>' width="75"/>
                                        </a>
                                    </div>
                                    <br/>
                                </c:forEach>
                            </c:if>
                        </blc:displayFeaturedProducts>

                    </form:form>
                </div>

                <%--Catalog content--%>
                <div class="span8" id="mainContent">
                    <jsp:include page="/WEB-INF/jsp/catalog/categoryView/mainContent.jsp" />
                </div>

            </div>

        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>