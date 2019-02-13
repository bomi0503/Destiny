<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
	
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" >
<!-- //All CSS Insert -->
	
	
	
	<script>
	$(function(){
		
		/* 내가 쓴 게시글 링크 */
		$(".user-act-top li:nth-child(1)").on("click",function(){
			self.location = "/act/getWriteCommunityList/${me.userId}";
		});
		
		/* 내가 쓴 댓글 링크 */
		$(".user-act-top li:nth-child(2)").on("click",function(){
			self.location = "/act/getCommentListByWriter/${me.userId}";
		});
		
		/* 개설한 모임 링크 */
		$(".user-act-top li:nth-child(3)").on("click",function(){
			self.location = "/act/getOpenMeetingList/${me.userId}";
		});
		
		/* 가입한 모임 링크 */
		$(".user-act-bottom li:nth-child(1)").on("click",function(){
			self.location = "/act/getJoinMeetingList/${me.userId}";
		});
		
		/* 성사된 만남 링크 */
		$(".user-act-bottom li:nth-child(2)").on("click",function(){
			self.location = "/act/getContactList/${me.userId}";
		});
		
	});
	</script>
<!-- //All js -->
	
	
	<style>
		ul{
			margin : 0;
			padding : 0;
		}
		ul li{
			margin : 0;
			padding : 0;
			list-style-type : none;
		}
		
		.topImg{
			max-width : 100%;
			height : 400px;
			background-image : url("/resources/images/background/actBackground.jpg");
			background-position : center center;
			background-size : cover;
			background-repeat : no-repeat;
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
			width : 100%;
			margin : 0;
			padding : 0;
			font-family: 'Nanum Myeongjo', serif;
			font-size : 60px;
			text-align : center;
			height : 400px;
			line-height : 450px;
			color : white;
			z-index : 99;
			
		}
		
		
		.inner{
			text-align:center;
		}
			.inner .user-act-top a{
				color : #fd5d7c;
				text-decoration : none;
			}
			.inner .user-act-bottom a{
				color : #fd5d7c;
				text-decoration : none;
			}
		.user-act-top{
			display:inline-block;
		}
			.user-act-top li{
				float : left;
				padding:4.5em;
				width : 300px;
				height : 300px;
				text-align:center;
				border:2px solid #fd5d7c;
				border-radius:100%;
				margin : 0 30px 30px 0;
				transition: 1s;
			}
			.user-act-top li:last-child{
				margin-right : 0px;
			}
			.user-act-top li:hover{
				box-shadow: 15px 15px 0px 0px #ffbcc7;
				transform: translate(-5%, -5%);
				cursor : pointer;
			}
			.user-act-top .icon{
				margin : 0 auto;
				width : 50px;
				height : 50px;
				background : orange;
				margin-bottom : 40px;
			}
			.user-act-top .post_icon{
				background : url("/resources/icon/exam.png");
				background-size : cover;
			}
			.user-act-top .comment_icon{
				background : url("/resources/icon/talk.png");
				background-size : cover;
			}
			.user-act-top .make_icon{
				background : url("/resources/icon/workers.png");
				background-size : cover;
			}
		
		.user-act-bottom{
			display:inline-block;
		}
			.user-act-bottom li{
				float : left;
				padding:4.5em;
				width : 300px;
				height : 300px;
				text-align:center;
				border:2px solid #fd5d7c;
				border-radius:100%;
				margin : 0 30px 30px 0;
				transition: 1s;
			}
			.user-act-bottom li:last-child{
				margin-right : 0px;
			}
			.user-act-bottom li:hover{
				box-shadow: 15px 15px 0px 0px #ffbcc7;
				transform: translate(-5%, -5%);
				cursor : pointer;
			}
			.user-act-bottom .icon{
				margin : 0 auto;
				width : 50px;
				height : 50px;
				background : orange;
				margin-bottom : 40px;
			}
			.user-act-bottom .love_icon{
				background : url("/resources/icon/relationship.png");
				background-size : cover;
			}
			.user-act-bottom .join_icon{
				background : url("/resources/icon/network.png");
				background-size : cover;
			}
		
	.navPanelToggle{
		float : right;
	}		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- 메인배경이미지 : start -->
   	<div class="topImg">
		<h1>활동관리</h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<ul class="user-act-top">
				<li>
					<div class="icon post_icon"></div>
					<a href="/act/getWriteCommunityList/${me.userId}">작성한 게시글</a>
				</li>
				<li>
					<div class="icon comment_icon"></div>
					<a href="/act/getCommentListByWriter/${me.userId}">작성한 댓글</a>
				</li>
				<li>
					<div class="icon make_icon"></div>
					<a href="/act/getOpenMeetingList/${me.userId}">개설한 모임</a>
				</li>
			</ul>
			<ul class="user-act-bottom">
				<li>
					<div class="icon join_icon"></div>
					<a href="/act/getJoinMeetingList/${me.userId}">가입한 모임</a>
				</li>
				<li>
					<div class="icon love_icon"></div>
					<a href="/act/getContactList/${me.userId}">성사된 만남</a>
				</li>
			</ul>
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>