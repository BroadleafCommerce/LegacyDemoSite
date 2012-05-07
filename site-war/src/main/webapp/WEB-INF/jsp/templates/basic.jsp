<%@ include file="/WEB-INF/jsp/include.jsp" %>
<jsp:include page="/WEB-INF/layouts/header.jsp" />
<div class="mainContentAreaFull" style="padding:8px;">
<div id="cmsContent">
    <c:if test="${BLC_PAGE ne null}">
        ${BLC_PAGE.pageFields.body.value}
    </c:if>
</div>
</div>
<jsp:include page="/WEB-INF/layouts/footer.jsp" />

