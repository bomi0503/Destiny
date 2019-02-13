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
		
		$('input[name="email"]').on("keyup", function(){
			
			var email = $('input[name="email"]').val();
			
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
				$('#authnumWirte').text("�̸��� ������ �ƴմϴ�."+email);
			}else {
				
				//email = email.substr(0, email.length - 3);
				var cart = email.split('.');
				com = cart[1];
				if(com.length != 3){
					$('#authnumWirte').text("�̸��� ������ �ƴմϴ�."+email);
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
								 $('#authnumWirte').text("�������� ���� �̸����Դϴ�."+email);
							 }
							 //alert(JSONData.user);
							 /*if(JSONData.user != null){
								$('#authnumWirte').text(""+email);
							 } else if (JSONData.user == null){
								$('#authnumWirte').text("�������� ���� �̸����Դϴ�."+email);
							 }*/
						 },
						error : function(what){
							$('#authnumWirte').text("�������� ���� �̸����Դϴ�."+email);
						 }
					 });
				}
			 }
		});
		
		
		$("#emailConfirm").on("click" , function() {
			 
			 if($("#authnumWirte").text() != ""){
				 swal("��Ȯ�� �̸����� �Է����ּ���.");
			 } else {
			 
				 var email = $("input[name='email']").val();
				 swal("�Էµ� �̸���"+email);
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
						swal("������ �߼۵Ǿ����ϴ�. ������ Ȯ���� �ּ���.");
						
						$('input[name="authnum"]').on("keyup", function(){
							 if(JSONData.authNum == $("#authnum").val()){
								 /* $('input[name="authnum"]').css('background-color','rgb(207, 253, 170)'); */
								 $("#authnumWirte").text("");
							 } else {
								 /* $('input[name="authnum"]').css('background-color','pink'); */
								 $("#authnumWirte").text("�߸��� ������ȣ�Դϴ�.");
							 }
						 });							
							
						},
						error : function(what){
							swal("�̸����� ���۵��� �ʾҽ��ϴ�. ��ȿ�� �̸����� �Է��Ͽ� �ֽʽÿ�.");
						}
					 });
				 }
			});
		
		
		$('#foundId').on("click", function(){
			
			/*if($("#authnumWirte").text() != ""){
				alert("�̸��� ������ ������� �ʾҽ��ϴ�. �̸��� ������ �����Ͽ� �ֽʽÿ�.");
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
			   <h3><strong class="text-danger">���̵� ã�� ȭ���Դϴ�. �̸��� ������ �����Ͽ� �ֽʽÿ�.</strong></h3>
			   
				<div class="6u 12u$(small)">
					<input type="text"  id="email" name="email" placeholder="�̸���">
					<br/><span id="authnumWirte"></span>
				 </div>
				 
				 <div class="3u 12u$(small)">
				 	<input type='text' id='authnum' name='authnum' placeholder='������ȣ 7�ڸ��� �Է��ϼ���'>
				 </div>
				 
				 <div class="3u 12u$(small)">
					 <button id="emailConfirm" type="button">����</button>
				 </div>
			</div>
			
			<ul class="actions align-center">
				<li><a href="#" class="button special" id="foundId">Ȯ��</a></li>
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