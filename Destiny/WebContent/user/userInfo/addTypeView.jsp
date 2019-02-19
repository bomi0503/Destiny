<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우리들의 연결고리</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet"> 


<!-- //All CSS Insert -->


<!-- All js -->
<link rel="stylesheet" href="/resources/css/main.css" >
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script type="text/javascript">

		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "a[name='ok']" ).on("click" , function() {
				fncAddType();
			});
		});	
		
		 $(function() {
			 function checkbox_fn() {
				 if( $('.inter-chk:checked').length >= 3 ) {
					 $('.inter-chk').attr('disabled', true);
					 $('.inter-chk:checked').attr('disabled', false);
				 } else {
					 $('.inter-chk').attr('disabled', false);
				 }	 
			 };
			 
			 $('.inter-chk').on('change', function() {
				 checkbox_fn(); 
			}); 
			 
			 checkbox_fn();
		 });
		 
		 function fncAddType(){
			 alert("버튼22");
			 var myType = $("select[name='myTypeSelect']").val();
			
			 var typeName = myType.split("/")[0];
			 myType = myType.split("/")[1];
			 
			 var otherType = [];
			 $('input:checkbox[type=checkbox]:checked').each(function () {
				 otherType.push($(this).val());
			 });
			 
			 alert('myType :'+myType);
			 alert('otherType :'+otherType);
			 
			$("input:hidden[name='firstType']").val( otherType[0] );
			$("input:hidden[name='secondType']").val( otherType[1] );
			$("input:hidden[name='thirdType']").val( otherType[2] );
			$("input:hidden[name='myType']").val( myType );
			
			$("form").attr("method" , "POST").attr("action" , "/user/addType").submit();		 
		 }
		 
		 $(function() {
			$( "#myType" ).on("change" , function() {
				
				var type = $(this).val();
				alert('type : ' + type);
				
				var typeName = type.split("/")[0];
				var typeNo = type.split("/")[1];
				
				var typeImg = '<img src="/resources/images/mbti/'+typeName+'.png"/>'
				
				$('#myTypeImg').html(typeImg);
				});
			});
		
	</script>
	<!-- //All js -->
	
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
			background-image : url("/resources/images/background/complainbg.jpg");
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
		
		.smallNavi li img{
			margin-top:0;
			width:auto;
		}
		
		.homeImg{
			margin-top : -2px;
		}
		
		section.wrapper, article.wrapper {
	    	padding: 500px 0;
		}
		
		.flex div{
			padding : 3em;
			border : 2px solid #ffbcc7;
			border-radius : 25px;
		}
		.flex h3{
			font-family: 'Nanum Myeongjo', serif;
		}
		
		img {
		    margin-top: 20px;
		    width: 185px;
		    vertical-align: middle;
		}
		
		.text-center {
		    text-align: center;
		}
		
		h2 {
		    font-size: 1.5em;
		    margin-bottom: 15px;
		}
		
		h4 {
		    font-size: 18px;
		}
		
		h3 {
		    font-size: 1.75em;
		    display: inline-block;
		    /* margin: auto; */
		}
		
		main.types-list .type-chart .type-item {
		    cursor: pointer;
		    text-align: center;
		    transition: all .1s;
		    color: #4C4C4C;
		    display: block;
		}
		
		.types-list.international .type-chart {
		    padding: 30px 15px;
		}
		
		main.types-list .type-chart {
		    border-top: 1px solid #eee;
		    padding: 30px 0;
		    margin-top: 30px;
		}
		
		main.types-list .type-chart .type-item h4 {
		    margin: 20px 0 5px;
		    text-transform: uppercase;
		}
		
		main.types-list .type-chart .type-item .type-snippet {
		    font-size: .7em;
		    text-align: center;
		    padding: 0 5px 25px;
		}
		
		.main-wrapper.international h1, .main-wrapper.international h2, .main-wrapper.international h3, .main-wrapper.international h4, .main-wrapper.international h5 {
		    letter-spacing: .03em;
		    font-weight: 700;
		    text-transform: uppercase;
		}
		
		main.types-list .type-chart .row:nth-of-type(2) .type-item h5 {color: #734C5F;}
		main.types-list .type-chart .row:nth-of-type(4) .type-item h5 {color: #728D56;}
		main.types-list .type-chart .row:nth-of-type(6) .type-item h5 {color: #51A9AB;}
		main.types-list .type-chart .row:nth-of-type(8) .type-item h5 {color: #E5C82E;}
		
		a {text-decoration: none;}
		.btn-action-2 {color: #FFF; background-color: #51A9AB; display: block; float: right; margin-top: 25px;}
		
		.btn{
		    font-weight: 500;
		    padding: 10px 15px;
		    border-radius: 3px;
		    border: none;
		    transition: all .1s ease-in-out;
		    outline: 0!important;
		    color: #FFF;
		}
		
		.form-control{-webkit-appearance: menulist;}
		
	</style>
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>MBTI <span class="slim"> Type</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->

	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
		<!-- 페이지 내부 네비게이션 경로 : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
			<li>></li>
			<li>마이페이지</li>
			<li>></li>
			<li>MBTI Type</li>
		</ul>
		<!-- 페이지 내부 네비게이션 경로 : end -->
		
		<form action="horizontal" style="clear:both;">
			<div>
				<table class="row-table tablebm">
					<caption>테이블 설명</caption>
					
					<colgroup>
						<col style="width:50%;">
						<col style="width:50%;">
					</colgroup>
					
					<tbody>
						
						<tr>
							<th>나의 성격유형</th>
							<th>내가 원하는 상대방의 성격유형</th>
						</tr>
						
						<tr>
							<td>
							<div class="row">
								<div class="4u 12u$(small) select-wrapper">
									<select class="form-control" id="myType" name="myTypeSelect">
										<c:set var="i" value="10000"/>
										<c:forEach var="file" items="${list}">
											<%-- <option value="${i}" ${ (! empty userList) && (userList[0] == i) ? 'selected' : '' }>${file}</option> --%>
											<option value="${file}/${i}" ${ (! empty userList) && (userList[0] == i) ? 'selected' : '' }>${file}</option>
											<c:set var="i" value="${i+1}"/>
										</c:forEach>
									</select>
									<input type="hidden" name="myType">
								</div>
								<div class="8u 12u$(small)" id="myTypeImg">
									<c:set var="i" value="10000"/>
									<c:forEach var="file" items="${list}">
										<c:if test="${ (! empty userList) && (userList[0] == i)}">
											<img src="/resources/images/mbti/${file}.png"/>
										</c:if>
										<c:set var="i" value="${i+1}"/>
									</c:forEach>
								</div>
							</div>
							
							</td>
							
							<td>
								<div class="row uniform">
									<c:set var="i" value="10000"/>
									<c:forEach var="file" items="${list}">
										<div class="3u 6u$(small)">
											<input type="checkbox" name="otherType" id="otherType${i}" value="${i}" class="inter-chk" ${ (! empty userList) && (userList[1] == i || userList[2] == i || userList[3] == i) ? 'checked' : '' }>
											<label for="otherType${i}">${file}</label>
										</div>
										<c:set var="i" value="${i+1}"/>
									</c:forEach>
									<input type="hidden" name="firstType">
									<input type="hidden" name="secondType">
									<input type="hidden" name="thirdType">
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<ul class="actions align-center">
					<li><a href="#" class="button" name="reset">취소</a></li>
					<li><a href="#" class="button" name="ok">성격등록</a></li>
				</ul>
			</div>
		</form>
		
		<main class="types-list international">
		
			<div class="types-list-header">
				<h3>성격 유형</h3>
				<a href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC" class="btn btn-action-2">TEST 하러가기<span class="fa fa-caret-right"></span></a>
			</div>
			
			
			<div class="type-chart">
			
				<div class="text-center">
		            <h2>분석형</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/intj-architect.svg">
						<h4>“용의주도한 전략가”</h4>
	                    <h5>INTJ (-A/-T)</h5>
	                    <div class="type-snippet">상상력이 풍부하며 철두철미한 계획을 세우는 전략가형.</div>
					</div>
					<div class="3u 6u$(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/intp-logician.svg">
	                    <h4>“논리적인 사색가”</h4>
	                    <h5>INTP (-A/-T)</h5>
	                    <div class="type-snippet">끊임없이 새로운 지식에 목말라 하는 혁신가형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/entj-commander.svg">
	                    <h4>“대담한 통솔자”</h4>
	                    <h5>ENTJ (-A/-T)</h5>
	                    <div class="type-snippet">대담하면서도 상상력이 풍부한 강한 의지의 소유자로 다양한 방법을 모색하거나 여의치 않을 경우 새로운 방안을 창출하는 리더형.</div>
					</div>
					<div class="3u 6u$(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/entp-debater.svg">
	                    <h4>“뜨거운 논쟁을 즐기는 변론가”</h4>
			            <h5>ENTP (-A/-T)</h5>
			            <div class="type-snippet">지적인 도전을 두려워하지 않는 똑똑한 호기심형.</div>
					</div>
				</div>
				
				<div class="text-center">
		            <h2>외교형</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						 <img src="https://storage.googleapis.com/neris/public/images/types/infj-advocate.svg">
	                     <h4>“선의의 옹호자”</h4>
	                     <h5>INFJ (-A/-T)</h5>
	                     <div class="type-snippet">조용하고 신비로우며 샘솟는 영감으로 지칠 줄 모르는 이상주의자.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/infp-mediator.svg">
	                    <h4>“열정적인 중재자”</h4>
	                    <h5>INFP (-A/-T)</h5>
	                    <div class="type-snippet">상냥한 성격의 이타주의자로 건강하고 밝은 사회 건설에 앞장서는 낭만형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/enfj-protagonist.svg">
	                    <h4>“정의로운 사회운동가”</h4>
	                    <h5>ENFJ (-A/-T)</h5>
	                    <div class="type-snippet">넘치는 카리스마와 영향력으로 청중을 압도하는 리더형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						 <img src="https://storage.googleapis.com/neris/public/images/types/enfp-campaigner.svg">
	                     <h4>“재기발랄한 활동가”</h4>
			             <h5>ENFP (-A/-T)</h5>
			             <div class="type-snippet">창의적이며 항상 웃을 거리를 찾아다니는 활발한 성격으로 사람들과 자유롭게 어울리기를 좋아하는 넘치는 열정의 소유자.</div>
					</div>
				</div>
				
				<div class="text-center">
		            <h2>관리자형</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						 <img src="https://storage.googleapis.com/neris/public/images/types/istj-logistician.svg">
	                     <h4>“청렴결백한 논리주의자”</h4>
	                     <h5>ISTJ (-A/-T)</h5>
	                     <div class="type-snippet">사실에 근거하여 사고하며 이들의 행동이나 결정 사항에 한 치의 의심을 사지 않는 현실주의자형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/isfj-defender.svg">
	                    <h4>“용감한 수호자”</h4>
	                    <h5>ISFJ (-A/-T)</h5>
	                    <div class="type-snippet">소중한 이들을 수호하는 데 심혈을 기울이는 헌신적이며 성실한 방어자형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/estj-executive.svg">
	                    <h4>“엄격한 관리자”</h4>
	                    <h5>ESTJ (-A/-T)</h5>
	                    <div class="type-snippet">사물이나 사람을 관리하는 데 타의 추종을 불허하는 뛰어난 실력을 갖춘 관리자형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/esfj-consul.svg">
	                    <h4>“사교적인 외교관”</h4>
	                    <h5>ESFJ (-A/-T)</h5>
	                    <div class="type-snippet">타인을 향한 세심한 관심과 사교적인 성향으로 사람들 내에서 인기가 많으며, 타인을 돕는데 열성적인 세심형.</div>
					</div>
				</div>
				
				<div class="text-center">
		            <h2>탐험가형</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/istp-virtuoso.svg">
	                    <h4>“만능 재주꾼”</h4>
	                    <h5>ISTP (-A/-T)</h5>
	                    <div class="type-snippet">대담하고 현실적인 성향으로 다양한 도구 사용에 능숙한 탐험형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/isfp-adventurer.svg">
	                    <h4>“호기심 많은 예술가”</h4>
	                    <h5>ISFP (-A/-T)</h5>
	                    <div class="type-snippet">항시 새로운 것을 찾아 시도하거나 도전할 준비가 되어 있는 융통성 있는 성격의 매력 넘치는 예술가형. </div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/estp-entrepreneur.svg">
	                    <h4>“모험을 즐기는 사업가”</h4>
	                    <h5>ESTP (-A/-T)</h5>
	                    <div class="type-snippet">벼랑 끝의 아슬아슬한 삶을 진정으로 즐길 줄 아는 이들로 명석한 두뇌와 에너지, 그리고 뛰어난 직관력을 가지고 있는 유형.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/esfp-entertainer.svg">
	                    <h4>“자유로운 영혼의 연예인”</h4>
	                    <h5>ESFP (-A/-T)</h5>
	                    <div class="type-snippet">주위에 있으면 인생이 지루할 새가 없을 정도로 즉흥적이며 열정과 에너지가 넘치는 연예인형.</div>
					</div>
				</div>
			</div>
		</main>

		</div>
	</div>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>