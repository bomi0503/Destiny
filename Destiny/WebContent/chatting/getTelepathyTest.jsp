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
   <!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   
<script type="text/javascript">


function getRandomChatting(){
	$("form").attr("method" , "POST").attr("action" , "/chatting/getRandomChatting").submit();
  	}

$(function() {
	$( "#random" ).on("click" , function() {
 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		getRandomChatting();
	});
	
});
 
 var n=1;
	setTimeout(function() { 
		swal({
			  title: "TimeOut!",
			  text: "chatting을 시작합니다!",
			  icon: "success",
			  buttons: true,
			  dangerMode: false,
			  
			})
			.then(function(willDelete)  {
			  if (willDelete) {
				  getRandomChatting(); 
			  }else{
				  self.close();
			  }
			});
   		//alert("TimeOut! chatting을 시작합니다!");
   		 }, 16000);
	
	(function poll() {
		setTimeout(function() { 
			if (n<16) {
				//$($('h2').val()).remove();
				poll();
				//$('h2').last().append(10-n);
				$('h2').text(15-n);
	            
			}
			
	   		 n++; }, 1000);
		
	})();  
//이미지 선택=====================
	$(function() {

	$(".one1").on("click", function(){

		$("input:radio[id='exOne1']").prop("checked",true);

	});

	$(".two1").click(function(){

		$("input:radio[id='exTwo1']").prop("checked", true);

	});
	
	$(".one2").on("click", function(){

		$("input:radio[id='exOne2']").prop("checked",true);

	});

	$(".two2").click(function(){

		$("input:radio[id='exTwo2']").prop("checked", true);

	});
	$(".one3").on("click", function(){

		$("input:radio[id='exOne3']").prop("checked",true);

	});

	$(".two3").click(function(){

		$("input:radio[id='exTwo3']").prop("checked", true);

	});

	

 

});
</script>

<title>Telepathy Test</title>
<style type="text/css">
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,800);
body {
	
 overflow: scroll;
 
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
	margin: 10px;
	
}
.image.fit img {
    width: 100%;
    height: 200px;
}
.in{
margin-bottom: 50px;
}
/* hover ============= */


figure.snip1141 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  min-width: 100px;
  max-width: 310px;
  max-height: 310px;
  width: 100%;
  height: 200px;
  background: #000000;
  color: #ffffff;
  text-align: left;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1141 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease-in-out;
  transition: all 0.4s ease-in-out;
}

figure.snip1141 img {
 
  max-width: 120%;
    max-height: 110%;
    width: 120%;
    height: 120%;
     margin-left:-15%;
  position: relative;
  opacity: 0.9;
  
}

figure.snip1141 .circle {
  position: relative;
  height: 55px;
  width: 55px;
  top: 0%;
  left: 0%;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 50%;
  text-align: center;
}

figure.snip1141 .circle:before,
figure.snip1141 .circle:after {
  border: 2px solid white;
  border-right-color: transparent;
  position: absolute;
  content: '';
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  border-radius: 50%;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease-in-out;
  transition: all 0.35s ease-in-out;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 .circle:before {
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}

figure.snip1141 .circle:after {
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

figure.snip1141 figcaption {
  position: absolute;
  top: 20px;
  left: 20px;
  display: block;
  width: 100%;
  overflow: hidden;
}

figure.snip1141 h1 {
  position: absolute;
  margin: 0;
  text-transform: uppercase;
  font-weight: 300;
  letter-spacing: -1px;
  line-height: 55px;
  top: 0%;
  left: 0%;
  width: 100%;
  padding: 0 20px;
  opacity: 0;
  -webkit-transform: translateX(-10%);
  transform: translateX(-10%);
  font-size: 30px;
  color: #ffffff;
}

figure.snip1141 .icon {
  overflow: hidden;
  width: 100%;
  position: absolute;
}

figure.snip1141 i {
  color: white;
  font-size: 48px;
  line-height: 55px;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
}

figure.snip1141 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}

figure.snip1141:hover .circle,
figure.snip1141.hover .circle {
  background-color: rgba(0, 0, 0, 0);
}

figure.snip1141:hover .circle:before,
figure.snip1141.hover .circle:before,
figure.snip1141:hover .circle:after,
figure.snip1141.hover .circle:after {
  -webkit-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

figure.snip1141:hover h1,
figure.snip1141.hover h1 {
  opacity: 1;
  -webkit-transition-delay: 0.3s;
  transition-delay: 0.3s;
  -webkit-transform: translateX(0);
  transform: translateX(0);
}

figure.snip1141:hover img,
figure.snip1141.hover img {
  opacity: 0.35;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

figure.snip1141:hover i,
figure.snip1141.hover i {
  opacity: 0;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}
.ion-ios-arrow-right:before{
	    margin-top: 3px;
}


/* Demo purposes only */
html {
  height: 100%;
}
body {
  /* background-color: #212121; */
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: wrap;
  margin: 0;
  /* height: 100%; */
}

.question{
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 20px;
}

#random{
	width: 90%;
}

.button{
	width: 90%;
}

/* sweetalert buttom design^^ */
.swal-button{
	padding : 0 56px;
	color : rgba(0,0,0,.65) !important;
}
</style>
</head>
<body >
	
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
			<div class="row align-center">
			  		<%-- <div class="5u"><strong>${i}</strong></div> --%>
					<div class="12u$ question">${telepathy.telepathyQuestion}</div>
					
			</div>
			<div class="row align-center ">
				<div class="6u one${i}" >
					<figure class="snip1141"><img src="/resources/images/telepathy/${telepathy.exOneImg}" alt="sq-sample27" />
					  <figcaption>
					    <div class="circle"><i class="ion-ios-arrow-right"> </i></div>
					    <h1>${telepathy.exOne}</h1>
					  </figcaption>
					  <a href="javascript:"></a>
					</figure>
				</div>
				<div class="6u$ two${i}">
					<figure class="snip1141"><img src="/resources/images/telepathy/${telepathy.exTwoImg}" alt="sq-sample17" />
					  <figcaption>
					    <div class="circle"><i class="ion-ios-arrow-right"> </i></div>
					    <h1>${telepathy.exTwo}</h1>
					  </figcaption>
					  <a href="javascript:"></a>
					</figure>
				</div>
			</div>
		
			<%-- <div class="row align-center  12u 12u$(small)">
			 		
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
					
					
			</div>  --%>
			<div class="row align-center form-group">
					
						<p class="6u">
						<input type="radio" id="exOne${i}" name="${i}" checked="checked" value="1">
						<label for="exOne${i}" >
							<%-- ${telepathy.exOne} --%>
						</label>
						</p>
						<p class="6u$">
						<input type="radio" id="exTwo${i}" name="${i}"  value="2" >
						<label for="exTwo${i}" >
							<%-- ${telepathy.exTwo} --%>
						</label>
						</p>
					
			  		
			</div>
				
				
		</div>		
		</c:forEach>
		</div>
		<div class='align-center form-group'>
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