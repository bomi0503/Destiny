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
<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(function(){
	// 내부에 스크립트 코드 추가
	
	$("a[name='findUser']").on("click", function() {
		self.location = "/find/selectUser"
	});
	$("a[name='findMeeting']").on("click", function() {
		self.location = "/find/selectMeeting"
	});
	
})
	
</script>
<!-- //All js -->

<style>
	section.wrapper, article.wrapper {
	    padding: 15em 0;
	    background: #ff000014;
	}
</style>
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />	
	<!-- //header -->
	<!-- contents -->
	
	<section id="main" class="wrapper">
		<div class="inner">
			<!-- Image -->
			<div class="box alt">
				<div class="row 50% uniform">
					<div class="6u"><span class="image fit"><img src="/resources/images/find/findUser.jpg" alt="" /></span></div>
					<div class="6u$"><span class="image fit"><img src="/resources/images/find/findMeeting.jpg" alt="" /></span></div>
				</div>
			</div>
			<div class="box alt">
				<div class="row 50% uniform align-center">
					<div class="6u"><a href="#" class="button" name="findUser">이상형찾기</a></div>
					<div class="6u$"><a href="#" class="button" name="findMeeting">모임찾기</a></div>
				</div>
			</div>
			
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>