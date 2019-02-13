<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
	a, a:hover, a:focus, a:active, a:link, a:visited{text-decoration:none;}
	.pager-wrap{margin-top:30px; margin-bottom:30px; text-align:center; font-size:0;}
	.pager-wrap .btn-page-move{display:inline-block; vertical-align:top; width:30px; height:30px; line-height:30px; font-size:12px; font-weight:600; color:#666;}
	.pager-wrap ul{display:inline-block; margin:0 15px;}
	.pager-wrap ul li{display:inline-block; vertical-align:top; margin:0 5px;}
	.pager-wrap ul li a{display:block; width:30px; height:30px; line-height:30px; /* background:#DDD; */ border-radius:50%; font-size:12px; color:#000;}
	.pager-wrap ul li.on a{background:#fd5d7c;}
</style>


<div class="pager-wrap">

	<!--  <<== 謝難 nav -->
	<%-- <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
		<li class="btn-page-move"></li>
	</c:if> --%>
	<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
		<a href="javascript:fncGetList('${ resultPage.currentPage-1}')" class="btn-page-move">
			&lt;&lt;
		</a>
	</c:if>
	
    <ul>
        <!--  醞懈  -->
		<c:forEach var="i" begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">

			<c:if test="${ resultPage.currentPage == i }">
				<!--  ⑷營 page 陛腦鑒唳辦 : active -->
				<li class="on">
					<a href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
				</li>
			</c:if>

			<c:if test="${ resultPage.currentPage != i}">
				<li><a href="javascript:fncGetList('${ i }');">${ i }</a></li>
			</c:if>
		</c:forEach>
    </ul>
    
    <!--  辦難 nav==>> -->
	<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
		<li class="btn-page-move"></li>
	</c:if>
	<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		<a href="javascript:fncGetList('${resultPage.endUnitPage+1}')" class="btn-page-move">
			&gt;&gt;
		</a>
	</c:if>
    
</div>

