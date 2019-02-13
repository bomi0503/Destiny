<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- CSS : start -->
<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<!-- CSS : end -->

<style type="text/css">

	.wrapper{
		background : green; /* 작업 후 삭제 */
		padding : 0 0 200px 0;
		font-family: 'Noto Sans KR', sans-serif;
		color : #464646;
	}
	
	/* 상단 이미지 부분 CSS : start */
	.topImg{
			display : block;
			position : relative;
			top : 0;
			background-image : url("/resources/images/background/getRestaurantInfo07_background.jpg"); /* 이미지 변경 */
			background-repeat : no-repeat;
			background-position : center -300px; /* 이미지 위치 조절 */
			background-size : cover;
			width : 100%;
			height : 400px;
		}
		.topImg::after{
			content : "";
			background : rgba(0, 0, 0, 0.2);
			position : absolute;
			top : 0;
			left : 0;
			width : 100%;
			height : 400px;
		}
		.topImg h1{
			position : absolute;
			line-height : 330px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
			font-family: 'Nanum Myeongjo', serif;
		}
	/* 상단 이미지 부분 CSS : end */
	
	.container{
		content : '';
		display : block;
		clear : both;
		background : red; /* 작업 후 삭제 */
	}
	
	/* 홈 > 스토리 > 맞집정보 부분 : start */
	.smallNavi{
		content : '';
		display : block;
		clear : both;
		float : right;
		padding : 60px 0 60px 0;
		margin : 0;
		background : yellow; /* 작업 후 삭제 */
	}
		.smallNavi li{
			float : left;
			margin-right : 20px;
			list-style-type : none;
		}
	/* 홈 > 스토리 > 맞집정보 부분 : end */
	
</style>

</head>
<body>

	<!-- header : start -->
	<jsp:include page="/layout/header.jsp" />
	<!-- header : end -->
	
	<div class="topImg">
		<h1>서브페이지 타이틀</h1>
	</div>
	
	<!-- wrapper : start -->
	<div class="wrapper">
	
		<!-- container : start -->
		<div class="container">
		
			<ul class="smallNavi">
				<li><img alt="home" src="../resources/images/background/home.jpg"></li>
				<li>></li>
				<li>스토리</li>
				<li>></li>
				<li>맛집정보</li>
			</ul>
			
		</div>
		<!-- container : end -->
		
		<!-- container : start -->
		<div class="container">
			
			<div class="subPage">
				<p>내용</p>
			</div>
		
		</div>
		<!-- container : end -->
	</div>
	<!-- wrapper : end -->
</body>
</html>