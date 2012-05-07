<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">
        <form:form method="post" commandName="search">
            <div class="formButtonFooter">
                <input type="submit" value="Rebuild Index Now"/>
            </div>
        </form:form>
	</tiles:putAttribute>
</tiles:insertDefinition>
