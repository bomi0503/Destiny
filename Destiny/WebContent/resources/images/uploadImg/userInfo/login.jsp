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
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	<script>
	$(function(){
		// ���ο� ��ũ��Ʈ �ڵ� �߰�
		//============= "�α���"  Event ���� =============
			
			$("#password").keypress(function(e) {
				if(e.which == 13) {
					$(this).blur();
					$('#login').focus().click();
				}
			});
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#login").on("click" , function() {
				var id=$("input[name='userId']").val();
				var pw=$("input[name='password']").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
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
						<label for="userId">���̵�</label>
						<input name="userId" id="userId" type="text" placeholder="userId">
					</div>
					<div class="field">
						<label for="password">�н�����</label>
						<input name="password" id="password" type="password" placeholder="password">
					</div>
					
					<ul class="actions align-center">
							<li><a href="#" class="button" name="join" id="join">ȸ������</a></li>
							<li><a href="#" class="button special" name="login" id="login">�α���</a></li>
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