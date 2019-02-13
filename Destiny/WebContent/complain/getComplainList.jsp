<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 
<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">

		function fncGetList(currentPage){
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/complain/listComplain").submit();
		}
		
		$(function (){
			$("button:contains('����')").on("click", function(){
				var complainNo = $(this).data("param");
				self.location = "/complain/getComplain?complainNo="+complainNo;
			});
		});
		
		</script>
	<!-- //All js -->
	
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
	
		.topImg{
			max-width : 100%;
			height : 400px;
			background-image : url("/resources/images/background/complainbg.jpg");
			background-position : center center;
			background-size : cover;
			background-repeat : no-repeat;
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
			line-height : 450px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		/* .wrap{
			margin-top : 400px;
		} */
		
		li{
			list-style-type : none;
		}
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -180px;
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
		
		table{border-collapse:collapse; table-layout:fixed;}
		.table-type01{width:100%;}
		.table-type01 thead tr th{position:relative; padding:13px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
		.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
		.table-type01 thead tr th:first-child:before{display:none;}
		.table-type01 tbody tr td{padding:13px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}
	
	
	</style>
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>�Ű���<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<!-- ������ ���� �׺���̼� ��� : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>�Ű��� ����</li>
			</ul>
			<!-- ������ ���� �׺���̼� ��� : end -->
		
			<!-- <div class="col-md-5"> -->
			<div class="6u$">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    <!-- <hr class="major"> -->
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">

				<div>
					<!-- <table class="row-table"> -->
					<table class="table-type01">
						
						<colgroup>
							<col style="width:5%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:15%;">
						</colgroup>
						
						<thead>
							<tr>
								<th>No</th>
								<th>�Ű���</th>
								<th>�Ű�����</th>
								<th>�Ű�¥</th>
								<th>ó������</th>
								<th>���</th>
								
							</tr>
						</thead>
						
						<tbody>
							<c:set var="i" value="0"/>
							<c:forEach var="complain" items="${list}">
								<c:set var="i" value="${i+1}"/>
								
								<tr>
									<td>${i}</td>
									<td>
										<span class="getComplain">${complain.complainerId }</span>
									</td>
									<td>
										<c:if test="${complain.complainKind == 'BD'}">
											<span>�Խù�</span>
										</c:if>
										<c:if test="${complain.complainKind == 'MT'}">
											<span>����</span>
										</c:if>
									</td>
									<td>
										<span>${complain.complainDate }</span>
									</td>
									<td>
										<c:if test="${complain.complainState=='N'}">
											<span>���</span>
										</c:if>
										<c:if test="${complain.complainState=='Y'}">
											<span>�Ϸ�
												<c:if test="${complain.complainCondition == 'NOT'}">(����)</c:if>
												<c:if test="${complain.complainCondition == 'WAR'}">(���)</c:if>
												<c:if test="${complain.complainCondition == 'BLK'}">(������Ʈ)</c:if>
											</span>
										</c:if>
									</td>
									<td>
										<button type="button" class="btn btn-default btn-mg" data-param="${complain.complainNo}">����</button>
									</td>
								</tr>
							
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>