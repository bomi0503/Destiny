<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
	<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>우연</title>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	
   <!-- All CSS Insert -->
	<link rel="stylesheet" href="/resources/css/main.css" > 
   
   <script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "a[name='update']" ).on("click" , function() {
					self.location = "/user/updateUser/${user.userId}";
				});
			 $( "a[name='back']" ).on("click" , function() {
					history.go(-1);
				});
		});
		
	</script>
	
	<style>
		body{
			position : relative;
			font-family: 'Nanum Myeongjo', serif;
		}
		.container{
			font-weight : 700;
		}
		.tumTitle{
			font-weight : 700;
		}
	
		.topImg{
			display : block;
			position : absolute;
			top : 0;
			background-image : url("/resources/images/background/notice02_background.jpg");
			background-repeat : no-repeat;
			background-position : center -500px;
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
		}
		h1 .slim{
			font-weight : lighter;
		}
		.wrap{
			margin-top : 400px;
		}
		
		li{
			list-style-type : none;
		}
		
		/*  .container{
			overflow : hidden;
		} */
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -80px;
			margin-bottom : 60px;
		}
		
		.smallNavi li{
			float : left;
			margin-right : 20px;
			margin-top : 8em;
		}
		
		.homeImg{
			margin-top : -2px;
		}
		
		section.wrapper, article.wrapper {
	    	padding: 500px 0;
		}
		
		.box {
		    border: solid 1px #dbdbdb;
		    padding: 1.5em;
		    width: 70%;
		    margin: 40px auto;
		}
		
		.button-mbti {
		    background-color: transparent;
		    box-shadow: inset 0 0 0 3px #c5c5c5;
		    color: #c5c5c5 !important;
		    display: inline-block;
		    font-size: .75em;
		    height: 3.75em;
		    line-height: 3.85em;
		    padding: 0 4em;
		    text-decoration: none;
		}
		
		.profileImg{overflow:hidden; max-width:350px; max-height:350px; margin:-200px auto 0; text-align:center; border:3px solid #AAA; border-radius:50%;}
		.profileImg img{max-width:100%; max-height:100%;}
		.subTitle{font-size:15px; font-weight:900;}
	</style>
	
</head>

<body>

	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>회원<span class="slim">정보</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="wrap">
			
		<!-- 페이지 내부 네비게이션 경로 : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
			<li>></li>
			<li>마이페이지</li>
			<li>></li>
			<li>개인정보조회</li>
		</ul>
		<!-- 페이지 내부 네비게이션 경로 : end -->
		<div style="clear:both; padding-top:80px;">
			<div class="box">
				<div class="profileImg">
					<%-- <c:set var="i" value="0" />
					<c:forEach var="file" items="${filelist}" >
						<c:set var="i" value="${ i+1 }" />
						<img src="/resources/images/userprofile/${file}">
					</c:forEach> --%>
					<img src="/resources/images/userprofile/${user.profile}">
				</div>
				
				<hr/>
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle" >아이디</div>
					<div class="3u 12u$(small)">${user.userId} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (경고 ${user.warningCount}회)</div>
					<div class="3u 12u$(small) subTitle">닉네임</div>
					<div class="3u 12u$(small)">${user.nickName}</div>
				</div>
				<hr/>
				<%-- <div class="row uniform">
					<div class="3u 12u$(small)">닉네임</div>
					<div class="9u$ 12u$(small)">${user.nickName}</div>
				</div> --%>
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle">회원등급</div>
					<c:if test="${user.userGrade=='NEW'}">
						<div class="3u 12u$(small)">신규회원</div>
					</c:if>
					<c:if test="${user.userGrade=='NOR'}">
						<div class="3u 12u$(small)">일반회원</div>
					</c:if>
					<c:if test="${user.userGrade=='VIP'}">
						<div class="3u 12u$(small)">우수회원</div>
					</c:if>
					<c:if test="${user.userGrade=='ADM'}">
						<div class="3u 12u$(small)">관리자</div>
					</c:if>
					<c:if test="${user.userGrade=='BLK'}">
						<div class="3u 12u$(small)">블랙리스트</div>
					</c:if>
					<div class="3u 12u$(small) subTitle">출석일</div>
					<div class="3u 12u$(small)">${user.attendCount}일</div>
				</div>
				<hr/>
				<%-- <div class="row uniform">
					<div class="3u 12u$(small)">출석일</div>
					<div class="9u$ 12u$(small)">${user.attendCount}</div>
				</div> --%>
				<%-- <div class="row uniform">
					<div class="3u 12u$(small)">경고횟수</div>
					<div class="9u$ 12u$(small)">${user.warningCount} 회</div>
				</div> --%>
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle">거주지역</div>
					<div class="3u 12u$(small)">${user.address}</div>
					<div class="3u 12u$(small) subTitle">생년월일</div>
					<div class="3u 12u$(small)">${user.birthday}</div>
				</div>
				<hr/>
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle">연락처</div>
					<div class="3u 12u$(small)">${user.phone}</div>
					<div class="3u 12u$(small) subTitle">이메일</div>
					<div class="3u 12u$(small)">${user.email}</div>
				</div>
				<hr/>
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle">관심사</div>
					<div class="3u 12u$(small)">${interestList[0]}</div>
					<div class="3u 12u$(small)">${interestList[1]}</div>
					<div class="3u 12u$(small)">${interestList[2]}</div>
				</div>
				<hr/>
				
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
				
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle">내 성격유형</div>
					<c:if test="${typeMap.myType == null}">
						<div class="3u 12u$(small)">
							<a class="button-mbti" href="/user/addTypeView/${me.userId}">설정하기</a>
						</div>
					</c:if>
					
					<c:if test="${typeMap.myType != null}">
						<div class="4u 12u$(small)">${typeMap.myType}</div>
						<div class="5u 12u$(small)">
							<img src="/resources/images/mbti/${typeFileMap.myTpyeFile}" width="150" height="200"/>
						</div>
					</c:if>
					
					
				</div>
				
				<hr/>
				
				<div class="row uniform">
					<div class="3u 12u$(small) subTitle">상대방 성격유형</div>
					
					<c:if test="${typeMap.firstType == null && typeMap.secondType == null&& typeMap.thirdType == null}">
						<div class="3u 12u$(small)">
							<a class="button-mbti" href="/user/addTypeView/${me.userId}">설정하기</a>
						</div>
					</c:if>
					
					<c:if test="${typeMap.firstType != null && typeMap.secondType != null&& typeMap.thirdType != null}">
						<div class="3u 12u$(small)">${typeMap.firstType}</div>
						<div class="3u 12u$(small)">${typeMap.secondType}</div>
						<div class="3u 12u$(small)">${typeMap.thirdType}</div>
					</c:if>
				</div>
				
				<c:if test="${typeMap.firstType != null && typeMap.secondType != null&& typeMap.thirdType != null}">
					<div class="row uniform">
						<div class="3u 12u$(small)"></div>
						<div class="3u 12u$(small)">
							<img src="/resources/images/mbti/${typeFileMap.typeFileList[0]}" width="150" height="200"/>
						</div>
						<div class="3u 12u$(small)">
							<img src="/resources/images/mbti/${typeFileMap.typeFileList[1]}" width="150" height="200"/>
						</div>
						<div class="3u 12u$(small)">
							<img src="/resources/images/mbti/${typeFileMap.typeFileList[2]}" width="150" height="200"/>
						</div>
					</div>
				</c:if>
				<!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->
			
			</div>
			
			<ul class="actions align-center">
				<li><a href="#" class="button" name="back">이전</a></li>
				<li><a href="#" class="button special" name="update">수정하기</a></li>
			</ul>
			
			
	 		</div>
	 	</div>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
 	
 	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->

</body>

</html>