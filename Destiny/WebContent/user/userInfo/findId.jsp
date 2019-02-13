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
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
	
	$(function(){
		
		$('input[name="email"]').on("keyup", function(){
			
			var email = $('input[name="email"]').val();
			
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
				$('#authnumWirte').text("이메일 형식이 아닙니다."+email);
			}else {
				
				//email = email.substr(0, email.length - 3);
				var cart = email.split('.');
				com = cart[1];
				if(com.length != 3){
					$('#authnumWirte').text("이메일 형식이 아닙니다."+email);
				} else{
				 
					email = cart[0];
					
					 $.ajax({
						 url : "/user/json/getUserByEmail/"+email,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 
							 if(JSONData.email != null){
							 	$('#authnumWirte').text(""); 
							 } else if(JSONData.email == null){
								 $('#authnumWirte').text("존재하지 않은 이메일입니다."+email);
							 }
							 //alert(JSONData.user);
							 /*if(JSONData.user != null){
								$('#authnumWirte').text(""+email);
							 } else if (JSONData.user == null){
								$('#authnumWirte').text("존재하지 않은 이메일입니다."+email);
							 }*/
						 },
						error : function(what){
							$('#authnumWirte').text("존재하지 않은 이메일입니다."+email);
						 }
					 });
				}
			 }
		});
		
		
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
		
		
		$('#foundId').on("click", function(){
			
			/*if($("#authnumWirte").text() != ""){
				alert("이메일 인증이 수행되지 않았습니다. 이메일 인증을 수행하여 주십시오.");
				return;
			}*/
			var email = $("input[name='email']").val();
			self.location = "/user/findId/"+email;
		});	
		
	});
	
	
	
	
		
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
	<section id="main" class="wrapper">
		<div class="inner">
		
			<div class="row uniform">
			   <h3><strong class="text-danger">아이디 찾기 화면입니다. 이메일 인증을 수행하여 주십시요.</strong></h3>
			   
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
			
			<ul class="actions align-center">
				<li><a href="#" class="button special" id="foundId">확인</a></li>
			</ul>
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>