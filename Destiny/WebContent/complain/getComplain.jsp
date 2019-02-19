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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type="text/javascript">
	$(function() {
		
		$( "#okBtn" ).on("click" , function() {
			history.go(-1);
		});
		
		$( "#okBtn" ).on("click" , function() {
			self.location = "/complain/listComplain"
		});
		
		$( "#doComplainBtn" ).on("click", function(){
			var complainNo = ${complain.complainNo}
			console.log(complainNo);
		  		
		  	var displayValue= '<div class="row uniform">\n'
			  		+'<div class="4u 6u$(small)"  id="complainCondition">\n'
			  		+'<input type="radio" class="complainCondition" name="complainCondition" id="NOT" value="NOT">\n'
			  		+'<label for="NOT">무고</label>\n'
			  		+'</div>\n'
			  		+'<div class="4u 6u$(small)">\n'
			  		+'<input type="radio" class="complainCondition" name="complainCondition" id="WAR" value="WAR">\n'
			  		+'<label for="WAR">경고</label>\n'
			  		+'</div>\n'
			  		+'<div class="4u 6u$(small)">\n'
			  		+'<input type="radio" class="complainCondition" name="complainCondition" id="BLK" value="BLK">\n'
			  		+'<label for="BLK">블랙리스트</label>\n'
			  		+'</div>\n'
		  		+'</div>\n'
		  		+'</div>\n'
		  		+'<hr class="major" />\n'
		  		+'<div class="form-group text-center">\n'	
		  		+'<ul class="actions align-center">\n'
		  		+'<li><a href="#" class="button" onClick="okComplainBtn()" id="endBtn">확인</a></li>'
		  		+'</ul>\n'
		  		
		  	$('.doComplain').append(displayValue);
		  	$('#doComplainBtn').hide();
		  	$('#okBtn').hide();
	  		
		});
	});
	

	function okComplainBtn(){
		
		var complainNo = ${complain.complainNo}
		console.log('okComplainBtn : ' + complainNo);
		var complainCondition = '';
		
		complainCondition = $('.complainCondition:checked').val()
		console.log('complainCondition : ' + complainCondition);
		
		$.ajax(
				{
			method : "GET",
			/* url : '/complain/json/updateComplain/'+complainNo+'/'+complainCondition, */
			url : '/complain/json/updateComplain/'+complainNo+'/'+complainCondition,
			success : function(JSONData){
				var complainState = JSONData.complainState;
				var complainCondition = JSONData.complainCondition;
				
				$('#complainState').html("${complainState=='Y' ? '신고처리 대기중':'신고처리 완료'}");
				
				if(complainCondition=="NOT"){
					$('#complainState').append(' ( 무고 )');
				}else if(complainCondition=="WAR"){
					$('#complainState').append(' ( 경고 )');
				}else if(complainCondition=="BLK"){
					$('#complainState').append(' ( 블랙리스트 )');
				}
				
				$('.doComplain').hide();
				$('#endBtn').hide();
				$('#okBtn').show();
				history.go(0);
			}
		});
	}
	
	$(function() {
		
		/* 글 제목 마우스 오버 : start */
		$(".getComplainLink").on("mouseover",function(){
			$(".getComplainLink").css("cursor","pointer")
		});
		/* 글 제목 마우스 오버 : end */
		
		/* 글 제목 클릭 : start */
		$(".getComplainLink").on("click", function(){
			var communityNo = $(this).data("param");
			var meetingNo = $(this).data("param1");
			
			if(meetingNo == null){
				/* if(${community.category == "RES"}){
					self.location="/info/getRestaurantInfo?communityNo="+communityNo
				}  */
				
				self.location="/info/getRestaurantInfo?communityNo="+communityNo


				
			}else if(communityNo == null){
				self.location="/meeting/getMeeting?meetingNo="+meetingNo
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
			background-position : center center;
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
		    position: absolute;
		    line-height: 330px;
		    width: 100%;
		    text-align: center;
		    color: white;
		    z-index: 99;
		    font-size: 60px;	
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		.wrap {
		    max-width: 1440px;
		    margin-top: 400px;
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
		
		.form-control { -webkit-appearance: menulist;}
		/* sweetalert buttom design^^ */
		.swal-button{
			padding : 0 56px;
			color : rgba(0,0,0,.65) !important;
		}
		
		.form{
			width: 80%; margin:0 auto;
		}
	
	</style>


</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>신고함<span class="slim">관리</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->

	<!-- contents -->
	
	<div class="container">
	
		<div class="wrap">
		
			<!-- 페이지 내부 네비게이션 경로 : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>신고함관리</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
			
			
			<div class="form" style="clear:both;">
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
								<c:if test="${complain.complainState=='N'}">
									<tr>
										<th>신고처리상태</th>
										<td colspan="3">
											<div class="6u$ 12u$(small)" name="complainState" id="complainState">
											 	${complain.complainState=='N' ? "대기중":"처리 완료"}
											 </div>
										</td>
									</tr>
								</c:if>
								
								<c:if test="${complain.complainState=='Y'}">
								<tr>
									<th>신고처리상태</th>
									<td>
										<div class="4u$ 12u$(small)" name="complainState" id="complainState">
										 	${complain.complainState=='N' ? "대기중":"처리 완료"}
										 </div>
									</td>
										<th>신고</th>
										<div class="4u$ 12u$(small)" name="complainCondition" id="complainCondition">
												<c:if test="${complain.complainCondition=='NOT'}"><td>무고</td></c:if>
												<c:if test="${complain.complainCondition=='WAR'}"><td>경고</td></c:if>
												<c:if test="${complain.complainCondition=='BLK'}"><td>블랙리스트</td></c:if>
										 </div>
								</tr>
								</c:if>
								
								<tr>
									<th>신고자</th>
									<td>
										<div class="6u$ 12u$(small)"  name="complainType"> ${complain.complainerId}</div>
									</td>
									
									<th>작성자</th>
									<td colspan="3">
										<div class="6u$ 12u$(small)"  name="complainType" id="complainType"> ${complain.defendantId}</div>
										<div class="6u$ 12u$(small)"  name="complainType" id="complainType">&nbsp;&nbsp;&nbsp; ( 경고 ${user.warningCount}회  )</div>
									</td>
								</tr>
								
								<tr>
									<th>신고날짜</th>
									<td colspan="3">
										<div class="6u$ 12u$(small)" name="complainDate"> ${complain.complainDate}  </div>
									</td>
								</tr>
								
								<tr>
									<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
									<c:if test="${complain.complainKind == 'BD'}">
								  		<th>제목</th>
								  		<td colspan="3">
									  		<div class="6u$ 12u$(small)" name="complainDetail" data-param="${complain.communityNo}" > 
									  			<a href="/info/getRestaurantInfo?communityNo=${complain.communityNo}" target=“_blank”>${complain.complainDetail}</a>
									  		</div>
								  		</td>
									</c:if>
									<c:if test="${complain.complainKind == 'MT'}">
								  		<th>모임이름</th>
								  		<td colspan="3">
									  		<div class="6u$ 12u$(small) getComplainLink" name="complainDetail" data-param="${complain.meetingNo}">
									  		 	<a href="/meeting/getMeeting?meetingNo=${complain.meetingNo}" target=“_blank”>${complain.complainDetail}</a>
									  		</div>
								  		</td>
									</c:if>
								</tr>
								
								<tr>
									<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
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
									<%-- 게시글:제목 / 댓글:내용 / 모임:모임명 --%>
							  		<th>신고내용</th>
							  		<td colspan="3">
										<div class="6u$ 12u$(small)">${complain.complainText}</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="doComplain"></div>
						
						<ul class="actions align-center">
							<div class="form-group text-center">
								<c:if test="${complain.complainState=='N'}">
									<li><a href="#" class="button" id="okBtn">확인</a></li>
									<li><a href="#" class="button" id="doComplainBtn">신고처리</a></li>
								</c:if>
								<c:if test="${complain.complainState=='Y'}">
									<li><a href="#" class="button" id="okBtn">확인</a></li>
								</c:if>
							</div>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>