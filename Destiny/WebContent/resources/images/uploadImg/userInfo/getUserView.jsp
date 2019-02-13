<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>

<!-- All js -->
<!--  템플릿 사용하기 위해 필요한 js -->
<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css">
<!-- //All CSS Insert -->

<script>
		
		$(function(){
			$("button[id='leaveSite']").on("click", function(){
				self.location = "/user/userInfo/leaveSite.jsp";
			});
		});
		
		
		
		$(function(){
			$("button[id='actMainButton']").on("click", function(){
				self.location = "/user/userAct/actMain.jsp";
			});
		});
		
		
		$(function(){
			$("a[id='letterList']").on("click", function(){
				popWin = window.open("/letter/letterMain.jsp",
					   	 "popWin",
						 "left=300, top=200, width=1100, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

			});
		});
		
		$(function(){
			$("a[id='questionButton']").on("click", function(){
				var question = $("input[name='questionButton']").val();
				
				//alert(question);
				
				$.ajax({
					
					//url : "http://api.adams.ai/datamixiApi/deepqa?key=3758962826504551960&answerType=0&question="+question,
					url : "/user/json/getAnswer/"+question,
					method : "GET",
					datatype : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
						alert(JSONData.answer.return_object.answer);
						//$('#answerWirte').text(JSONData.answer.return_object.answer);
					}
					
				});
				
			});
		});
		
		$(function() {
            var offset = $("#content").offset();
            var topPadding = 15;
            $(window).scroll(function() {
    
                if ($(window).scrollTop() > offset.top) {
                    $("#content").stop().animate({
                        marginTop: $(window).scrollTop() - offset.top + topPadding
                    }, 500);
                } else {
                    $("#content").stop().animate({
                        marginTop: 0
                    });
                };
             });
        });
		
	</script>


<!-- //All js -->


<style>
#grad1 {
	height: 300px;
	background-color: #000000;
	background-image: linear-gradient(to right, #000000, #FFFFFF);
}

#communitymove h3 {
	color: #ff264a;
	font-weight: bold;
}

#communitymove p {
	color: #3e3e3e;
}

.ment {
	text-align: center;
}
</style>

<style type="text/css" media="screen">
#content {
	position: absolute;
	height: 200px; /* 퀵메뉴, 배너 이미지의 높이 */
	width: 270px; /* 퀵메뉴, 배너 이미지의 너비*/
	margin: 0px 0px 0px 700px;
	/* 가장 오른쪽의 수치가 화면 가운데에서 얼마만큼 오른쪽으로 레이어를 붙일 것인지 설정  */
	top: 10em; /* 배너 상단에서 얼마나 떨어뜨릴지 설정*/
	left: 50%; /* 레이어의 시작점이 왼쪽으로 부터 50% 지정 */
	text-align: left;
	padding: 50px;
	border: 1px solid #ff879b;
	border-radius: 15px;
}

.topImg {
	max-width: 100%;
	height: 400px;
	background-image: url("/resources/images/background/myPageBackground.jpg");
	background-position: center center;
	background-size: cover;
	background-repeat: no-repeat;
}

.topImg::after {
	content: "";
	background: rgba(0, 0, 0, 0.2);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
}

.topImg h1 {
	position: absolute;
	width: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Nanum Myeongjo', serif;
	font-size: 60px;
	text-align: center;
	height: 400px;
	line-height: 450px;
	color: white;
	z-index: 99;
}

.my{
	margin : 0;
	padding : 0;
	overflow : hidden;
}
.my li{
	list-style-type : none;
	float : left;
	width : 25%;
	padding : 2em;
	margin : 0 auto;
}
.my li h4{
	margin : 0;
	margin-bottom : 1em;
	font-family: 'Nanum Myeongjo', serif;
	font-weight : bold;
}
.my li .image{
	display : block;
	margin-bottom : 1em;
}
.my li .image img{
	margin : 0 auto;
}

@media screen and (max-width:1280px){
	.my li{
		width : 50%;
	}
}
@media screen and (max-width:750px){
	.my li{
		width : 100%;
	}
}


</style>



</head>

<body>


	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->


	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>마이페이지</h1>
	</div>
	<!-- 메인배경이미지 : end -->


	<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="communitymove" class="wrapper align-center">

		<div class="inner">

			<%-- <div id="content">
				<div class="12u">
					<input type="text" name="questionButton" id="question"> <a
						class="button special 12u" href="#" id="questionButton">질문!</a>
				</div>

				<div class="bs-glyphicons">
					<i class="fa fa-envelope-o" style="font-size: 36px"></i>
					<span class="w3-badge">${notRead}</span>
				</div>

			</div> --%>


			<div class="box alt">
				

					
					
						<ul class="my">
							<li>
								<h4>성격 &amp; 유형</h4>
								<p>
								<div class="image">
									<img class="col-sm-3 col-md-3"
										src="/resources/images/layout/KakaoTalk_20190129_213128976.jpg"
										alt="Pic 01" width="250" height="250">
								</div>
								<a class="button" href="/user/addTypeView/${me.userId}">select</a>
							</li>
							<li>
								<h4>쪽지</h4>
								<div class="image">
									<img class="col-sm-3 col-md-3"
										src="/resources/images/layout/letterother.jpg" alt="Pic 01"
										width="250" height="250" />
								</div>
								<a href="#" class="button" id="letterList">open</a>
							</li>
							<li>
								<h4>활동관리</h4>
								<div class="image">
									<img class="col-sm-3 col-md-3" alt="Pic 01"
										src="/resources/images/layout/act.jpg" width="250" height="250" />
								</div>
								<a href="/user/userAct/actMain.jsp" class="button"
									id="actMainButton">move</a>
							</li>
							<li>
								<h4>개인정보조회</h4>
								<div class="image">
									<img class="col-sm-3 col-md-3" alt="Pic 01"
										src="/resources/images/layout/users.png" width="250"
										height="250" />
								</div>
								<a href="/user/getUser/${me.userId}" class="button"
									id="myInfoButton">move</a>
							</li>
						</ul>

					


				





				<br />
				<br />
				<div class="col-sm-6 col-md-6">
					<br />
					<button id="leaveSite" type="button" >
						<p>사이트 탈퇴</p>
					</button>
				</div>
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