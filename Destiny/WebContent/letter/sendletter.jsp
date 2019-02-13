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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
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
					alert("�ʼ����� �Էµ��� �ʾҽ��ϴ�.")
					 
					return; 
				 }
				 
				 $("form").attr("method" , "POST").attr("action" , "/letter/sendLetter").submit();
			});
		});
	
	</script>
<!-- //All js -->
	
	
	<style>
	.letter_icon{
			display : inline-block;
			width : 22px;
			height : 22px;
			background : url("/resources/icon/envelope.png");
			background-size : cover;
			margin-right : 10px;
		}
		#top{
			background : #ff264a;
		}
			#top h1{
				color : white;
				margin : 0;
				padding : 20px;
				font-size : 30px;
				font-weight : bold;
			}
	.con{
		padding : 0 20px;
	}
	</style>

</head>

<body>	


<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main">
		
		
			<section id="top">
				<h1><span class="letter_icon"></span>����</h1>
			</section>
			<form class="form-horizontal con">
				<div class="row uniform">
					
				<div class="12u">
					<%-- <label for="senderId" >�߽���ID : ${me.userId}</label> --%>
					<span id="senderId"></span>
				</div>
				
				<div class="12u">
					<label for="senderId" >������ID</label>
					<input type="text" id="receiverId" name="receiverId" value="${!(empty senderId) ? senderId : ''}">
					<span id="senderId"></span>
				</div>

				<div class="12u">
					<label for="letterTitle">���� ����</label>
				    <input type="text" id="letterTitle" name="letterTitle">
				    <span id="letterTitle"></span>
				</div>
				 
				 <div class="12u">
					<label for="prodDetail">��������</label>
					  <textarea name="letterDetail" rows="8" style="resize:none;"></textarea>
				 </div>
				  

					<ul class="actions small">	
					  <li><a id="sendNow" class="button special small" href="#" >�� &nbsp;��</a></li>
					  <li><a class="button special small" href="/letter/getLetterList">��&nbsp;��</a></li>
					</ul>


				</div>

			</form>
		
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->


	
	
</body>
</html>