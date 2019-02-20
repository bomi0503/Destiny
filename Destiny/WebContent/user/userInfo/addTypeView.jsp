<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�츮���� �����</title>
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
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
			 alert("��ư22");
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
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>MBTI <span class="slim"> Type</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->

	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
		<!-- ������ ���� �׺���̼� ��� : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
			<li>></li>
			<li>����������</li>
			<li>></li>
			<li>MBTI Type</li>
		</ul>
		<!-- ������ ���� �׺���̼� ��� : end -->
		
		<form action="horizontal" style="clear:both;">
			<div>
				<table class="row-table tablebm">
					<caption>���̺� ����</caption>
					
					<colgroup>
						<col style="width:50%;">
						<col style="width:50%;">
					</colgroup>
					
					<tbody>
						
						<tr>
							<th>���� ��������</th>
							<th>���� ���ϴ� ������ ��������</th>
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
					<li><a href="#" class="button" name="reset">���</a></li>
					<li><a href="#" class="button" name="ok">���ݵ��</a></li>
				</ul>
			</div>
		</form>
		
		<main class="types-list international">
		
			<div class="types-list-header">
				<h3>���� ����</h3>
				<a href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC" class="btn btn-action-2">TEST �Ϸ�����<span class="fa fa-caret-right"></span></a>
			</div>
			
			
			<div class="type-chart">
			
				<div class="text-center">
		            <h2>�м���</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/intj-architect.svg">
						<h4>�������ֵ��� ��������</h4>
	                    <h5>INTJ (-A/-T)</h5>
	                    <div class="type-snippet">������ ǳ���ϸ� ö��ö���� ��ȹ�� ����� ��������.</div>
					</div>
					<div class="3u 6u$(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/intp-logician.svg">
	                    <h4>�������� �������</h4>
	                    <h5>INTP (-A/-T)</h5>
	                    <div class="type-snippet">���Ӿ��� ���ο� ���Ŀ� �񸻶� �ϴ� ���Ű���.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/entj-commander.svg">
	                    <h4>������� ����ڡ�</h4>
	                    <h5>ENTJ (-A/-T)</h5>
	                    <div class="type-snippet">����ϸ鼭�� ������ ǳ���� ���� ������ �����ڷ� �پ��� ����� ����ϰų� ����ġ ���� ��� ���ο� ����� â���ϴ� ������.</div>
					</div>
					<div class="3u 6u$(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/entp-debater.svg">
	                    <h4>���߰ſ� ������ ���� ���а���</h4>
			            <h5>ENTP (-A/-T)</h5>
			            <div class="type-snippet">������ ������ �η������� �ʴ� �ȶ��� ȣ�����.</div>
					</div>
				</div>
				
				<div class="text-center">
		            <h2>�ܱ���</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						 <img src="https://storage.googleapis.com/neris/public/images/types/infj-advocate.svg">
	                     <h4>�������� ��ȣ�ڡ�</h4>
	                     <h5>INFJ (-A/-T)</h5>
	                     <div class="type-snippet">�����ϰ� �ź�ο�� ���ڴ� �������� ��ĥ �� �𸣴� �̻�������.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/infp-mediator.svg">
	                    <h4>���������� �����ڡ�</h4>
	                    <h5>INFP (-A/-T)</h5>
	                    <div class="type-snippet">����� ������ ��Ÿ�����ڷ� �ǰ��ϰ� ���� ��ȸ �Ǽ��� ���弭�� ������.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/enfj-protagonist.svg">
	                    <h4>�����Ƿο� ��ȸ�����</h4>
	                    <h5>ENFJ (-A/-T)</h5>
	                    <div class="type-snippet">��ġ�� ī�������� ��������� û���� �е��ϴ� ������.</div>
					</div>
					<div class="3u 6u(small) type-item">
						 <img src="https://storage.googleapis.com/neris/public/images/types/enfp-campaigner.svg">
	                     <h4>�����߶��� Ȱ������</h4>
			             <h5>ENFP (-A/-T)</h5>
			             <div class="type-snippet">â�����̸� �׻� ���� �Ÿ��� ã�ƴٴϴ� Ȱ���� �������� ������ �����Ӱ� ��︮�⸦ �����ϴ� ��ġ�� ������ ������.</div>
					</div>
				</div>
				
				<div class="text-center">
		            <h2>��������</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						 <img src="https://storage.googleapis.com/neris/public/images/types/istj-logistician.svg">
	                     <h4>��û�Ű���� �������ڡ�</h4>
	                     <h5>ISTJ (-A/-T)</h5>
	                     <div class="type-snippet">��ǿ� �ٰ��Ͽ� ����ϸ� �̵��� �ൿ�̳� ���� ���׿� �� ġ�� �ǽ��� ���� �ʴ� ������������.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/isfj-defender.svg">
	                    <h4>���밨�� ��ȣ�ڡ�</h4>
	                    <h5>ISFJ (-A/-T)</h5>
	                    <div class="type-snippet">������ �̵��� ��ȣ�ϴ� �� ������ ����̴� ������̸� ������ �������.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/estj-executive.svg">
	                    <h4>�������� �����ڡ�</h4>
	                    <h5>ESTJ (-A/-T)</h5>
	                    <div class="type-snippet">�繰�̳� ����� �����ϴ� �� Ÿ�� ������ �����ϴ� �پ �Ƿ��� ���� ��������.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/esfj-consul.svg">
	                    <h4>���米���� �ܱ�����</h4>
	                    <h5>ESFJ (-A/-T)</h5>
	                    <div class="type-snippet">Ÿ���� ���� ������ ���ɰ� �米���� �������� ����� ������ �αⰡ ������, Ÿ���� ���µ� �������� ������.</div>
					</div>
				</div>
				
				<div class="text-center">
		            <h2>Ž�谡��</h2>
		        </div>
				<div class="row">
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/istp-virtuoso.svg">
	                    <h4>������ ���ֲۡ�</h4>
	                    <h5>ISTP (-A/-T)</h5>
	                    <div class="type-snippet">����ϰ� �������� �������� �پ��� ���� ��뿡 �ɼ��� Ž����.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/isfp-adventurer.svg">
	                    <h4>��ȣ��� ���� ��������</h4>
	                    <h5>ISFP (-A/-T)</h5>
	                    <div class="type-snippet">�׽� ���ο� ���� ã�� �õ��ϰų� ������ �غ� �Ǿ� �ִ� ���뼺 �ִ� ������ �ŷ� ��ġ�� ��������. </div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/estp-entrepreneur.svg">
	                    <h4>�������� ���� �������</h4>
	                    <h5>ESTP (-A/-T)</h5>
	                    <div class="type-snippet">���� ���� �ƽ��ƽ��� ���� �������� ��� �� �ƴ� �̵�� ���� �γ��� ������, �׸��� �پ �������� ������ �ִ� ����.</div>
					</div>
					<div class="3u 6u(small) type-item">
						<img src="https://storage.googleapis.com/neris/public/images/types/esfp-entertainer.svg">
	                    <h4>�������ο� ��ȥ�� �����Ρ�</h4>
	                    <h5>ESFP (-A/-T)</h5>
	                    <div class="type-snippet">������ ������ �λ��� ������ ���� ���� ������ �������̸� ������ �������� ��ġ�� ��������.</div>
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