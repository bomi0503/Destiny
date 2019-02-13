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
		$('#getBackButton').on("click", function(){
			var userId = $("input[name='getBack']").val();
			var email = $("input[name='getBackEmail']").val();
			self.location = "/user/getBackSite/"+userId+"/"+email;
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
		
			<div class="12u">
			   <h3><strong class="text-danger">${reason}</strong></h3>
			   <c:if test="${reason eq '탈퇴한 회원입니다. 다시 이용하고 싶으시면 계정을 복구해 주십시요.'}">
					<label for="getBack">기존 아이디 : </label><input type="text" id="getBack" name="getBack">
					<label for="getBackEmail">기존 이메일 : </label><input type="text" id="getBackEmail" name="getBackEmail">
					<button id="getBackButton" type="button"  >계정복구</button>
			   </c:if>
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