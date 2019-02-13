<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
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
	$(function() {	
		var communityNo = ${community.communityNo};
		console.log(communityNo);
		var meetingNo = ${meeting.meetingNo};
		console.log(meetingNo);
		
		$( "a[name='save']").on("click" , function() {
			if(communityNo != 0){
				$("form").attr("method" , "POST").attr("action" , "/info/listRestaurantInfo").submit();
			}else if(meetingNo != 0){
				$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting").submit();
			}
			
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
			display : block;
			position : absolute;
			top : 0;
			background-image : url("/resources/images/background/complainbg.jpg");
			background-repeat : no-repeat;
			background-position : center -280px;
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
		.wrap{
			margin-top : 400px;
		}
		
		li{
			list-style-type : none;
		}
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -30px;
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
		
		section.wrapper, article.wrapper {
	    	padding: 500px 0;
		}
	
	</style>


</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>신고<span class="slim">확인</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->

	<!-- contents -->
	
	<section id="main" class="wrapper">
		<div class="inner">
			<form class="form-horizontal">
				<div>
					<table class="row-table">
						<caption>테이블 설명</caption>
						
							<colgroup>
								<col style="width:20%;">
								<col style="width:30%;">
								<col style="width:20%;">
								<col style="width:30%;">
							</colgroup>
						
						<thead class="hide">
							<tr>
								<th>구분</th>
								<td>내용</td>
							</tr>
						</thead>
						
						<tbody>
							
							<tr>
								<th>신고자</th>
								<td>
									<div class="6u$ 12u$(small)"  name="complainType"> ${me.userId}</div>
								</td>
								
								<th>작성자</th>
								<c:if test="${community.communityNo != 0}">
									<td>
										<div class="6u$ 12u$(small)"  name="complainType"> ${community.writerId} </div>
									</td>
								</c:if>
								<c:if test="${meeting.meetingNo != 0}">
									<td>
										<div class="6u$ 12u$(small)"  name="complainType"> ${meeting.meetingMasterId} </div>
									</td>
								</c:if>
							</tr>
							
							<tr>
								<c:if test="${community.communityNo != 0}">
									<th>제목</th>
								</c:if>
								<c:if test="${meeting.meetingNo != 0}">
									<th>제목</th>
								</c:if>
								<td colspan="3">
									<div class="6u$ 12u$(small)"   name="complainDetail"> ${complain.complainDetail} </div>
								</td>
							</tr>
							
							<tr>
								<th>신고사유</th>
								<td colspan="3">
									<div class="6u$ 12u$(small)">
										<c:if test="${complain.complainType == 'FKU'}"> 욕설/비방 </c:if>
										<c:if test="${complain.complainType == 'SEX'}"> 음란 </c:if>
										<c:if test="${complain.complainType == 'ADV'}"> 스팸/광고 </c:if>
										<c:if test="${complain.complainType == 'ETC'}"> 기타 </c:if>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>신고내용</th>
								<td colspan="3">
									<div class="6u$ 12u$(small)">${complain.complainText}</div>
								</td>
							</tr>
						</tbody>
					</table>
					
					<ul class="actions align-center">
						<li><a href="#" class="button special" name="save">확인</a></li>
					</ul>
					
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