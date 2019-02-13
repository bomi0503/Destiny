<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
	
	<!-- Bootstrap core CSS -->
    
    <link href="carousel.css" rel="stylesheet">
    
   <!-- 케러셀 완료 -->
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	 setTimeout(function(){
		self.location= "/meeting/listMeeting";
	}, 5000);	
	</script>
<title>matching</title>
<style>
#load {
	width: 100%;
	height: 100%;
	top: 30%;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
}

/* #load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
} */
</style>
</head>

<body>
  

			  
	<div id="load" >
		<img src="/resources/images/chatting/wait.gif" alt="loading">
		<br> <h1>loading...</h1>
	</div>


   
</body>
</html>