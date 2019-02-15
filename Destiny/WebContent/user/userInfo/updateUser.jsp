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
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
	//============= "수정"  Event 연결 =============
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "a[name='update']" ).on("click" , function() {
					fncUpdateUser();
				});
			});	
			
			
			//============= "취소"  Event 처리 및  연결 =============
			$(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("a[name='cancle']").on("click" , function() {
					history.go(-1);
				});
			});	
			
			//=============이메일" 유효성Check  Event 처리 =============
			 $(function() {
				 
				 $("input[name='email']").on("keyup" , function() {
						
					 var email=$("input[name='email']").val();
					 
					 $.ajax({
						 url : "/user/json/getUserByEmail/"+email,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 //alert(JSONData.user);
							 if(JSONData.user != null){
								 if(JSONData.user.email != JSONData.me.email){
									$('input[name="email"]').css('background-color','pink');
									$('#authnumWirte').text("이미 존재하는 이메일입니다.");
								 } else {
									$('input[name="email"]').css('background-color','white');
									$('#authnumWirte').text("");
								 }
								
							 } else {
					
								if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
									$('input[name="email"]').css('background-color','pink');
									$('#authnumWirte').text("이메일 형식이 아닙니다.");
								 } else {
									 $('input[name="email"]').css('background-color','rgb(207, 253, 170)');
									$('#authnumWirte').text("");
								 }
							 }
						 },
						error : function(what){
							
						}
					 });
				});
			});	
			
			//=============전화번호" 유효성Check  Event 처리 =============
			$(function() {
				 $('input[name="phoneBe"]').on("keyup", function(){
					 
					 var phone = "";	
						if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
							var phone = $("select[id='phone1']").val() + "-"
												+ $("input[id='phone2']").val() + "-"
												+ $("input[id='phone3']").val();
						}
						//alert("입력된 번호 : "+phone);
					 
					 $.ajax({
						 url : "/user/json/getUserByPhone/"+phone,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 //alert(JSONData.user);
							 if(JSONData.user != null){
								 if(JSONData.user.phone != JSONData.me.phone){
									$('input[name="phoneBe"]').css('background-color','pink');
									$('#authnumPhoneWirte').text("이미 존재하는 번호입니다.");
								 } else {
									$('input[name="phoneBe"]').css('background-color','white');
									$('#authnumPhoneWirte').text("");
								 }
							 } else {
								 if(phone.length < 13){
									$('input[name="phoneBe"]').css('background-color','pink');
									$('#authnumPhoneWirte').text("전화번호 형식이 아닙니다.");
								 } else {
									$('input[name="phoneBe"]').css('background-color','rgb(207, 253, 170)');
									$('#authnumPhoneWirte').text("");
								 }
							 }
						 }
					 });
				 });
			 });
				
			
			
			

			 $(function() {
				 $('input[name="nickName"]').on("keyup", function(){
					 
					 var nickName = $('input[name="nickName"]').val();
					 
					 $.ajax({
						 url : "/user/json/getUserByNickName/"+nickName,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 //alert(JSONData.user);
							 if(JSONData.user != null){
								 if(JSONData.user.nickName != JSONData.me.nickName){
									$('input[name="nickName"]').css('background-color','pink');
									$('#nickNameWirte').text("이미 존재하는 닉네임입니다.");
								 } else {
									$('input[name="nickName"]').css('background-color','white');
									$('#nickNameWirte').text("");
								 }
							 } else {
								 if(nickName.length < 4){
									$('input[name="nickName"]').css('background-color','pink');
									$('#nickNameWirte').text("너무 짧습니다.");
								 } else {
									$('input[name="nickName"]').css('background-color','rgb(207, 253, 170)');
									$('#nickNameWirte').text("");
								 }
							 }
						 }
					 });
				 });
			 });
			

			 
			 $(function() {
				 
				$( "#address1" ).on("change" , function() {
					
					var idx = $("#address1").index(this);
					var city = $(this).val();
					
					//alert(city + idx);
					
					$.ajax( 
						{
							url : "/user/json/getLocationList/"+city ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								var list="";
								//list+="<option></option>";
								for(i in JSONData.list){
									var town = JSONData.list[i].townName;
									list+="<option value='"+town+"' >"+town+"</option>";
							}
								$( "#address2:eq("+idx+")" ).empty().append(list);
							},
							error : function(what){
								
							}
					});
				});
				
				
				$( "#updateAddress" ).on("click" , function() {
				
					var displayValue = "<select id='address2' name='address2'>" + 
										"<c:forEach var='location' items='${list}'>" + 
						"<option value='${location.townName}' ${ ! empty location[1] && location[1] == location.townName ? 'selected' : ''  }>${location.townName}</option>" + 
						"</c:forEach>" + 
						"</select>" + 
						"<input type='hidden' name='address'>";
						
						$("#addTown").html(displayValue);
						
						
						var idx = $("#address1").index(this);
						var city = $("#address1").val();
						
						//alert(city + idx);
						
						$.ajax( 
							{
								url : "/user/json/getLocationList/"+city ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									var list="";
									//list+="<option></option>";
									for(i in JSONData.list){
										var town = JSONData.list[i].townName;
										list+="<option value='"+town+"' >"+town+"</option>";
								}
									$( "#address2:eq("+idx+")" ).empty().append(list);
								},
								error : function(what){
									
								}
							});
						
						$("#updateAddress").remove();
						$("#thisIsTown").remove();
				});
				
			});
			 
			 
			 $(function() {
				 $('.inter-chk').on('change', function() {
					
					if( $('.inter-chk:checked').length <= 2 ) {
						$('.inter-chk').attr('disabled', false);
					} else {
						$('.inter-chk').attr('disabled', true);
						$('.inter-chk:checked').attr('disabled', false);
					}
				}); 
			 });
			 
			 
			 $(function(){
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $("#emailConfirm").on("click" , function() {
					 
					 var email = $("input[name='email']").val();
					 alert("입력된 이메일"+email);
					 email = email.substr(0, email.length - 3);
						
					 $.ajax({
						url : "/user/json/emailAuth/"+email,
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						datatype : "json",
						success : function(JSONData, status){
							alert("메일이 발송되었습니다. 메일을 확인해 주세요.");
							
							$('input[name="authnum"]').on("keyup", function(){
								 if(JSONData.authNum == $("#authnum").val()){
									 $('input[name="authnum"]').css('background-color','rgb(207, 253, 170)');
									 $("#authnumWirte").text("");
								 } else {
									 //alert("아님");
									 $('input[name="authnum"]').css('background-color','pink');
									 $("#authnumWirte").text("잘못된 인증번호입니다.");
								 }
							 });							
								
							},
							error : function(what){
								alert("이메일이 전송되지 않았습니다. 유효한 이메일을 입력하여 주십시요.");
						}
					});
				});
			 });
			 

			 $(function() {
				 $("#phoneConfirm").on("click" , function() {
					 
					var value = "";	
					if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
						var value = $("select[id='phone1']").val()  
											+ $("input[id='phone2']").val() 
											+ $("input[id='phone3']").val();
					}
					//alert("입력된 번호 : "+value);
					
					$.ajax({
						url : "/user/json/SMSAuth/"+value,
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						datatype : "json",
						success : function(JSONData, status){
							alert("SMS가 발송되었습니다. 확인해 주세요.");
							
							$('input[name="authnumPhone"]').on("keyup", function(){
								 if(JSONData.authNum == $("#authnumPhone").val()){
									 $('input[name="authnumPhone"]').css('background-color','rgb(207, 253, 170)');
									 $("#authnumPhoneWirte").text("");
								 } else {
									 $('input[name="authnumPhone"]').css('background-color','pink');
									 $("#authnumPhoneWirte").text("잘못된 인증번호입니다.");
								 }
							 });
						},
						error : function(what){
							alert("SMS가 전송되지 않았습니다. 유효한 번호를 입력하여 주십시요.");
						}
					 });
				 });
			 });
			 
			 
			///////////////////////////////////////////////////////////////////////
			function fncUpdateUser() {
				var name=$("input[name='nickName']").val();
				var address1=$("select[name='address1']").val();
				var address2=$("select[name='address2']").val();
				
				
				
				if(name == null || name.length <1){
					alert("닉네임은  반드시 입력하셔야 합니다.");
					return;
				}
					
				var address = address1 + " " + address2;
				
				alert(address1);
				alert(address2);
				alert(address);
				
				var items = [];
				$('input:checkbox[type=checkbox]:checked').each(function () {
					items.push($(this).val());
				});
				
				var value = "";	
				if( $("input[id='phone2']").val() != ""  &&  $("id[name='phone3']").val() != "") {
					var value = $("select[id='phone1']").val() + "-" 
										+ $("input[id='phone2']").val() + "-" 
										+ $("input[id='phone3']").val();
				}
				
				//Debug...
				//alert("phone : "+value);
				$("input:hidden[name='firstInterest']").val( items[0] );
				$("input:hidden[name='secondInterest']").val( items[1] );
				$("input:hidden[name='thirdInterest']").val( items[2] );
				$("input:hidden[name='phone']").val( value );
				$("input:hidden[name='address']").val( address );
				
				$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/updateUserResult").submit();
			}
	</script>
<!-- //All js -->

<style>
	/* /////////////////////////////////// */

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
		background-image : url("/resources/images/background/meetingbg.jpg");
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
		margin-top: -80px;
    margin-bottom: 60px;
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

	ul {
	    list-style: disc;
	    /* margin: 2em 0 2em 0; */
	    padding-left: 1em;
	}
	
	.box {
	    border: solid 1px #dbdbdb;
	    /* margin-bottom: 100px; */
	    padding: 1.5em;
	    width: 80%;
	    margin: 0 auto;
	 }
	 
	 input[type="text"], input[type="email"], input[type="tel"], select, textarea {
	    background: #f9e4e4;
	    border-radius: 10px;
	    border: solid 2px #efa5b1;
	    color: #847d7dc7;
	}
	input[type="submit"], input[type="reset"], input[type="button"], button, .button {
	    box-shadow: inset 0 0 0 2px #ff264a;
	    color: #ff264a !important;
	    border-radius: 30px;
	}
	.align-center{
		margin-top : 3em;
	}
/* /////////////////////////////////// */
</style>


</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>정보<span class="slim">수정</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
			<!-- 페이지 내부 네비게이션 경로 : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>마이페이지</li>
				<li>></li>
				<li>개인정보 수정</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
		
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal" style="clear:both;">
				<div class="box">
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<label for="userId">아 이 디</label>
							<input type="text" id="userId" name="userId" value="${user.userId}"  readonly>
							<span id="helpBlock" class="help-block">
								<strong class="text-danger">아이디는 수정불가</strong>
							</span>
						</div>
						<div class="6u$ 12u$(xsmall)">
							<label for="nickName">닉네임</label>
							<input type="text"  id="nickName" name="nickName" value="${user.nickName}" placeholder="${user.nickName}">
							<span id="nickNameWirte"></span>
						</div>
					</div>
					
					<hr/>
					
					<div class="row uniform">
						<div class="4u 12u$(small)">
						
						
							<label for="address1">주소  도/시</label>
							<div class="select-wrapper">
								<select id="address1" name="address1">
									<option value="">도/시를 선택해 주세요</option>
							      	<option value="서울" ${ ! empty location[0] && location[0] == "서울" ? "selected" : ""  }>서울</option>
							      	<option value="경기" ${ ! empty location[0] && location[0] == "경기" ? "selected" : ""  }>경기</option>
									<option value="인천" ${ ! empty location[0] && location[0] == "인천" ? "selected" : ""  }>인천</option>
									<option value="부산" ${ ! empty location[0] && location[0] == "부산" ? "selected" : ""  }>부산</option>
									<option value="대구" ${ ! empty location[0] && location[0] == "대구" ? "selected" : ""  }>대구</option>
									<option value="광주" ${ ! empty location[0] && location[0] == "광주" ? "selected" : ""  }>광주</option>
									<option value="대전" ${ ! empty location[0] && location[0] == "대전" ? "selected" : ""  }>대전</option>
									<option value="울산" ${ ! empty location[0] && location[0] == "울산" ? "selected" : ""  }>울산</option>
									<option value="세종" ${ ! empty location[0] && location[0] == "세종" ? "selected" : ""  }>세종</option>
									<option value="강원" ${ ! empty location[0] && location[0] == "강원" ? "selected" : ""  }>강원</option>
									<option value="경남" ${ ! empty location[0] && location[0] == "경남" ? "selected" : ""  }>경남</option>
									<option value="경북" ${ ! empty location[0] && location[0] == "경북" ? "selected" : ""  }>경북</option>
									<option value="전남" ${ ! empty location[0] && location[0] == "전남" ? "selected" : ""  }>전남</option>
									<option value="전북" ${ ! empty location[0] && location[0] == "전북" ? "selected" : ""  }>전북</option>
									<option value="충남" ${ ! empty location[0] && location[0] == "충남" ? "selected" : ""  }>충남</option>
									<option value="충북" ${ ! empty location[0] && location[0] == "충북" ? "selected" : ""  }>충북</option>
									<option value="제주" ${ ! empty location[0] && location[0] == "제주" ? "selected" : ""  }>제주</option>
								</select>
							</div>
						</div>
						
						
						<div class="4u 12u$(small)">
						
							<label for="address1">구/군</label>
							
							<div class="select-wrapper" id="addTown">
								<!-- <select id="address2" name="address2">
									<c:forEach var="location" items="${list}">
										<option value="${location.townName}" ${ ! empty location[1] && location[1] == location.townName ? "selected" : ""  }>${location.townName}</option>
									</c:forEach>
								</select> 
								<input type="hidden" name="address"> -->
							</div> 
							
							<h4 id="thisIsTown">${location[1]}</h4>
							<div class="button" id="updateAddress">수정</div>
						</div>
						
						
						
					</div>
					
					<hr/>
					
					<div class="row uniform">
						<div class="2u 12u$(xsmall)">
							<label for="phone1">휴대전화번호</label>
						</div>
						<div class="2u 12u$(xsmall)">
							<div class="select-wrapper">
								<select  name="phoneBe" id="phone1">
									<option value="010" ${ ! empty phone[0] && phone[0] == "010" ? "selected" : ""  } >010</option>
									<option value="011" ${ ! empty phone[0] && phone[0] == "011" ? "selected" : ""  } >011</option>
									<option value="016" ${ ! empty phone[0] && phone[0] == "016" ? "selected" : ""  } >016</option>
									<option value="018" ${ ! empty phone[0] && phone[0] == "018" ? "selected" : ""  } >018</option>
								</select>
							</div>
						</div>
						<div class="1u 12u$(xsmall)">-</div>
						<div class="2u 12u$(xsmall)">
							<input type="text"  id="phone2" name="phoneBe" value="${ ! empty phone[1] ? phone[1] : ''}"  placeholder="변경번호">
						</div>
						<div class="1u 12u$(xsmall)">-</div>
						<div class="2u 12u$(xsmall)">
							<input type="text" id="phone3" name="phoneBe" value="${ ! empty phone[2] ? phone[2]: ''}"   placeholder="변경번호">
						</div>
						<div class="2u 12u$(xsmall)">
							<button id="phoneConfirm" type="button">인증</button>
						</div>
						
					</div>
					
					<hr/>
					
					<div class="row uniform">
						<div class="10u$ 12u$(xsmall)">
							<input type='text' class="form-control" id='authnumPhone' name='authnumPhone' placeholder='인증번호 7자리를 입력하세요'/>
							<span id="authnumPhoneWirte"></span>
							<input type="hidden" name="phone"  />
						</div>
					</div>
					
					<hr/>
					
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<label for="ssn">이메일</label>
							<input type="text" id="email" name="email" value="${user.email}" placeholder="이메일">
						</div>
					</div>
					
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<label for="profile">관심사(3개 선택)</label>
						</div>
					</div>
					
					<div class="row uniform">
						<div class="row uniform">
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10000" class="inter-chk" id="sltInter01" ${ (user.firstInterest == '10000' || user.secondInterest == '10000' || user.thirdInterest == '10000') ? 'checked' : '' }><label for="sltInter01">아웃도어/여행</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10001" class="inter-chk" id="sltInter02" ${ (user.firstInterest == '10001' || user.secondInterest == '10001' || user.thirdInterest == '10001') ? 'checked' : '' }><label for="sltInter02">운동/스포츠</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10002" class="inter-chk" id="sltInter03" ${ (user.firstInterest == '10002' || user.secondInterest == '10002' || user.thirdInterest == '10002') ? 'checked' : '' }><label for="sltInter03">인문학/책/글</label>
							</div>
							
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10003" class="inter-chk" id="sltInter04" ${ (user.firstInterest == '10003' || user.secondInterest == '10003' || user.thirdInterest == '10003') ? 'checked' : '' }><label for="sltInter04">업종/직무</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10004" class="inter-chk" id="sltInter05" ${ (user.firstInterest == '10004' || user.secondInterest == '10004' || user.thirdInterest == '10004') ? 'checked' : '' }><label for="sltInter05">외국/언어</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10005" class="inter-chk" id="sltInter06" ${ (user.firstInterest == '10005' || user.secondInterest == '10005' || user.thirdInterest == '10005') ? 'checked' : '' }><label for="sltInter06">문화/공연/축제</label>
							</div>
							
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10006" class="inter-chk" id="sltInter07" ${ (user.firstInterest == '10006' || user.secondInterest == '10006' || user.thirdInterest == '10006') ? 'checked' : '' }><label for="sltInter07">음악/악기</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10007" class="inter-chk" id="sltInter08" ${ (user.firstInterest == '10007' || user.secondInterest == '10007' || user.thirdInterest == '10007') ? 'checked' : '' }><label for="sltInter08">공예/만들기</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10008" class="inter-chk" id="sltInter09" ${ (user.firstInterest == '10008' || user.secondInterest == '10008' || user.thirdInterest == '10008') ? 'checked' : '' }><label for="sltInter09">댄스/무용</label>
							</div>
							
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10009" class="inter-chk" id="sltInter10" ${ (user.firstInterest == '10009' || user.secondInterest == '10009' || user.thirdInterest == '10009') ? 'checked' : '' }><label for="sltInter10">봉사활동</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10010" class="inter-chk" id="sltInter11" ${ (user.firstInterest == '10010' || user.secondInterest == '10010' || user.thirdInterest == '10010') ? 'checked' : '' }><label for="sltInter11">사교/인맥</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10011" class="inter-chk" id="sltInter12" ${ (user.firstInterest == '10011' || user.secondInterest == '10011' || user.thirdInterest == '10011') ? 'checked' : '' }><label for="sltInter12">차/오토바이</label>
							</div>
							
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10012" class="inter-chk" id="sltInter13" ${ (user.firstInterest == '10012' || user.secondInterest == '10012' || user.thirdInterest == '10012') ? 'checked' : '' }><label for="sltInter13">사진/영상</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10013" class="inter-chk" id="sltInter14" ${ (user.firstInterest == '10013' || user.secondInterest == '10013' || user.thirdInterest == '10013') ? 'checked' : '' }><label for="sltInter14">야구관람</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10014" class="inter-chk" id="sltInter15" ${ (user.firstInterest == '10014' || user.secondInterest == '10014' || user.thirdInterest == '10014') ? 'checked' : '' }><label for="sltInter15">게임/오락</label>
							</div>
							
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10015" class="inter-chk" id="sltInter16" ${ (user.firstInterest == '10015' || user.secondInterest == '10015' || user.thirdInterest == '10015') ? 'checked' : '' }><label for="sltInter16">요리/제조</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10016" class="inter-chk" id="sltInter17" ${ (user.firstInterest == '10016' || user.secondInterest == '10016' || user.thirdInterest == '10016') ? 'checked' : '' }><label for="sltInter17">반려동물</label>
							</div>
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10017" class="inter-chk" id="sltInter18" ${ (user.firstInterest == '10017' || user.secondInterest == '10017' || user.thirdInterest == '10017') ? 'checked' : '' }><label for="sltInter18">가족/결혼</label>
							</div>
							
							<div class="4u 6u$(small)">
								<input type="checkbox" name="selectInterest" value="10018" class="inter-chk" id="sltInter19" ${ (user.firstInterest == '10018' || user.secondInterest == '10018' || user.thirdInterest == '10018') ? 'checked' : '' }><label for="sltInter19">함께해요</label>
							</div>
						</div>
						
						<input type="hidden" name="firstInterest">
						<input type="hidden" name="secondInterest">
						<input type="hidden" name="thirdInterest">		
					</div>
					
					<hr/>
					
					<div class="row uniform">
						<div class="6u 12u$(xsmall)">
							<label for="profile" >프로필 이미지</label>
							<input type="file" name="uploadFile" >
							<%-- <input type="file" name="uploadFile" >
							<c:set var="i" value="0" />
							<c:forEach var="file" items="${filelist}" >
								<c:set var="i" value="${ i+1 }" />
								<img src="/resources/images/userprofile/${file}" width="500" height="500"/>
								<input type="hidden" name="profile${i}" value="${file}">
							</c:forEach> --%>
						</div>
						<div class="6u 12u$(small)">
							<img src="/resources/images/userprofile/${user.profile}" width="300px" height="300px"/>
								<%-- <input type="hidden" name="profile${i}" value="${file}"> --%>
						</div>
					</div>
				</div>
			
				<ul class="actions align-center">
					<li><a href="#" class="button" name="cancle">취소</a></li>
					<li><a href="#" class="button special" name="update">수정</a></li>
				</ul>
			
			</form>
		
		</div>
	</div>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>