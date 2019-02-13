<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
    
    <script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
    <link rel="stylesheet" href="/resources/css/main.css">
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	*{
		margin : 0;
		padding : 0;
	}
	.letter_icon{
			display : inline-block;
			width : 22px;
			height : 22px;
			background : url("/resources/icon/envelope.png");
			background-size : cover;
			margin-right : 10px;
		}
	#top{
			background : #ff264a;
		}
			#top h1{
				color : white;
				margin : 0;
				padding : 14px 20px;
				font-size : 30px;
				font-weight : bold;
			}
	.wrap{
		padding : 1em;
	}
	.tit{
		margin-bottom : 10px;
		padding : 5px;
		font-weight : bolder;
	}
	.co{
		margin-bottom : 20px;
		border-radius : 5px;
		border : 1px solid #ff264a;
		padding : 5px;
		color : gray;
	}
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {
		$( "button:contains('답장')" ).on("click" , function() {
			var sender = $("input[id='sender']").val();
			self.location = "/letter/sendLetterView/"+sender;
		});
		
		
		$("button:contains('뒤로')").on("click" , function() {
			if (${from == 'getList'}) {
				self.location = "/letter/getLetterList";	
			}else if (${from == 'sendList'}) {
				self.location = "/letter/sendLetterList";
			}
		});
		
	});
	
	
	</script>
	
</head>


<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div id="top">
		<h1><span class="letter_icon"></span>쪽지</h1>
	</div>
	
	<div class="wrap">
		
		<div class="recevieUserId">
			<p class="tit">수신자ID</p>
			<p class="co">${letter.receiverId}</p>
		</div>
		
		<div class="sendUserId">
			<p class="tit">발신자ID</p>
			<p class="co">${letter.senderId}</p>
			<input type="hidden" id="sender" value="${letter.senderId}">
		</div>
		
		<div class="letterTitle">
			<p class="tit">제목</p>
			<p class="co">${letter.letterTitle}</p>
		</div>
		
		<div class="letterDetail">
			<p class="tit">내용</p>
			<p class="co">${letter.letterDetail}</p>
		</div>
		
		<div>
			<c:if test="${me.userId eq letter.receiverId}">	
		    	<button type="button">답장</button>
		    </c:if>
		    <button type="button">뒤로</button>
		</div>
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
		  
	
</body>
</html>

