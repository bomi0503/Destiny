<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>우연</title>
<!-- All CSS Insert -->

<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">


	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c&libraries=services"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script ><!-- sweetAlert -->

	
	
	<!-- Bootstrap core CSS -->

    
   <!-- 케러셀 완료 -->

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	<link rel="stylesheet" href="/resources/css/main.css" > <!-- 우연메인 -->	
	
	 <style>
	 body {
	 	background-color: #fff;
	 	
	 }
	 
	 #one{
	 	padding: 0;
	 }
	 
	 #lol{
	 	/* margin-top: 350px; */
	 }
	 /* 폰트 설정 관련 */
	 .titleName{
	 	font-family: 'Gamja Flower', cursive;
	 	font-size: 50px;
	 }
	 .meetingCenter{
	 	color: #fd5d7c;
	 	margin-bottom: -15px;
	 	font-size: 20px;
	 }
	 
	/*  메인백그라운드 */
	 	#loading {
		 width: 100%;  
		 height: 100%;  
		 top: 0px;
		 left: 0px;
		 position: fixed;  
		 display: block;  
		 opacity: 0.7;  
		 background-color: #fff;  
		 z-index: 99;  
		 text-align: center; 
	} 
	  
	#loading-image {  
		 position: absolute;  
		 top: 50%;  
		 left: 50%; 
		 z-index: 100; 
	}
	.representImg{
		margin-top : 1em;
		width : 25%;
		height : 20em;
		padding : 1em;
		text-align : center;
		border : 1px solid #a9a9a9;
		border-radius : 5px;
	}
	.representImg img{
		width : 80%;
	}
	/* .topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/meetingbg.jpg");
		background-repeat : no-repeat;
		background-position : center -400px;
		background-size : cover;
		width : 100%;
		height : 400px;
	} */
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/meetingbg.jpg");
		background-position : center center;
		background-size : cover;
		background-repeat : no-repeat;
	}
	.topImg::before{
		content : "";
		background : rgba(0, 0, 0, 0.2);
		position : absolute;
		top : 0;
		left : 0;
		width : 100%;
		height : 400px;
	}
	/* .topImg h1{
		position : absolute;
		line-height : 330px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
	} */
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
	h1 .slim{font-weight : lighter;}
	
	.smallNavi{
		overflow : hidden;
		float : right;
	}
	
	.smallNavi li{
		float : left;
	}
	.updateForm{
		padding : 25em 0 10em 0;
	}
	
	
	 /*  메인백그라운드 끝! */
	 
	 
	 
	/* 반응형 미디어쿼리 */
	 @media screen and (max-width:1680px){
		.wrapper.align-center {
			/* margin-bottom: 0 !important; */
			margin-top: 5% !important;
			
		}
		.align-center.search{
			margin-top: 10% !important;
		}
	} 	
	</style>
	
	
	<script>
	
	$(function(){
		getLocation();
		var startNo = 1
		/* 
		$(function(){
			 $(window).scroll(function(){

                var window = $(this);

                var scrollTop = window.scrollTop();

                var windowHeight = window.height();

                var documentHeight = $(document).height();

                // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
                
                //console.log("다큐멘트길이 = "+documentHeight);
                //console.log("스크롤탑 + 윈도우 길이 + 200 = "+scrollTop + windowHeight);

                if( scrollTop + windowHeight + 150 > documentHeight ){

							fetchList();
                }

       	})
       	
       	function fetchList(){
				 
				 startNo +=${resultPage.getCurrentPage()}

				 //console.log(startNo);
				 //fncGetProductList(startNo);
 
       		  $.ajax({

                    url:"/meetingRest/listMeeting?startNo="+startNo,

            
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							console.log(JSONData.list);
							
							var list="";
							for(i in JSONData.list){
								var meeting = JSONData.list[i];
								if(i%2==0){
									//console.log("1입니다요.");
									list+="<article class='feature left' style='float: right; margin-bottom: 20px;'>";
									list+="<div class='image' style='display: flex; width:600px; height: 400px;float: right;'><img src='/resources/images/meeting/"+meeting.titleImg+"' style='border-radius: 55px;' class='6u 12u(small)' /></div>";
									list+="<div class='' style='float: left; margin-left: 10px;text-align: end;'>";
								    list+="<p class='meetingCenter' style='margin-top: 80px;margin-bottom: -50px;'><span class='glyphicon glyphicon-record'></span>&nbsp;"+meeting.meetingCenter+"<p>";
									list+="<h2 class='titleName' style='color:black; margin-bottom: -10px;'>"+meeting.meetingName+"</h2>";
									list+="<p>모임정원 <span class='meetingCenter'>"+meeting.meetingCrewLimit+"</span>명      조회수<span class='meetingCenter'> "+meeting.meetingViews+"</span>회</p>";
									list+="<p>모임날짜:"+meeting.meetingDate+"&nbsp; &nbsp;<span class='glyphicon glyphicon-map-marker'></span>"+meeting.meetingLocation+"</p>";
									list+="<ul class='actions'>";
									list+="<li>";
									list+="<a href='#' id='reMore' data-param='"+meeting.meetingNo+"' class='button' style='margin-top: 20px;'>More</a>";
									list+="</li>";
									list+="</ul>";
									list+="</div>";
									list+="</article>";
								}else{
									//console.log("2입니다.");
									
									
									list+="<article class='' style='float: left; margin-bottom: 20px;'>";
									list+="<div class='image' style='display: flex; width:600px; height: 400px;float: left;'><img src='/resources/images/meeting/"+meeting.titleImg+"' style='border-radius: 55px;' class='6u 12u(small)' /></div>";
									list+="<div class='' style='float: left; margin-left: 10px;text-align: left;'>";
								    list+="<p class='' style='margin-top: 80px;margin-bottom: -50px;'><span class='glyphicon glyphicon-record'></span>&nbsp;"+meeting.meetingCenter+"<p>";
									list+="<h2 class='titleName' style='color:black; margin-bottom: -10px;'>"+meeting.meetingName+"</h2>";
									list+="<p>모임정원 <span class='meetingCenter'>"+meeting.meetingCrewLimit+"</span>명      조회수<span class='meetingCenter'> "+meeting.meetingViews+"</span>회</p>";
									list+="<p>모임날짜:"+meeting.meetingDate+"&nbsp; &nbsp;<span class='glyphicon glyphicon-map-marker'></span>"+meeting.meetingLocation+"</p>";
									list+="<ul class='actions'>";
									list+="<li>";
									list+="<a href='#' id='reMore' data-param='"+meeting.meetingNo+"' class='button' style='margin-top: 20px;'>More</a>";
									list+="</li>";
									list+="</ul>";
									list+="</div>";
									list+="</article>";
								}
								//console.log(product.fileName);
								/* 
								list+="<article class='feature left'>";
								list+="<div class='image' style='display: flex; height: 400px;'><img src='/resources/images/meeting/"+meeting.titleImg+"' style='border-radius: 55px;' class='col-xs-12 col-sm-12 col-md-12' /></div>";
								list+="<div class='content'>";
							    list+="<p class='meetingCenter'><span class='glyphicon glyphicon-record'></span>&nbsp;"+meeting.meetingCenter+"<p>";
								list+="<h2 class='titleName'>"+meeting.meetingName+"</h2>";
								list+="<p>모임정원 <span class='meetingCenter'>"+meeting.meetingCrewLimit+"</span>명      조회수<span class='meetingCenter'> "+meeting.meetingViews+"</span>회</p>";
								list+="<p>모임날짜:"+meeting.meetingDate+"&nbsp; &nbsp;<span class='glyphicon glyphicon-map-marker'></span>"+meeting.meetingLocation+"</p>";
								list+="<ul class='actions'>";
								list+="<li>";
								list+="<a href='#' id='reMore' data-param='"+meeting.meetingNo+"' class='button'>More</a>";
								list+="</li>";
								list+="</ul>";
								list+="</div>";
								list+="</article>";
								
							}
							$( "#one" ).append(list);
						 
						}
				});	
	       		  
	       	} //fetchList끝 //여기까지 무한스크롤
		});
		 */
		function getLocation() {
			//alert("로케이션 시작");
		  if (navigator.geolocation) { // GPS를 지원하면
		    navigator.geolocation.getCurrentPosition(function(position) {
		      //alert(position.coords.latitude + ' ' + position.coords.longitude);
		      findaddress(position.coords.latitude, position.coords.longitude);
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
		}
		//getLocation();
		
		// 지오에서 받은거 주소로 변환
		function findaddress(locationY,locationX){
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
		    // 좌표로 행정동 주소 정보를 요청합니다
		    var address = geocoder.coord2RegionCode(locationX, locationY, searchAddrFromCoords);  
		}

		function searchAddrFromCoords(result, status) {
			if (status === daum.maps.services.Status.OK) {
				//console.log(result[0].region_2depth_name);
				var address = result[0].region_2depth_name;
				//alert(address);
				$.ajax({

                    url:"/meetingRest/nearMeeting?address="+address,
						method : "get" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" :  "application/json"
						},
						success : function(JSONData , status) {
							//console.log(JSONData.bestList);
							
							var list="";
							for(i in JSONData.bestList){
								var meeting = JSONData.bestList[i];
								//list+="<section id='linkmove' class='wrapper align-center'>";
								//list+="<div class='inner'>";
								//list+="<div id='frogue-container' class='position-right-bottom'data-color='#555a9c'data-chatbot='b9ca3ac0-61fd-496b-831f-3906f84fbb90'data-user='b9ca3ac0-61fd-496b-831f-3906f84fbb90'data-init-key='value'></div>";
								//list+="<div class='flex secondSection'>";
								list+="<div class='move_meeting'>";
								list+="<span onclick='gotoMeeting("+meeting.meetingNo+")'><img style='width: 350px; height: 350px; border-radius:30px' src='/resources/images/meeting/"+meeting.titleImg+"'></span>";
								list+="<p onclick='gotoMeeting("+meeting.meetingNo+")'>"+meeting.meetingCenter+"</p>";
								list+="<h3 onclick='gotoMeeting("+meeting.meetingNo+")'>"+meeting.meetingName+"</h3>";
								list+="</div>";
								//list+="</div>";
								//list+="</div>";
								//list+="</section>";
							}
							$( "#secondSection" ).empty().append(list);
						 
						}
				});	
			}
		}

		
		// 내 주변 모임 찾기 스타트
		$( "#nearMeeting" ).on("click", function() {
			getLocation();
		});
		
		// 개설하기 누르면 이벤트 처리
		
		$( ".addMeeting" ).on("click", function() {
			console.log("${empty sessionScope.me}");
			//getLocation();
		
			if('${sessionScope.me.userGrade }' !='NEW' && ${!empty sessionScope.me.userId}){
				//alert("성공");
				self.location="/meeting/addMeeting"
			}else if('${empty sessionScope.me}'=='true'){
				/* if (confirm("로그인후이용가능합니다.\n로그인하시겠습니까?") == true){    //확인
					$("#my-dialog,#dialog-background").toggle();
					//self.location="/user/login";
				 }else{   //취소
				     return;
				 } */
				
				swal({
					  title: "로그인후이용가능합니다.로그인하시겠습니까?",
					  icon: "info",
					  buttons: true,
					  dangerMode: true,
					})
					.then(function(willDelete){
					  if (willDelete) {
						  $("#my-dialog,#dialog-background").toggle();
					  } else {
					    	return;
					  }
					});
			}else if('${sessionScope.me.userGrade }'=='NEW'){
				swal("${sessionScope.me.nickName}님은 우연등급입니다.\n인연이상 회원부터 개설 하능합니다.");
			}else{
				swal("이용 불가합니다.");
			}
		});
		 
		//more눌렀을때 이벤트 처리
		$("a[href='#' ]:contains('More')").on("click", function() {
			var meetingNo = $(this).data("param");
			//console.log("여기왔습니까??");
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		});
		
		$(document).on("click","#reMore",function(){
			var meetingNo = $(this).data("param");
			//console.log("리컨펌");
			//console.log($(this).data("param"));
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		});
		
		//시군구 가져다 주는 애 
		$( "#centerLocation" ).on("change" , function() {
			//var idx = $(".brand_ids").index(this);
			var city=$(this).val();
			console.log(city);
			
			$.ajax( 
					{
						url : "/user/json/getLocationList/"+city,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							
							var list="";
							list+="<select  id='centering' name='meetingCenter' class='form-control'>";
							list+="<option>시/군/구 선택</option>";
							for(i in JSONData.list){
								var town = JSONData.list[i].townName;
								
								list+="<option id='centerMeeting' name='searchCondition' data-param='$(this).value' value='"+town+"'>"+town+"</option>";
						}
							$( "#location" ).empty().append(list);
						}
				});
		});
		
		//검색어 이벤트 처리
		$( "#plzsearch" ).on("click" , function() {
   		 var meetingCenter=$("#centering").val();
   		 var seconCenter=$("#sconcentering").val();
   		 var interest=$("#interest").val();
   		 console.log(meetingCenter);
   		 console.log(interest);
   		 console.log(seconCenter);
   		 if(interest=='관심사'){
   			 $("#interest").val("");
   		 }
   		 if(meetingCenter=="" || seconCenter==""){
   			 //alert("모임인원을 설정하여 주세요.");
   			 meetingCenter="아님";
   		 }
   		$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting/"+meetingCenter).submit();
		 });
		
	});
	
	function gotoMeeting(value){
		//console.log($("#todayss").index(this));
		//console.log(value);
		self.location="/meeting/getMeeting?meetingNo="+value;
		
	}
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->

	
		<div class="topImg">
			<h1>우리들의<span class="slim">모임</span></h1>
		</div>
		
		
        <section id="main" class="wrapper" style="margin-top: -100px;">	
		<div  class="landing">
		<div style="width:98%; margin-left:10px;">
        <form>
            <br/>
            <!-- 검색창 시작 -->
            <section class="align-center search">
            <div class="inner">

            		<div class="col-xs-12 col-sm-12 col-md-4">
	            		<input name="searchKeyword"  
	            		type="text" placeholder="검색어를 입력" style="width: 100%; height: 34px;"/>
            		</div>
            		<div class='search col-xs-12 col-sm-12 col-md-2'>
						<select id="centerLocation" class="form-control">
				 		<option>중심지역-지역</option>
				 		<option value="서울">서울</option>
		                <option value="경기">경기</option>
		                <option value="인천">인천</option>
		                <option value="부산">부산</option>
		                <option value="대구">대구</option>
		                <option value="광주">광주</option>
		                <option value="대전">대전</option>
		                <option value="울산">울산</option>
		                <option value="세종">세종</option>
		                <option value="강원">강원</option>
		                <option value="경남">경남</option>
		                <option value="경북">경북</option>
		                <option value="전남">전남</option>
		                <option value="전북">전북</option>
		                <option value="충남">충남</option>
		                <option value="충북">충북</option>
		                <option value="제주">제주</option>
				 	</select>
            		</div>
            		<div id="location" class='search col-xs-12 col-sm-12 col-md-2'>
						<input readonly="readonly" id="sconcentering" type="text" class="form-control" style="width: 100%; height: 34px;"> 
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2">
            			<select id="interest" name="searchSortingOption" class="form-control">
					 		<option >관심사</option>
					 		<c:forEach var="Meeting" items="${interlist}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2"><input type='button' id="plzsearch" class='sch_smit search-btn' value="찾기"></div>
			</div>
			</section>
		</form>	 
			 <!-- 검색창 종료 -->
			 
			 
		<%-- <c:if test="${!empty sessionScope.me=='true'}"> --%>
			<section style="margin-top: 5%">
				<div align="right" class="inner">
				 	<input type="button" class="addMeeting" value="개설하기">
				 	<!-- <input type="button" id="nearMeeting" value="내 주변 모임"> -->
				</div>
			</section>
			<!-- 내주변 추천모임 start -->
			<section id="linkmove" class="wrapper align-center" style="margin-top: -150px; margin-bottom: -50px">
				
				<div class="inner">
				<h2 style="margin-top: -1px;text-align: -webkit-auto;">내주변 추천모임</h2>
					<div id="frogue-container" class="position-right-bottom"
					      data-color="#555a9c"
					      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-init-key="value"
					      ></div>
					
					<div class="flex secondSection" id="secondSection">

					</div>
					
				</div>
			</section>
			<!-- 링크이동 end -->
			
			<!-- 오늘의 함께해요 start -->
			<section id="linkmove" class="wrapper align-center" style="margin-top: -150px; margin-bottom: -50px">
				
				
				
				<div class="inner">
				<h2 style="margin-top: -80px;text-align: -webkit-auto;">오늘의 함께해요</h2>
					<div id="frogue-container" class="position-right-bottom"
					      data-color="#555a9c"
					      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-init-key="value"
					      ></div>
					<div class="flex secondSection">
					<c:set var="i" value="0" />
				 	<c:forEach var="todays" items="${todaylist}">
				 	<c:set var="i" value="${ i+1 }" />
					
						<div class='move_meeting todayTogether' id="">
							<span onclick="gotoMeeting(${todays.meetingNo })"><img style='width: 350px; height: 350px; border-radius:30px' src='/resources/images/meeting/${todays.titleImg }'></span>
							<p class="meetingCenter" style="margin-top: 80px;margin-bottom: -50px;"><span class="glyphicon glyphicon-record"></span>&nbsp;${todays.meetingCenter}<p>
							<h2 class="titleName" style="color:black; margin-bottom: -10px;">${todays.meetingName}</h2>
							<p>모임정원  <span class="meetingCenter">${todays.meetingCrewLimit}</span>명      조회수 <span class="meetingCenter">${todays.meetingViews}</span>회</p>
							<ul class="actions">
							<li>
								<a href="#" data-param="${todays.meetingNo}" class="button" style="margin-top: 20px;">More</a>
							</li>
							</ul>
						</div>
						
					</c:forEach>
					<c:if test="${empty todaylist}">
						<span>등록된 모임이 없습니다.<input style="margin-left: 2%;" type="button" class="addMeeting" value="개설하기"></span>
					</c:if>
					</div>
					
					
				</div>
			</section>
			<!--오늘의 함께해요 end -->
			
			<!-- What's hot start -->
			<section id="linkmove" class="wrapper align-center" style="margin-top: -150px; margin-bottom: -50px">
				
				
				<div class="inner">
				<h2 style="margin-top: -80px;text-align: -webkit-auto;">What's hot</h2>
					<div id="frogue-container" class="position-right-bottom"
					      data-color="#555a9c"
					      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-init-key="value"
					      ></div>
					
					<div class="flex secondSection">
					<c:set var="i" value="0"/>
				 	<c:forEach var="hot" begin="0" end="2" step="1" items="${hotlist}">
				 	<c:set var="i" value="${ i+1 }" />
						<div class='move_meeting todayTogether' id="">
							<span onclick="gotoMeeting(${hot.meetingNo })"><img style='width: 350px; height: 350px; border-radius:30px' src='/resources/images/meeting/${hot.titleImg }'></span>
							<p class="meetingCenter" style="margin-top: 80px;margin-bottom: -50px;"><span class="glyphicon glyphicon-record"></span>&nbsp;${hot.meetingCenter}<p>
							<h2 class="titleName" style="color:black; margin-bottom: -10px;">${hot.meetingName}</h2>
							<p>모임정원  <span class="meetingCenter">${hot.meetingCrewLimit}</span>명      조회수 <span class="meetingCenter">${hot.meetingViews}</span>회</p>
							<ul class="actions">
							<li>
								<a href="#" data-param="${hot.meetingNo}" class="button" style="margin-top: 20px;">More</a>
							</li>
							</ul>
						</div>
					</c:forEach>
					<c:if test="${empty hotlist}">
						<span>등록된 모임이 없습니다.<input style="margin-left: 2%;" type="button" class="addMeeting" value="개설하기"></span>
					</c:if>
					
					</div>
					
				</div>
			</section>
			<!--What's hot end -->
			 
			 <!-- 리스트 시작 -->
			 <section id="linkmove" class="wrapper align-center" style="margin-top: -150px; margin-bottom: -50px">
				<div class="inner">
					<h2 style="margin-top: -80px;text-align: -webkit-auto;">모든 모임</h2>
					<div id="frogue-container" class="position-right-bottom"
					      data-color="#555a9c"
					      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-init-key="value"
					      ></div>
					
					<div class="flex secondSection">
					<c:set var="i" value="0" />
					<c:forEach var="meeting" items="${list}">
				    <c:set var="i" value="${ i+1 }" />
				    
				    
				    	<c:if test="${ i<=3 }">
						<div class='move_meeting todayTogether' style="margin-right: 2%;">
						</c:if>
						<c:if test="${ i>3 }">
							<div class='move_meeting todayTogether' style="display:none; margin-right: 2%;">
						</c:if>
						
						
							<span onclick="gotoMeeting(${meeting.meetingNo })"><img style='width: 350px; height: 350px; border-radius:30px' src='/resources/images/meeting/${meeting.titleImg }'></span>
							<p class="meetingCenter" style="margin-top: 80px;margin-bottom: -50px;"><span class="glyphicon glyphicon-record"></span>&nbsp;${meeting.meetingCenter}<p>
							<h2 class="titleName" style="color:black; margin-bottom: -10px;">${meeting.meetingName}</h2>
							<p>모임정원  <span class="meetingCenter">${meeting.meetingCrewLimit}</span>명      조회수 <span class="meetingCenter">${meeting.meetingViews}</span>회</p>
							<ul class="actions">
							<li>
								<a href="#" data-param="${meeting.meetingNo}" class="button" style="margin-top: 20px;">More</a>
							</li>
							</ul>
						</div>
					</c:forEach>
					
					<c:if test="${empty list}">
						<span>등록된 모임이 없습니다.<input style="margin-left: 2%;" type="button" id="addMeeting" value="개설하기"></span>
					</c:if>
					
					<c:if test="${fn:length(list) > 3}">
					<div class="12u">
						<button onclick="fnChangeDisplay(this)">모든모임 더보기 &gt;</button>
					</div>
					</c:if>
					</div>
					
				</div>
			</section>
			
			<script>
				function fnChangeDisplay(em) {
					$(".todayTogether").each(function(idx, e) {
						$(e).css("display", "");
					});
					$(em).css("display", "none");
					
				}
			</script>
    </div>
	</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	            
	
</body>
</html>