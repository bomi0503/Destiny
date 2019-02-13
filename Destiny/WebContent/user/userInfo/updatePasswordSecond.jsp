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
		
		$('#password2').on("keyup", function(){
			var password = $("#password").val();
			var password2 = $("#password2").val();
			
			if(password != password2){
				$('#passwordWirte').text("비밀번호가 일치하지 않습니다.");
			} else {
				$('#passwordWirte').text("");
			}
		});
		
		
		$('#changePassword').on("click", function(){
			
			if($("#passwordWirte").text() != ""){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			var password = $("#password").val();
			self.location = "/user/updatePasswordSecond/${userId}/"+password;
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
			   <h3><strong class="text-danger">비밀번호를 변경해 주세요.</strong></h3>
			   
				<div class="6u 12u$(small)">
					<input type="text"  id="password" name="password" placeholder="비밀번호">
				 </div>
				 
				 <div class="6u 12u$(small)">
				 	<input type='text' id='password2' name='password2' placeholder='비밀번호 확인'>
				 	<br/><span id="passwordWirte"></span>
				 </div>
				 
				 
			</div>
			
			<ul class="actions align-center">
				<li><a href="#" class="button special" id="changePassword">확인</a></li>
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