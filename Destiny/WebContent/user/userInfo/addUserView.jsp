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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="/resources/css/main.css" > 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	
	
	
	<script>
	//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "a[name='join']" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[name='reset']").on("click" , function() {
				//$("form")[0].reset();
				history.go(-1);
			});
			
			$("#birthday").datepicker({
				dateFormat: 'yy-mm-dd',
				changeMonth: true,
				changeYear: true,
				minDate: '-150y',
	            yearRange: 'c-100:c+10'
	        })
	        .on('change', function(){
	        	console.log('1')
	        });
		});	
	
		
		function fncAddUser() {
			var id=$("#userId").val();
			var nickName=$("input[name='nickName']").val();
			var pw=$("#password").val();
			var pw_confirm=$("input[name='password2']").val();
			var address1=$("select[name='address1']").val();
			var address2=$("select[name='address2']").val();
			
			var address = address1 + " " + address2;
			//alert(address);
			
			var items = [];
			$('input:checkbox[type=checkbox]:checked').each(function () {
			    items.push($(this).val());
			});
			
			//alert(items);
			
			$("input:hidden[name='firstInterest']").val( items[0] );
			$("input:hidden[name='secondInterest']").val( items[1] );
			$("input:hidden[name='thirdInterest']").val( items[2] );
			
			
			if(id == null || id.length <1){
				swal("아이디를 입력해 주세요.");
				return;
			} else if(nickName == null || nickName.length < 1){
				swal("닉네임을 입력해 주세요.");
				return;
			} else if(pw == null || pw.length <1){
				swal("비밀번호를 입력해 주세요.");
				return;
			} else if(pw_confirm == null || pw_confirm.length <1){
				swal("비밀번호를 확인해 주세요.");
				return;
			} else if( pw != pw_confirm ) {				
				swal("비밀번호가 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			} else if( $('[name="gender"]:checked').length != 1 ){
				swal('성별을 선택해 주세요.');
				return;
			} else if(address == null || address.length <1){
				swal("거주지를 선택해 주세요.");
				return;
			} else if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				swal("휴대폰 번호가 제대로 입력되거나 인증이 수행되지 않았습니다. 확인해 주세요.");
				return;
			} else if( $('[name="selectInterest"]:checked').length != 3 ) {
				swal('3개의 관심사를 선택해 주세요.');
			} else if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("이메일이 제대로 입력되거나 인증이 수행되지 않았습니다. 확인해 주세요.");
				return;
			}
			
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			} else {
				swal("핸드폰 번호를 입력해 주세요.");
				return;
			}
			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit();
			
			
			/* if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("휴대폰 번호가 제대로 입력되거나 인증이 수행되지 않았습니다. 확인해 주세요.");
				return;
			}
			
			if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("이메일이 제대로 입력되거나 인증이 수행되지 않았습니다. 확인해 주세요.");
				return;
			}
			
			if(id == null || id.length <1){
				alert("아이디를 입력해 주세요.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드를 입력해 주세요.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드를 확인해 주세요.");
				return;
			}
			if(address == null || address.length <1){
				alert("거주지를 선택해 주세요.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호가 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			} else {
				alert("핸드폰 번호를 입력해 주세요.");
				return;
			}

			if($("input:text[id='email']").val() == "" || $("input:text[id='email']").val() == null){
				alert("이메일을 입력해주세요.");
				return;
			}
			
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		    	alert("이메일 형식이 아닙니다.");
		    	return;
		     }
			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit(); */
		}
		
		//==>"ID중복확인" Event 처리 및 연결
		 $(function() {
				 $("#checkVal").on("click" , function() {
					popWin 
					= window.open("/user/checkDuplication.jsp",
												"popWin", 
												"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no");
				});
			});
		
		 $(function() {
			 $('#userId').on("keyup", function(){
				 
				 var userId = $('#userId').val();
				 
				 $.ajax({
					 url : "/user/json/getUser/"+userId,
					 method : "GET",
					 datatype : "json",
					 headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					 },
					 success : function(JSONData, status){
						 if(JSONData.user != null){
							$('#userIdWirte').text("이미 존재하는 아이디입니다.");
						 } else {
							$('#userIdWirte').text("");
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
						 if(JSONData.user != null){
							/* $('input[name="nickName"]').css('background-color','pink'); */
							$('#nickNameWirte').text("이미 존재하는 닉네임입니다.");
						 } else {
							/* $('input[name="nickName"]').css('background-color','white'); */
							$('#nickNameWirte').text("");
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
								for(i in JSONData.list){
									var town = JSONData.list[i].townName;
									list+="<option value='"+town+"'>"+town+"</option>";
							}
								$( "#address2:eq("+idx+")" ).empty().append(list);
							},
							error : function(what){
								swal("에러" + what);
							}
					});
				});
			});
			 
			 $(function() {
				 $('input[name="phoneBe"]').on("keyup", function(){
					 
					 var phone = "";	
						if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
							var phone = $("select[id='phone1']").val() + "-"
												+ $("input[id='phone2']").val() + "-"
												+ $("input[id='phone3']").val();
						}
					 
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
							 if(JSONData.list[0] != null){
								$('#authnumPhoneWirte').text("이미 존재하는 번호입니다.");
							 } else {
								 if(phone.length < 13 || phone.length > 13){
									$('#authnumPhoneWirte').text("전화번호 형식이 아닙니다.");
								 } else {
									$('#authnumPhoneWirte').text("");
								 }
							 }
						 }, error : function(what){
								
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
							swal("인증번호가 발송되었습니다. 확인해 주세요.");
							
							$('input[name="authnumPhone"]').on("keyup", function(){
								 if(JSONData.authNum == $("#authnumPhone").val()){
									 $("#authnumPhoneWirte").text("");
								 } else {
									 $("#authnumPhoneWirte").text("인증번호가 일치하지 않습니다.");
								 }
							 });
						},
						error : function(what){
							swal("인증번호가 전송되지 않았습니다. 유효한 번호를 입력하여 주십시요.");
						}
					 });
				 });
			 });
			 
			 

			 $(function() {
				 $('input[name="email"]').on("keyup", function(){
					 
					 var email = $('input[name="email"]').val();
					 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
						$('#authnumWirte').text("이메일 형식이 아닙니다.");
					 }else {
					 
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
									$('#authnumWirte').text("이미 존재하는 이메일입니다.");
								 } else {
									$('#authnumWirte').text("");
								 }
							 },
							error : function(what){
								
							 }
						 });
					 }
				 });
			 });
			 
			 $(function() {
				 $("#emailConfirm").on("click" , function() {
					 
					 if($("#authnumWirte").text() != ""){
						 swal("정확한 이메일을 입력해주세요.");
					 } else {
					 
						 var email = $("input[name='email']").val();
						 swal("입력된 이메일"+email);
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
								swal("메일이 발송되었습니다. 메일을 확인해 주세요.");
								
								$('input[name="authnum"]').on("keyup", function(){
									 if(JSONData.authNum == $("#authnum").val()){
										 /* $('input[name="authnum"]').css('background-color','rgb(207, 253, 170)'); */
										 $("#authnumWirte").text("");
									 } else {
										 /* $('input[name="authnum"]').css('background-color','pink'); */
										 $("#authnumWirte").text("잘못된 인증번호입니다.");
									 }
								 });							
									
								},
								error : function(what){
									swal("이메일이 전송되지 않았습니다. 유효한 이메일을 입력하여 주십시요.");
								}
							 });
						 }
					});
				});
			 
			 
			 
			 
			 $(function() {
				// checkbox controll
				var $chkbox = $('[name="selectInterest"]');  
				
				$chkbox.on('change', function() {
					if( $('[name="selectInterest"]:checked').length <= 2 ) {
						$chkbox.attr('disabled', false);
					} else {
						$chkbox.attr('disabled', true);
						$('[name="selectInterest"]:checked').attr('disabled', false);
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
		
		/* /////////////////////////////////////////////////////////// */
		
			.box{
				width: 100%;
				margin: 0 auto;
			}
			
			input[type="text"], input[type="text"].join, input[type="password"].join, .join{
			    background: #fff;
			    border: none;
			    border-bottom: 1px solid #ababab;
			    color: #555;
			    border-radius: 2px;
			    width:100%;
			    display:inline-block;
			}
			
			row.join{
			    margin-top: 15px;
			}
			
			input[type="text"], input[type="password"], select.join, textarea {
		       /* background: #ffe7e7; */
		       /* border: none; */
		       color: #555;
		       border-radius: 2px;
		       width: 100%;
		   }
		   .ui-datepicker-month{float:right !important; background:#FFF !important; border-bottom:0 !important;}
		   .ui-datepicker-year{float:left !important; background:#FFF !important; border-bottom:0 !important;}
		   
		/* /////////////////////////////////////////////////////////// */
		
		.form-control { -webkit-appearance: menulist;}
		/* sweetalert buttom design^^ */
		.swal-button{
			padding : 0 56px;
			color : rgba(0,0,0,.65) !important;
		}
		
	</style>
</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>회원<span class="slim">가입</span></h1>
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
					<li>활동관리</li>
					<li>></li>
					<li>작성한 게시글</li>
				</ul>
				<!-- 페이지 내부 네비게이션 경로 : end -->
				
				<form class="form-horizontal" id="form111">
				
				
				<!-- ////////////////////////////////////////////////////////////////// -->
				
				<table class="row-table tablebm">
					<caption>테이블 설명</caption>
					
					<colgroup>
						<%-- <col style="width:20%;">
						<col style="width:80%;"> --%>
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
							<th>아이디</th>
							<td>
								<div class="row uniform">
									<div class="12u 12u$(small)">
										<input type="text" class="join" id="userId" name="userId">
			          				  	<span id="userIdWirte"></span>
									</div>
								</div>
							</td>
							<th>닉네임</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="text" class="join" id="nickName" name="nickName">
				            			<span id="nickNameWirte"></span>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="password" class="join" id="password" name="password">
									</div>
								</div>
							</td>
							<th>비밀번호 확인</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="password" class="join" id="password2" name="password2">
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>성별</th>
							<td>
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<input type="radio" name="gender" id="gender1" value="M" checked>
										<label for="gender1">남성</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="radio" name="gender" id="gender2" value="W">
										<label for="gender2">여성</label>
									</div>
								</div>
							</td>
							<th>생년월일</th>
							<td>
								<div class="row uniform">
									<div class="6u$ 12u$(small)">
										<input type="text" id="birthday" name="birthday" autocomplete="off">
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>거주지</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<select id="address1" name="address1" class="select_wrapper join form-control">
											<option value="">지역을 선택해 주세요.</option>
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
									
									<div class="4u 6u$(small)">
										<select id="address2" name="address2" class="select_wrapper join form-control">
											<c:forEach var="location" items="${list}">
												<option value="${location.townName}">${location.townName}</option>
											</c:forEach>
										</select>
									</div>
									<input type="hidden" name="address"/>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>휴대폰 번호</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="3u 12u$(small)">
										<select name="phoneBe" id="phone1" class="select_wrapper join phone form-control">
										 	<option value="010" >010</option>
										 	<option value="011" >011</option>
											<option value="016" >016</option>
											<option value="018" >018</option>
											<option value="019" >019</option>
										 </select>
									 </div>
									 
									 <div class="3u 12u$(small)">
									 	<input type="text" id="phone2" name="phoneBe" placeholder="번호" class="join phone" maxlength="4">
									 </div>
									 
									 <div class="3u 12u$(small)">
										 <input type="text" id="phone3" name="phoneBe" placeholder="번호" class="join phone" maxlength="4">
									 </div>
									 
									 <div class="3u 12u$(small)">
										 <button id="phoneConfirm" type="button" class="">인증</button>
									 </div>
									 
									 <div class="6u$ 12u$(small)">
										<input type='text' class="join" id='authnumPhone' name='authnumPhone' />
										<input type="hidden" name="phone">
										<span id="authnumPhoneWirte"></span>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="6u 12u$(small)">
										<input type="text"  id="email" name="email" placeholder="이메일">
										<br/><span id="authnumWirte"></span>
									 </div>
									 
									 <div class="3u 12u$(small)">
									 	<input type='text' id='authnum' name='authnum' placeholder='인증번호 7자리를 입력하세요'>
									 </div>
									 
									 <div class="3u 12u$(small)">
										 <button id="emailConfirm" type="button">인증</button>
									 </div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>관심사</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10000" id="sltInter01">
										<label for="sltInter01">아웃도어/여행</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10001" id="sltInter02">
										<label for="sltInter02">운동/스포츠</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10002" id="sltInter03">
										<label for="sltInter03">인문학/책/글</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10003" id="sltInter04">
										<label for="sltInter04">업종/직무</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10004" id="sltInter05">
										<label for="sltInter05">외국/언어</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10005" id="sltInter06">
										<label for="sltInter06">문화/공연/축제</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10006" id="sltInter07">
										<label for="sltInter07">음악/악기</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10007" id="sltInter08">
										<label for="sltInter08">공예/만들기</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10008" id="sltInter09">
										<label for="sltInter09">댄스/무용</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10009" id="sltInter10">
										<label for="sltInter10">봉사활동</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10010" id="sltInter11">
										<label for="sltInter11">사교/인맥</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10011" id="sltInter12">
										<label for="sltInter12">차/오토바이</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10012" id="sltInter13">
										<label for="sltInter13">사진/영상</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10013" id="sltInter14">
										<label for="sltInter14">야구관람</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10014" id="sltInter15">
										<label for="sltInter15">게임/오락</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10015" id="sltInter16">
										<label for="sltInter16">요리/제조</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10016" id="sltInter17">
										<label for="sltInter17">반려동물</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10017" id="sltInter18">
										<label for="sltInter18">가족/결혼</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10018" id="sltInter19">
										<label for="sltInter19">함께해요</label>
									</div>
								</div>
							</td>
							<input type="hidden" name="firstInterest"/>
							<input type="hidden" name="secondInterest"/>
							<input type="hidden" name="thirdInterest"/>
						</tr>
						<tr>
							<th>프로필 사진</th>
							<td colspan="3">
								<input type="file" name="uploadFile" >
							</td>
						</tr>
					</tbody>
				</table>
				
				<ul class="actions align-center">
					<li><a href="#" class="button" name="reset">취소</a></li>
					<li><a href="#" class="button special" name="join">가입</a></li>
				</ul>
					
				<!-- ////////////////////////////////////////////////////////////////// -->
						
				</form>
			</div>
			
		</div>
	</div>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>
