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
		// 내부에 스크립트 코드 추가
		//============= "로그인"  Event 연결 =============
			
			$("#password").keypress(function(e) {
				if(e.which == 13) {
					$(this).blur();
					$('#login').focus().click();
				}
			});
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#login").on("click" , function() {
				var id=$("input[name='userId']").val();
				var pw=$("input[name='password']").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("#loginForm").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				//self.location = "/user/login/"+id+"/"+pw;
			});
			
			$("#join").on("click", function() {
				self.location = "/user/addUser"
			});
		
	
	});
		
	</script>
<!-- //All js -->
	<style>
		#loginBox{width: 500px; height:500px;}
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
			<div class="box" id="loginBox">
	
				<h3>LOGIN</h3>
		
				<form id="loginForm" class="form-horizontal">
		
					<div class="field">
						<label for="userId">아이디</label>
						<input name="userId" id="userId" type="text" placeholder="userId">
					</div>
					<div class="field">
						<label for="password">패스워드</label>
						<input name="password" id="password" type="password" placeholder="password">
					</div>
					
					<ul class="actions align-center">
							<li><a href="#" class="button" name="join" id="join">회원가입</a></li>
							<li><a href="#" class="button special" name="login" id="login">로그인</a></li>
						</ul>
				</form>
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