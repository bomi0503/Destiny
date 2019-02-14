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
<link rel="stylesheet" href="/resources/css/main.css" >
<!-- //All CSS Insert -->

<!-- All js -->
<!-- 부트스트랩 CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>


<!--  템플릿 사용하기 위해 필요한 js -->
<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>
<!-- //All js -->
	
	<script>
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 //$("form").attr("method" , "POST").attr("action" , "/user/sendLetter").submit();
			 var sender = $("input[id='sender']").val();
			 
			 self.location = "/letter/sendLetterView/"+sender;
		});
	});
		
		
			//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
			function fncGetList(currentPage) {
				$("#currentPage").val(currentPage)
				$("form").attr("method" , "GET").attr("action" , "/letter/sendLetterList").submit();
			}
			
			$(function() {
				$(".ct_list_pop td:nth-child(8n+7)").on("click" , function() {
					var letterNo = $(this).data("param");
					
					self.location = "/letter/getLetter?no="+letterNo+"&from=sendList";
					
				});
			});
			
			/*$(function() {
				 $( "button.btn.btn-primary" ).on("click" , function() {
					 $("form").attr("method" , "POST").attr("action" , "/letter/sendletter.jsp").submit();
				});
			});*/
	
	</script>
	
	<style>
		ul{
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
				padding : 20px;
				font-size : 30px;
				font-weight : bold;
			}
		#left{
			display : inline-block;
			float : left;
		}
			#left li{
				list-style-type : none;
				border-bottom : 1px solid #ff264a;
				padding : 0;
			}
			#left a{
				display : block;
				text-decoration : none;
				color : #444444;
				padding : 20px;
			}
			#left a:hover{
				cursor : pointer;
				background : #ff264a;
				color : white;
				font-weight : bold;
				transition : 1s;
			}
		#right{
			float : left;
			width : 969px;
			height : 498px;
			padding : 2em;
			border-left : 1px solid #ff264a;
		}
	</style>

</head>

<body >	

	<!-- contents -->
	<section id="top">
		<h1><span class="letter_icon"></span>쪽지</h1>
	</section>
	<section id="left">
		<ul>
			<li><a href="/letter/getLetterList">받은 쪽지함</a></li>
			<li><a href="/letter/sendLetterList">보낸 쪽지함</a></li>
		</ul>
	</section>
	<section id="right">
		
		<form class="form-horizontal">

			<div class="box alt">
				<div class="row 50% uniform">
					
					<label for="senderId">보낸 쪽지함 | 전체  ${resultPage.totalCount } 건수</label>
					<span id="receiverId"></span>
					
					<table class="table table-hover table-striped" >
					<thead>
						<tr>
							<td class="ct_list_b" width="100">쪽지번호</td>
							<td class="ct_line02"></td>
							<td class="ct_list_b" width="100">수신자</td>
							<td class="ct_line02"></td>
							<td class="ct_list_b" width="150">수신일</td>
							<td class="ct_line02"></td>
							<td class="ct_list_b" width="150">쪽지제목</td>
							<td class="ct_line02"></td>
						</tr>
					</thead>
					
					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="letter" items="${listSend}">
							<c:set var="i" value="${ i+1 }" />
			
							<tr class="ct_list_pop">
							<td align="left">${letter.letterNo}</td>
							<td></td>		
							<td align="left">${letter.receiverId}</td>
							<td></td>
							<td align="left">${letter.getLetterDate}</td>
							<td></td>
							<td align="left" data-param="${letter.letterNo}">${letter.letterTitle}</td>
							<td></td>
					
						</c:forEach>
					</tbody>
				</table>

					 <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
	
					<ul class="actions small">					
						<li><a class="button special small" href="/letter/sendletter.jsp">작성</a></li>
						<!-- <li><a class="button special small" href="/letter/letterMain.jsp">메인으로</a></li> -->
					</ul>


				</div>
			</div>
			</form>
		
	<jsp:include page="/common/pageNavigator_new.jsp"/>
	</section>
	
	
	<!-- <section id="main" class="wrapper">
		<div class="inner">
		
		<h3>쪽지 main</h3>
		<br/>
			<div class="box alt">
				<div class="row 50% uniform">
				
					<div class="4u">
					<p>
					<a href="/letter/getLetterList">받은 쪽지함</a>
					<br/></div>

					<div class="4u">
					<p >
					<a href="/letter/sendLetterList">보낸 쪽지함</a>
					<br/></div>
					

				</div>
			</div>
		</div>
		
	</section> -->
	<!-- //contents -->

	
	
	
	
</body>
</html>