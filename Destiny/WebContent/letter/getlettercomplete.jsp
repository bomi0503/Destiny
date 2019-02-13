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


	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body{
        	background-image : url("/resources/images/layout/letter.png");
			background-size : 1100px 700px;
            margin-top: 10px;
            text-align: center;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 self.location = "/letter/letterMain.jsp";
		});
	});
	
	
	</script>
	
</head>


<body>
	<section id="main" class="wrapper">
		<div class="inner">
   		<br/>
   		<h3>쪽지전송결과</h3>
   		<h4>${reason}</h4>
   	
   		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  
		  
		<ul class="actions small">	
		   <li><a class="button special small" href="/letter/letterMain.jsp">쪽지 메인으로</a></li>
		   <li><a class="button special small" href="/letter/sendletter.jsp">또&nbsp;보내기</a></li>
		</ul>

	   </form>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	</section>
	
</body>
</html>

