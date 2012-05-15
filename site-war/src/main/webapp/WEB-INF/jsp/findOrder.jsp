<%@ include file="/WEB-INF/jsp/include.jsp" %>
<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="bodyContent" type="string">

        <div class="container">
            <div class="container-fluid well span4">

                <form:form method="post" action="processFindOrder.htm" commandName="findOrderForm">
                    <div class="columns">
                        <div class="column span5">
                            <h3>Find Order</h3>
                            <table class="basicTable">
                                <tr>
                                    <td nowrap>Order Number</td>
                                    <td><form:input path="orderNumber"/></td>
                                </tr>
                                <tr>
                                    <td nowrap>Postal Code</td>
                                    <td><form:input path="postalCode"/></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><button type="submit" name="findOrder" value="Find Order" class="btn"><i class="icon-search"></i> Find Order</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form:form>

            </div>
        </div>

	</tiles:putAttribute>
</tiles:insertDefinition>