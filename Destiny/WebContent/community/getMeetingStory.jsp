<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>

 
 <!-- 참조 : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
 
<script type="text/javascript">
	
	$(function(){
		
		/* 목록 버튼 이벤트 : start */
		$("button:contains('목록')").on("click", function() {
			self.location = "/meetingStory/listMeetingStory"
		});
		/* 목록 버튼 이벤트 : end */
		
		/* 글쓰기 버튼 이벤트 : start */
		$("button:contains('글쓰기')").on("click", function() {
			self.location = "/meetingStory/addMeetingStory"
		});
		/* 글쓰기 버튼 이벤트 : end */
		
		/* 신고 버튼 이벤트 : start */
		$(".complain").on("click", function() {
			self.location = "/complain/addComplain?communityNo=${community.communityNo}"
		});
		/* 신고 버튼 이벤트 : end */
		
		/* 수정 버튼 이벤트 : start */
		$(".modify").on("click", function() {
			//self.location = "/info/updateRestaurantInfo?communityNo="+${community.communityNo}
			self.location = "/meetingStory/updateMeetingStory?communityNo=${community.communityNo}"
		});
		/* 수정 버튼 이벤트 : end */
		
		/* 수정 버튼 이벤트 : start */
		$(".delete").on("click", function() {
			//self.location = "/info/updateRestaurantInfo?communityNo="+${community.communityNo}
			self.location = "/meetingStory/deleteMeetingStory?communityNo=${community.communityNo}"
		});
		/* 수정 버튼 이벤트 : end */
		
		/* 공감 버튼 이벤트 : start */
			$('.btn-heart').on("click", function() {
			var communityNo = ${community.communityNo}
			console.log(communityNo);
			
			$.ajax({
				method : "POST",
				url : '/meetingStory/json/likeMeetingStory/'+communityNo,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				success : function(JSONData, state){
					console.log(JSONData);
					var like = JSONData.community.like;
					$("#likeCount").html(like);
					
					/* 보미 작업중 */
					var likeCount = JSONData.likeCount.likeCountCheck;
					console.log('likecount : ' + likeCount);
					var likeId = JSONData.likeCount.likeCountId;
					console.log('likeId : ' + likeId);
					var likeCommunityNo = JSONData.likeCount.likeCountCommunityNo;
					console.log('likeCommunityNo : ' + likeCommunityNo);
					
					changeBtn(likeId, likeCount, likeCommunityNo);
					/* 보미 작업중 */
					
				}
			});
		});
		/* 공감 버튼 이벤트 : end */
		
		/* 이전글 클릭 : start */
		$("button:contains('이전글')").on("click", function(){
			var communityNo = $(this).data("param")
			self.location="/meetingStory/getPreMeetingStory?communityNo="+communityNo
		});
		/* 이전글 클릭 : end */
		
		/* 다음글 클릭 : start */
		$("button:contains('다음글')").on("click", function(){
			var communityNo = $(this).data("param")
			self.location="/meetingStory/getNextMeetingStory?communityNo="+communityNo
		});
		/* 다음글 클릭 : end */
	});
		
	function changeBtn(likeId, likeCount, likeCommunityNo){
		
		/* $('.btn-heart').on('click', function() { */
			var $this = $('.btn-heart');
			if( likeId=='${me.userId}' && (likeCount == 'Y' || likeCount == null)){
				$this.addClass('on');
			}else if( likeId=='${me.userId}' && likeCount == 'N' ){
				$this.removeClass('on');
			}
		/* }); */
	}
		
</script>

<style>

	body{
		position : relative;
		font-family: 'Nanum Myeongjo', serif;
	}
	.button{
		font-size : 16px;
		font-weight : 700;
	}
	
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/meetingStoryBackground.jpg");
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
	h1 .slim{font-weight : lighter;}
	
	/* .wrap{margin-top : 400px;} */
	
	.rightBtn{float : right; margin-left : 6px;}
	
	.wrapContents{margin-bottom : 100px;border : 1px solid #ffc6cf;padding : 30px;border-radius:10px;}

	.btn-heart{width:16px; height:16px; border:none; background:url(../resources/images/img_heart.png) no-repeat 0 0; cursor:pointer;background-size : contain;margin-top:3px;}
	.btn-heart.on{background:url(../resources/images/img_heart_on.png) no-repeat 0 0;background-size : contain;}
	
	
	.righttSort{text-align : right;}
	
	.firstRow{padding-bottom : 10px;border-bottom : 1px dashed #E3E4E6;}
	
	.secondRow{padding-top : 10px;}
	
	.thirdRow{overflow : hidden;}
	
	ul{float : left;}
	
	.contentsDetail{padding : 50px 10px;}
	
	.firstColumn {font-weight : bold;}
	
	.count{
		padding : 10px;
		content : '';
		display : block;
		clear : both;	
	}
		.count button{
			box-shadow : none;
			border-radius : 0;
		}
		.count button:hover{
			background-color : transparent;
		}
	
	.count li{float : left;list-style-type : none;margin-right : 10px;}
	
	.service{float : right;overflow : hidden;padding : 10px;}
	
	.service li{float : left;list-style-type : none;margin-left : 10px;cursor : pointer;}
	
	.service li:hover{font-weight : bold;}
	
	li{list-style-type : none;}
	
	/* .container{
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
	
	.homeImg{margin-top : -2px;}
	
	.topBtn{
		padding : 10em 0 1em 0;
	}
	.informationWrap{
		padding : 0 0 1em 0;
	}
	.informationWrap .title{
		display : inline-block;
		width : 15em;
	}
	.informationWrap .category{
		display : inline-block;
		width : 10em;
	}
	.informationWrap .date{
		display : inline-block;
		float : right;
	}
	.detail{
		padding : 2em 0 2em 0;
	}
	.control{
		content : '';
		display : block;
		clear : both;
		background : red;
		margin-bottom : 10em;
		
	}
	
	
	/* 빵메뉴 안맞아서 따로 만듬^^ */
	.fa{
		line-height : 50px;
	}
	
	#footer{
		margin : 0 auto !important;
		text-align : center !important;
	}
	.actions{
		margin : 0 auto !important;
	}
</style>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="topImg">
		<h1>모임후기</span></h1>
	</div>

	<div class="container">
	 
		<div class="wrap">
		
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>스토리</li>
			<li>></li>
			<li>모임후기</li>
		</ul>
		
		<div class="topBtn">
			<button type="button" data-param="${ community.communityNo }" class="button">이전글</button>
			<button type="button" data-param="${ community.communityNo }" class="button">다음글</button>
			
			<button type="button" class="button rightBtn">목록</button>
			<!-- <button type="button" class="button rightBtn">글쓰기</button> -->
		</div>
		
		<div class="wrapContents">

		<div class="informationWrap">
			<div class="title">${ community.title }</div>
			<c:if test="${community.category == 'RES'}">
				<div class="category">맛집정보</div>
			</c:if>
			<c:if test="${community.category == 'MET'}">
				<div class="category">모임후기</div>
			</c:if>
			<c:if test="${community.category == 'DAT'}">
				<div class="category">만남후기</div>
			</c:if>
			<c:if test="${community.category == 'LUV'}">
				<div class="category">연애조언</div>
			</c:if>
			<c:if test="${community.category == 'NTC'}">
				<div class="category">공지사항</div>
			</c:if>
			<div class="date">${ community.writeDate }</div>
		</div>

		<div class="informationWrap">
			<div class="title">${ community.writerNickName }</div>
			<c:if test="${community.userGrade == 'NEW'}">
				<div class="category">신규회원</div>
			</c:if>
			<c:if test="${community.userGrade == 'NOR'}">
				<div class="category">일반회원</div>
			</c:if>
			<c:if test="${community.userGrade == 'VIP'}">
				<div class="category">우수회원</div>
			</c:if>
			<c:if test="${community.userGrade == 'ADM'}">
				<div class="category">관리자</div>
			</c:if>
		</div>
		
		<div class="detail">
			<div class="">${ community.detail }</div>
		</div>
		
		<div class="control">
			<ul class="count">
				<li>조회수 ${ community.views }</li>
				<li><span>|</span></li>
				<li>공감수 <span id="likeCount">${ community.like }</span></li>
				<li>
					<c:if test= '${likeCount.likeCountCheck=="Y"}'>
						<button type="button" class="btn-heart on"></button>
					</c:if>
					<c:if test= '${likeCount.likeCountCheck=="N" || likeCount.likeCountCheck==null}'>
						<button type="button" class="btn-heart"></button>
					</c:if>
				</li>
			</ul>
			<ul class="service">
				<c:set var="userId" value="${me.userId }"/>
				<c:set var="writerId" value="${community.writerId }"/>
				<c:if test="${userId == writerId}">
					<li class="modify">수정</li>
					<li><span>|</span></li>
				</c:if>
				<li class="complain">신고</li>
				<c:if test="${userId == writerId}">
					<li><span>|</span></li>
					<li class="delete">삭제</li>
				</c:if>
			</ul>
		</div>
		
		<!-- 댓글 : start -->
		<jsp:include page="/comment/addComment.jsp" />
		<!-- 댓글 : end -->
		
		</div>
		
		</div>
	 
	</div>
<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
</body>
</html>