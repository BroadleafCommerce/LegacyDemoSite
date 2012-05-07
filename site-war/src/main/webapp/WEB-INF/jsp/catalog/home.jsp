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

        <div class="container">
            <div class="page-header">
                <h1>Archetype Sample Store</h1>
                <cms:content contentType="Message" contentName="Home Page Message" contentItemVar="item">
                    <c:if test="${numResults > 0}">
                        <h3>${item.messageText}</h3>
                    </c:if>
                </cms:content>
            </div>

            <div class="row-fluid">

                <div id="myCarousel" class="carousel">
                    <!-- Carousel items -->
                    <div class="carousel-inner">
                        <div class="active item">
                            <cms:content contentType="Homepage Banner Ad" contentItemVar="item">
                                <a href='<cms:url value="${item.targetUrl}"/>'><img src='<cms:url value="${item.imageUrl}"/>' /></a>
                            </cms:content>
                            <div class="carousel-caption">
                                <h4>First Home Page Banner Add</h4>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                            </div>
                        </div>
                        <%--<div class="item">…</div>--%>
                        <%--<div class="item">…</div>--%>
                    </div>
                    <!-- Carousel nav -->
                    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>



                 <%--<cms:content contentType="Homepage Banner Ad" contentItemVar="item">--%>
                     <%--<a href='<cms:url value="${item.targetUrl}"/>'><img src='<cms:url value="${item.imageUrl}"/>' /></a>--%>
                 <%--</cms:content>--%>

            </div>

            <div class="row-fluid">
                <ul class="thumbnails">
                    <cms:content contentType="Homepage Small Ad" count="2" contentListVar="itemList">
                        <c:forEach var="item" items="${itemList}">

                            <li class="span3">
                                <div class="thumbnail">
                                    <a href='<cms:url value="${item.targetUrl}"/>'><img src='<cms:url value="${item.imageUrl}"/>' /></a>
                                    <div class="caption">
                                        <p><a class="btn" href='<cms:url value="${item.targetUrl}"/>'>View details &raquo;</a></p>
                                    </div>
                                </div>
                            </li>

                        </c:forEach>
                    </cms:content>
                </ul>
            </div>





         </div>

    </tiles:putAttribute>
</tiles:insertDefinition>