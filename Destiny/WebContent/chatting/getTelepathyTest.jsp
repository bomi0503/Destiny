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
<link href="carousel.css" rel="stylesheet">
<!-- //All CSS Insert -->

<!-- All js -->
   <!--  템플릿 사용하기 위해 필요한 js -->
   <script src="/resources/javascript/jquery.min.js"></script>
   <script src="/resources/javascript/skel.min.js"></script>
   <script src="/resources/javascript/util.js"></script>
   <script src="/resources/javascript/main.js"></script>
   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="/resources/css/main.css" > 
   
   
<script type="text/javascript">


function getRandomChatting(){
	$("form").attr("method" , "POST").attr("action" , "/chatting/telepathyResult").submit();
  	}

$(function() {
	$( "#random" ).on("click" , function() {
 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		getRandomChatting();
	});
	
});
 
var n=1;
	setTimeout(function() { 
   
   		alert("TimeOut! chatting을 시작합니다!");
   		getRandomChatting(); }, 10000);
	
	(function poll() {
		setTimeout(function() { 
			if (n<11) {
				//$($('h2').val()).remove();
				poll();
				//$('h2').last().append(10-n);
				$('h2').text(11-n);
	            
			}
			
	   		 n++; }, 1000);
		
	})(); 

</script>

<title>Telepathy Test</title>
<style type="text/css">
body {
	
	 
}

body:after{
	/*  background-image: url("/resources/images/chatting/pinkwall.jpg");  */
 	background-repeat: no-repeat;
   	background-color: rgba( 255, 255, 255, 0.5 );
    top:0;
    left:0;
    position:absolute;
    background-size:cover;
    opacity:0.3!important;
    filter:alpha(opacity=30);
    z-index:-1;
    content:"";
    width:100%;
    max-width:100%;
    height:100%;
}
h2{
	margin: 0;
}
section.wrapper, article.wrapper {
   padding: 0;
}

.flex-2{
	padding-left: 15px;
}
.image.fit img {
    width: 100%;
    height: 200px;
}
.in{
margin-bottom: 50px;
}

</style>
</head>
<body>
	
	<!-- <div class="text-center">TelepathyTest</div> -->
	<section id="three" class="wrapper align-center">
	<div class='title text-center'>
	<img alt="" src="/resources/images/chatting/clock.gif" class="img-circle" width='100' height='100'>
	<h2>count</h2>
	</div>
	<form class="form-horizontal">
	
		<div class=" flex-2 flex-2">
		<c:set var="i" value="0" />
		<c:forEach var="telepathy" items="${telepathyList}">
		<c:set var="i" value="${ i+1 }" />	
		<div class=" flex-2 flex-2 in">
			<div class="row align-center  12u 12u$(small)">
			  		<div class="5u"><strong>${i}</strong></div>
					<div class="7u$">${telepathy.telepathyQuestion}</div>
					
			</div>
			
			<div class="row align-center  12u 12u$(small)">
					
			  		<div class="6u"><strong>ONE</strong></div>
					<div class="6u"><strong>TWO</strong></div>
					
			</div>
		
			<div class="row align-center  12u 12u$(small)">
			 		
			  		<div class="6u">
				  		<span class="image fit align-center">
				  			<img src="/resources/images/telepathy/${telepathy.exOneImg}" >
				  		</span>
			  		</div>
					<div class="6u$">
						<span class="image fit align-center">
							<img src="/resources/images/telepathy/${telepathy.exTwoImg}"  >
						</span>
					</div>
					
					
			</div>
			<div class="row align-center form-group  12u 12u$(small)">
					
						<p class="6u">
						<input type="radio" id="exOne${i}" name="${i}" checked="checked" value="1">
						<label for="exOne${i}">
							${telepathy.exOne}
						</label>
						</p>
						<p class="6u$">
						<input type="radio" id="exTwo${i}" name="${i}"  value="2" >
						<label for="exTwo${i}" >
							${telepathy.exTwo}
						</label>
						</p>
					
			  		
			</div>
				
				
		</div>		
		</c:forEach>
		</div>
		<div class='align-center form-group  12u 12u$(small)'>
			<input type="hidden" name="roomNo" value="${roomNo}">
			<input type="hidden" name="telepathyNo1" value="${telepathyList[0].telepathyNo}">
			<input type="hidden" name="telepathyNo2" value="${telepathyList[1].telepathyNo}">
			<input type="hidden" name="telepathyNo3" value="${telepathyList[2].telepathyNo}">
			
			<a href='#' class="button" role="button" id="random">확인</a>
		</div>
	
	</form>
	</section>
</body>
</html>