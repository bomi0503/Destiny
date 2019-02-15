<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
	<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>�쿬</title>
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
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "a[name='update']" ).on("click" , function() {
					self.location = "/user/updateUser/${user.userId}";
				});
			 $( "a[name='back']" ).on("click" , function() {
					history.go(-1);
				});
		});
		
	</script>
	
	<style>
		.userInfo {vertical-align: middle; background-color: #F8E6E0; }
		body{
			position : relative;
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
			background-image : url("/resources/images/background/userlistbg.png");
			background-repeat : no-repeat;
			background-position : center -280px;
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
			font-family: 'Nanum Myeongjo', serif;
			position : absolute;
			line-height : 450px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
		}
		
		h1 .slim{
			font-family: 'Nanum Myeongjo', serif;
			font-weight : lighter;
		}
		.wrap{
			margin-top : 400px;
		}
		
		li{
			list-style-type : none;
		}
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -30px;
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
		.profileImg{overflow:hidden; max-width:350px; max-height:350px; margin:-150px auto 0; text-align:center; border:3px solid #AAA; border-radius:50%;}
		.profileImg img{max-width:350px; max-height:350px;}
		.subTitle{font-size:15px; font-weight:900;}
	</style>
	
</head>

<body>

	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>ȸ��<span class="slim">����Ʈ</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<section id="main" class="wrapper">
		<div class="inner">
		
		<div class="box" style="margin-top:80px;">
			<div class="profileImg">
				<c:set var="i" value="0" />
				<c:forEach var="file" items="${filelist}" >
					<c:set var="i" value="${ i+1 }" />
					<img src="/resources/images/userprofile/${file}">
				</c:forEach>
			</div>
			
			<hr/>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle" >���̵�</div>
				<div class="3u 12u$(small)">${user.userId} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (��� ${user.warningCount}ȸ)</div>
				<div class="3u 12u$(small) subTitle">�г���</div>
				<div class="3u 12u$(small)">${user.nickName}</div>
			</div>
			<hr/>
			<%-- <div class="row uniform">
				<div class="3u 12u$(small)">�г���</div>
				<div class="9u$ 12u$(small)">${user.nickName}</div>
			</div> --%>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle">ȸ�����</div>
				<c:if test="${user.userGrade=='NEW'}">
					<div class="3u 12u$(small)">�ű�ȸ��</div>
				</c:if>
				<c:if test="${user.userGrade=='NOR'}">
					<div class="3u 12u$(small)">�Ϲ�ȸ��</div>
				</c:if>
				<c:if test="${user.userGrade=='VIP'}">
					<div class="3u 12u$(small)">���ȸ��</div>
				</c:if>
				<c:if test="${user.userGrade=='ADM'}">
					<div class="3u 12u$(small)">������</div>
				</c:if>
				<c:if test="${user.userGrade=='BLK'}">
					<div class="3u 12u$(small)">��������Ʈ</div>
				</c:if>
				<div class="3u 12u$(small) subTitle">�⼮��</div>
				<div class="3u 12u$(small)">${user.attendCount}��</div>
			</div>
			<hr/>
			<%-- <div class="row uniform">
				<div class="3u 12u$(small)">�⼮��</div>
				<div class="9u$ 12u$(small)">${user.attendCount}</div>
			</div> --%>
			<%-- <div class="row uniform">
				<div class="3u 12u$(small)">���Ƚ��</div>
				<div class="9u$ 12u$(small)">${user.warningCount} ȸ</div>
			</div> --%>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle">��������</div>
				<div class="3u 12u$(small)">${user.address}</div>
				<div class="3u 12u$(small) subTitle">�������</div>
				<div class="3u 12u$(small)">${user.birthday}</div>
			</div>
			<hr/>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle">����ó</div>
				<div class="3u 12u$(small)">${user.phone}</div>
				<div class="3u 12u$(small) subTitle">�̸���</div>
				<div class="3u 12u$(small)">${user.email}</div>
			</div>
			<hr/>
			<%-- <div class="row uniform">
				<div class="3u 12u$(small)">�̸���</div>
				<div class="9u$ 12u$(small)">${user.email}</div>
			</div> --%>
			<%-- <div class="row uniform">
				<div class="3u 12u$(small)">�������</div>
				<div class="9u$ 12u$(small)">${user.birthday}</div>
			</div> --%>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle">���ɻ�</div>
				<div class="3u 12u$(small)">${interestList[0]}</div>
				<div class="3u 12u$(small)">${interestList[1]}</div>
				<div class="3u 12u$(small)">${interestList[2]}</div>
			</div>
			<hr/>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle">�� ��������</div>
				<div class="4u 12u$(small)">${typeMap.myType}</div>
				<div class="5u 12u$(small)">
					<img src="/resources/images/mbti/${typeFileMap.myTpyeFile}" width="150" height="200"/>
				</div>
			</div>
			<hr/>
			<div class="row uniform">
				<div class="3u 12u$(small) subTitle">���� ��������</div>
				<div class="3u 12u$(small)">${typeMap.firstType}</div>
				<div class="3u 12u$(small)">${typeMap.secondType}</div>
				<div class="3u 12u$(small)">${typeMap.thirdType}</div>
			</div>
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
		
		</div>
		
		<ul class="actions align-center">
			<li><a href="#" class="button" name="back">����</a></li>
			<li><a href="#" class="button special" name="update">�����ϱ�</a></li>
		</ul>
		
		
 		</div>
 	</section>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
 	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->

</body>

</html>