<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�츮���� �����</title>

	
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<script type="text/javascript">

	//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/act/getCommentListByWriter/${me.userId}").submit();
	}
	
	//============= ��� �� �Խñ۷� �̵�  Event  ó��(Click) =============	
	 $(function() {
	
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td:nth-child(2)" ).on("click" , function() {
			 self.location ="/info/getRestaurantInfo?communityNo="+$(this).text().trim();
		});
		
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td:nth-child(3)" ).on("click" , function() {
			var communityNo = $(this).data('param');
			 self.location ="/info/getRestaurantInfo?communityNo="+communityNo;
		});
		
	});	
	
</script>

<style>
	body{
		position : relative;
		font-family: 'Nanum Myeongjo', serif;
	}
	.container{
		font-weight : 700;
	}
	.tumTitle{
		font-weight : 700;
	}
	.button{
		font-size : 16px;
		font-weight : 700;
	}
	.topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/notice02_background.jpg");
		background-repeat : no-repeat;
		background-position : center -500px;
		background-size : cover;
		width : 100%;
		height : 400px;
	}
	.topImg::after{
		content : "";
		background : rgba(0, 0, 0, 0.2);
		position : absolute;
		top : 0;
		left : 0;
		width : 100%;
		height : 400px;
	}
	.topImg h1{
		position : absolute;
		line-height : 330px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
	}
	h1 .slim{
		font-weight : lighter;
	}
	.wrap{
		margin-top : 400px;
	}
	
	li{
		list-style-type : none;
	}
	
	.smallNavi{
		overflow : hidden;
		float : right;
		margin-top : -80px;
		margin-bottom : 60px;
	}
	
	.smallNavi li{
		float : left;
		margin-right : 20px;
		margin-top : 8em;
	}
	
	.homeImg{
		margin-top : -2px;
	}
	
	.getCommunityLink{cursor:pointer;}
	
	/* table sytle �߰� */
	.wrap{max-width:1440px; margin-top: 400px;}
	table{border-collapse:collapse; table-layout:fixed; margin-top:20px;}
	.table-type01{width:100%;}
	.table-type01 thead tr th{position:relative; padding:10px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
	.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
	.table-type01 thead tr th:first-child:before{display:none;}
	.table-type01 tbody tr td{padding:10px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
	.table-type01 tbody tr td:nth-child(3){padding:10px 20px; vertical-align:middle; text-align:left; border-bottom:1px solid #DDD; font-size:14px;}
	.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}
	/* table sytle �߰� */
</style>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
  	
  	
    
    <!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1><span class="slim">�ۼ��� </span>��� <span class="slim"></span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<div class="container">
	
		<div class="wrap">
		
			<!-- ������ ���� �׺���̼� ��� : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>����������</li>
				<li>></li>
				<li>Ȱ������</li>
				<li>></li>
				<li>�ۼ��� ���</li>
			</ul>
			<!-- ������ ���� �׺���̼� ��� : end -->
			
			<!-- PageNavigation ���� ������ ���� ������ �κ� -->
			<form>
				<div class="form-group search-group">
					<input type="hidden" id="currentPage" name="currentPage" value="">
				</div>
			</form>
			
			<div class="12u" style="clear:both;"> ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</div>
			
			<!-- ���̺� ����Ʈ : start -->
			<table class="table-type01">
	            <colgroup>
	                <col style="width:5%">
	                <col style="width:15%">
	                <col style="width:60%">
	                <col style="width:20%">
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>No</th>
	                    <th>�Խñ�</th>
	                    <th>����</th>
	                    <th>�ۼ���</th>
	                </tr>
	            </thead>
	    
	            <tbody>
	            
	            	<c:if test="${list[0] == null}">
	            		<tr>
	            			<td colspan="7"> �ۼ��� ����� �����ϴ�. </td>
	            		</tr>
	           		</c:if>
	            
	            	<c:set var="i" value="0"/>
	            	<c:forEach var="comment" items="${list}">
	            		<c:set var="i" value="${i+1}"/>
	            		
	            		<tr>
		                    <td>${ i }</td>
		                    <%-- <td class="getCommunityLink">${comment.commentComuNo}</td> --%>
		                    <td class="getCommunityLink">${stringList[i-1]}</td>
		                    <td class="getCommunityLink" data-param="${comment.commentComuNo}">${comment.commentDetail}</td>
		                    <td>${comment.commentDate}</td>
		                </tr>
	            		
	            	</c:forEach>
	            </tbody>
        	</table>
			<!-- ���̺� ����Ʈ : end -->
		</div>
		
		<!-- PageNavigation : start -->
		<jsp:include page="/common/pageNavigator.jsp" />
		<!-- PageNavigation : end -->
	
	
	
	</div>

</body>
</html>