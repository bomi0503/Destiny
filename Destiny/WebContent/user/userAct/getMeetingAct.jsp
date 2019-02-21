<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>

	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="/resources/css/main.css" >
	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

	
	<script>
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getMeetingAct/${contextMeeting.meetingNo}").submit();
		}
		
		 $(function() {
			
			//==> 모임원 보기
			$(".getActCrew").on("click", function(){
				var meetingActNo = $(this).data("param");
				var meetingActCount = $(this).data("param1");
				var meetingNo = $(this).data("param2");
				self.location = "/act/getActCrew/"+meetingActNo+"/"+meetingActCount+"/"+meetingNo;
				
			});
			
			//==>리뷰 작성
			$(".writeStoryButton").on("click", function(){
				self.location = "/act/addStoryView/MET/"+$(this).data("param");
			});
			
			//==> 해당모임 이동
			$('.getMeetingLink').on("click", function(){
				self.location ="/meeting/getMeeting?meetingNo="+$(this).data("param");
			})
			 
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
			background-image : url("/resources/images/background/loveAdvice_background.jpg");
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
			width : 100%;
			margin : 0;
			padding : 0;
			font-family: 'Nanum Myeongjo', serif;
			font-size : 60px;
			text-align : center;
			height : 400px;
			line-height : 450px;
			color : white;
			z-index : 99;
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		
		li{
			list-style-type : none;
		}
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -70px;
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
		
		button{padding: 0 2em;}
		td>img{width: 100%; height: auto; margin: 1em auto;}
		.close {width: 35px; height: 30px; text-shadow: 0 1px 0 #ffdfe5;}
		.box {margin: 6em 0 3em 0;}
		.meetingTable{margin-top:5em;}
		.getMeetingLink{cursor:pointer;}
		/* table sytle 추가 */
		table{border-collapse:collapse; table-layout:fixed; margin-top:20px;}
		.table-type01{width:100%;}
		.table-type01 thead tr th{position:relative; padding:10px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
		.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
		.table-type01 thead tr th:first-child:before{display:none;}
		.table-type01 tbody tr td{padding:10px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}
		/* table sytle 추가 */
		
		.getMeetingLink{display:inline-block; box-sizing:border-box; vertical-align:middle; width:100px; height:40px; text-align:center; line-height:38px; border:1px solid #666; border-radius:30px; margin-left:15px; color:#000; transition:background 0.35s, color 0.35s;}
		.getMeetingLink:hover{background:#000; color:#FFF;}
	</style>
	

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>모임 회차 <span class="slim">조회</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
			<!-- 페이지 내부 네비게이션 경로 : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>마이페이지</li>
				<li>></li>
				<li>모임 회차조회</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
			
			
			<div class="row">
				<div class="meetingTable">
					<table class="row-table tablebm">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col>
						</colgroup>
						
						<tbody>
							<tr>
								<th>모임명</th>
								<td>${contextMeeting.meetingName} <a href="#" class="getMeetingLink" data-param="${contextMeeting.meetingNo}">이동</a></td>
								<td rowspan="5" class="img-td">
									<img src="/resources/images/meeting/${contextMeeting.titleImg}" width="550px" height="500px"/>
								</td>
							</tr>
							<tr>
								<th>관심사</th>
								<td>${contextMeeting.interestName}</td>
							</tr>
							<tr>
								<th>장소</th>
								<td>${contextMeetingAct.meetingLocation}</td>
							</tr>
							<tr>
								<th>날짜 / 시간</th>
								<td>${contextMeetingAct.meetingDate} / ${contextMeetingAct.meetingTime}</td>
							</tr>
							<tr>
								<th>모임정원</th>
								<td>${contextMeeting.meetingCrewLimit}명</td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div>
			
			<!-- /////차트 jsp//////////////////////////////////////////////////// -->
			<c:if test="${me.userId eq contextMeeting.meetingMasterId}">
				<div class="box">
					<div class="row uniform">
						<!-- <div class="flex "> -->
					 		<div class="4u 12u(small)">
					 			
					 			<h4>모임 회원들의 상위 관심사 top5</h4>
					 			<canvas id="myChart" width="400" height="400"></canvas>
								<script>
								var ctx = document.getElementById("myChart").getContext('2d');
								var myChart = new Chart(ctx, {
								    type: 'pie',
								    data: {
								        labels: ["${fiveTOPInerest[0]}", "${fiveTOPInerest[1]}", "${fiveTOPInerest[2]}", "${fiveTOPInerest[3]}", "${fiveTOPInerest[4]}"],
								        datasets: [{
								            label: '# of Votes',
								            data: [${fiveTOP[0]}, ${fiveTOP[1]}, ${fiveTOP[2]}, ${fiveTOP[3]}, ${fiveTOP[4]}],
								            backgroundColor: [
								                'rgba(255, 99, 132, 0.2)',
								                'rgba(54, 162, 235, 0.2)',
								                'rgba(255, 206, 86, 0.2)',
								                'rgba(75, 192, 192, 0.2)',
								                'rgba(153, 102, 255, 0.2)'
								            ],
								            borderColor: [
								                'rgba(255,99,132,1)',
								                'rgba(54, 162, 235, 1)',
								                'rgba(255, 206, 86, 1)',
								                'rgba(75, 192, 192, 1)',
								                'rgba(153, 102, 255, 1)'
								            ],
								            borderWidth: 1
								        }]
								    },
								    options: {
								        scales: {
								            yAxes: [{
								                ticks: {
								                    beginAtZero:true
								                }
								            }]
								        }
								    }
								});
								</script>
							</div>
							
							<div class="4u 12u(small)">	
								<h4>모임 회원들의 성비</h4>
					 			<canvas id="myChart2" width="400" height="400"></canvas>
								<script>
								var ctx = document.getElementById("myChart2").getContext('2d');
								var myChart = new Chart(ctx, {
								    type: 'doughnut',
								    data: {
								        labels: ["남성", "여성"],
								        datasets: [{
								            label: '# of Votes',
								            data: [${maleNum}, ${femaleNum}],
								            backgroundColor: [
								                'rgba(255, 99, 132, 0.2)',
								                'rgba(54, 162, 235, 0.2)'
								            ],
								            borderColor: [
								                'rgba(255,99,132,1)',
								                'rgba(54, 162, 235, 1)'
								            ],
								            borderWidth: 1
								        }]
								    },
								    options: {
								        scales: {
								            yAxes: [{
								                ticks: {
								                    beginAtZero:true
								                }
								            }]
								        }
								    }
								});
								</script>
							</div>
								
							<div class="4u 12u(small)">
								<h4>모임 회원들의 연령대</h4>
					 			<canvas id="myChart3" width="400" height="400"></canvas>
								<script>
								var ctx = document.getElementById("myChart3").getContext('2d');
								var myChart = new Chart(ctx, {
								    type: 'bar',
								    data: {
								        labels: ["20~24", "25~29", "30~34", "35~39", "40~"],
								        datasets: [{
								            label: '# of Votes',
								            data: [${firstGeneration}, ${secondGeneration}, ${thirdGeneration}, ${fourthGeneration}, ${fifthGeneration}],
								            backgroundColor: [
								                'rgba(255, 99, 132, 0.2)',
								                'rgba(54, 162, 235, 0.2)',
								                'rgba(255, 206, 86, 0.2)',
								                'rgba(75, 192, 192, 0.2)',
								                'rgba(153, 102, 255, 0.2)'
								            ],
								            borderColor: [
								                'rgba(255,99,132,1)',
								                'rgba(54, 162, 235, 1)',
								                'rgba(255, 206, 86, 1)',
								                'rgba(75, 192, 192, 1)',
								                'rgba(153, 102, 255, 1)'
								            ],
								            borderWidth: 1
								        }]
								    },
								    options: {
								        scales: {
								            yAxes: [{
								                ticks: {
								                    beginAtZero:false
								                }
								            }]
								        }
								    }
								});
								</script>
							</div>
						<!-- </div> -->
					</div>
				</div>
			</c:if>
			<!-- /////차트 jsp//////////////////////////////////////////////////// -->
			
			<hr/>
			
			<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			  <div class="row">
	    
				<div class="6u text-left">
					<p class="text-primary">
						전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
					</p>
				</div>
				
				<div class="6u text-right">
					<form class="form-inline" name="detailForm">
					
					
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					</form>
				</div>
				
			</div>
			<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			
			<!-- 테이블 리스트 : start -->
			<table class="table-type01">
	            <colgroup>
	                <col style="width:10%">
	                <col style="width:15%">
	                <col style="width:15%">
	                <col style="width:30%">
	                <col style="width:15%">
	                <col style="width:15%">
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>회차</th>
	                    <th>모임 날짜</th>
	                    <th>모임 시간</th>
	                    <th>장소</th>
	                    <th>모임원</th>
	                    <th>리뷰작성</th>
	                </tr>
	            </thead>
	    
	            <tbody>
	            
	            	<c:if test="${list[0] == null}">
	            		<tr>
	            			<td colspan="6"> 참여한 모임 회차가 없습니다. </td>
	            		</tr>
	           		</c:if>
	           		
	           		<c:if test="${list[0] != null }">
	            
	            	<c:set var="i" value="0"/>
	            	<c:forEach var="meeting" items="${list}">
	            		<c:set var="i" value="${i+1}"/>
	            		<tr>
		                    <td>${meeting.meetingActCount}회</td>
		                    <td>${meeting.meetingDate}</td>
		                    <td>${meeting.meetingTime}</td>
		                    <td>${meeting.meetingLocation}</td>
		                    <td>	
		                    	<button type="button" data-toggle="modal" data-target="#${meeting.meetingNo}modal">보기</button>
		                    </td>
		                    <td>
		                    	<button type="button" class="writeStoryButton" id="writeStoryButton" data-param="${meeting.meetingNo}">작성</button>
		                    </td>
		                </tr>
		                
		                <!-- Modal -->
						<div class="modal fade" id="${meeting.meetingNo}modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel"> [ 모임 ${meeting.meetingActCount}회차에 참여한 회원 ]</h4>
						      </div>
						      <style>
						      .fix:after{content:''; clear:both; display:block;}
						      .modal-body{float:left; width:33.333%; text-align:center;}
						      .modal-body img{max-width:150px; width:100%; max-height:150px;}
						      
						      </style>
						      <c:if test="${i != meeting.meetingActCount }">
							   <c:set var="i" value="${i+1}"/>
							  </c:if>
						      <div class="fix">
							      <c:if test="${i == meeting.meetingActCount }">
									  <c:forEach var="user" items="${actCrewList[i-1]}">								
										
										<div class="modal-body">
											<img src="/resources/images/userprofile/${user.profile}">
											<p>${user.userId}</p>
										</div>
									  </c:forEach>
								  </c:if>
							  </div>
						      <div class="modal-footer">
						        <button type="button" class="button" data-dismiss="modal">확인</button>
						        <!-- <button type="button" class="button special">확인</button> -->
						      </div>
						    </div>
						  </div>
						</div>
						<!-- Modal -->
	            		
	            	</c:forEach>
	            	</c:if>
	            </tbody>
        	</table>
			<!-- 테이블 리스트 : end -->
			
			<!-- PageNavigation Start... -->
			<jsp:include page="/common/pageNavigator.jsp"/>
			<!-- PageNavigation End... -->
		
		</div>
	</div>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>