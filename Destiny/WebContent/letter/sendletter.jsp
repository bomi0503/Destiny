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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		
		
		$(function() {
			 $( "#sendNow" ).on("click" , function() {
				 var receiverId = $("input[name='receiverId']").val();
				 var letterTitle = $("input[name='letterTitle']").val();
				 var letterDetail = $("textarea[name='letterDetail']").val();
				 
				 if(receiverId == "" || letterTitle == "" || letterDetail == ""){
					alert("필수값이 입력되지 않았습니다.")
					 
					return; 
				 }
				 
				 $("form").attr("method" , "POST").attr("action" , "/letter/sendLetter").submit();
			});
		});
	
	</script>
<!-- //All js -->
	
	
	<style>
		body {
            padding-top : 50px;
        }
	</style>

</head>

<body class="subpage">	


<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<h3>쪽지작성</h3>
			<form class="form-horizontal">
				<div class="row uniform">
					
				<div class="12u">
					<label for="senderId" >발신자ID : ${me.userId}</label>
					<span id="senderId"></span>
				</div>
				
				<div class="12u">
					<label for="senderId" >수신자ID</label>
					<input type="text" id="receiverId" name="receiverId" value="${!(empty senderId) ? senderId : ''}">
					<span id="senderId"></span>
				</div>

				<div class="12u">
					<label for="letterTitle">쪽지 제목</label>
				    <input type="text" id="letterTitle" name="letterTitle">
				    <span id="letterTitle"></span>
				</div>
				 
				 <div class="12u">
					<label for="prodDetail">쪽지내용</label>
					  <textarea name="letterDetail"  cols="25" rows="25" >
					  </textarea>
				 </div>
				  

					<ul class="actions small">	
					  <li><a id="sendNow" class="button special small" href="#" >전 &nbsp;송</a></li>
					  <li><a class="button special small" href="/letter/letterMain.jsp">취&nbsp;소</a></li>
					</ul>


				</div>

			</form>
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->


	
	
</body>
</html>