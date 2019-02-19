<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<script type="text/javascript">
	$(function() {
		
		$( "#okBtn" ).on("click" , function() {
			history.go(-1);
		});
		
		$( "#okBtn" ).on("click" , function() {
			self.location = "/complain/listComplain"
		});
		
		$( "#doComplainBtn" ).on("click", function(){
			var complainNo = ${complain.complainNo}
			console.log(complainNo);
		  		
		  	var displayValue= '<div class="row uniform">\n'
			  		+'<div class="4u 6u$(small)"  id="complainCondition">\n'
			  		+'<input type="radio" class="complainCondition" name="complainCondition" id="NOT" value="NOT">\n'
			  		+'<label for="NOT">����</label>\n'
			  		+'</div>\n'
			  		+'<div class="4u 6u$(small)">\n'
			  		+'<input type="radio" class="complainCondition" name="complainCondition" id="WAR" value="WAR">\n'
			  		+'<label for="WAR">���</label>\n'
			  		+'</div>\n'
			  		+'<div class="4u 6u$(small)">\n'
			  		+'<input type="radio" class="complainCondition" name="complainCondition" id="BLK" value="BLK">\n'
			  		+'<label for="BLK">������Ʈ</label>\n'
			  		+'</div>\n'
		  		+'</div>\n'
		  		+'</div>\n'
		  		+'<hr class="major" />\n'
		  		+'<div class="form-group text-center">\n'	
		  		+'<ul class="actions align-center">\n'
		  		+'<li><a href="#" class="button" onClick="okComplainBtn()" id="endBtn">Ȯ��</a></li>'
		  		+'</ul>\n'
		  		
		  	$('.doComplain').append(displayValue);
		  	$('#doComplainBtn').hide();
		  	$('#okBtn').hide();
	  		
		});
	});
	

	function okComplainBtn(){
		
		var complainNo = ${complain.complainNo}
		console.log('okComplainBtn : ' + complainNo);
		var complainCondition = '';
		
		complainCondition = $('.complainCondition:checked').val()
		console.log('complainCondition : ' + complainCondition);
		
		$.ajax(
				{
			method : "GET",
			/* url : '/complain/json/updateComplain/'+complainNo+'/'+complainCondition, */
			url : '/complain/json/updateComplain/'+complainNo+'/'+complainCondition,
			success : function(JSONData){
				var complainState = JSONData.complainState;
				var complainCondition = JSONData.complainCondition;
				
				$('#complainState').html("${complainState=='Y' ? '�Ű�ó�� �����':'�Ű�ó�� �Ϸ�'}");
				
				if(complainCondition=="NOT"){
					$('#complainState').append(' ( ���� )');
				}else if(complainCondition=="WAR"){
					$('#complainState').append(' ( ��� )');
				}else if(complainCondition=="BLK"){
					$('#complainState').append(' ( ������Ʈ )');
				}
				
				$('.doComplain').hide();
				$('#endBtn').hide();
				$('#okBtn').show();
				history.go(0);
			}
		});
	}
	
	$(function() {
		
		/* �� ���� ���콺 ���� : start */
		$(".getComplainLink").on("mouseover",function(){
			$(".getComplainLink").css("cursor","pointer")
		});
		/* �� ���� ���콺 ���� : end */
		
		/* �� ���� Ŭ�� : start */
		$(".getComplainLink").on("click", function(){
			var communityNo = $(this).data("param");
			var meetingNo = $(this).data("param1");
			
			if(meetingNo == null){
				/* if(${community.category == "RES"}){
					self.location="/info/getRestaurantInfo?communityNo="+communityNo
				}  */
				
				self.location="/info/getRestaurantInfo?communityNo="+communityNo


				
			}else if(communityNo == null){
				self.location="/meeting/getMeeting?meetingNo="+meetingNo
			}
			
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
			background-position : center center;
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
		    position: absolute;
		    line-height: 330px;
		    width: 100%;
		    text-align: center;
		    color: white;
		    z-index: 99;
		    font-size: 60px;	
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		.wrap {
		    max-width: 1440px;
		    margin-top: 400px;
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
		
		.homeImg{
			margin-top : -2px;
		}
		
		.form-control { -webkit-appearance: menulist;}
		/* sweetalert buttom design^^ */
		.swal-button{
			padding : 0 56px;
			color : rgba(0,0,0,.65) !important;
		}
		
		.form{
			width: 80%; margin:0 auto;
		}
	
	</style>


</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>�Ű���<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->

	<!-- contents -->
	
	<div class="container">
	
		<div class="wrap">
		
			<!-- ������ ���� �׺���̼� ��� : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>�Ű��԰���</li>
			</ul>
			<!-- ������ ���� �׺���̼� ��� : end -->
			
			
			<div class="form" style="clear:both;">
				<form class="form-horizontal">
					<div>
						<table class="row-table">
							<caption>���̺� ����</caption>
							
								<colgroup>
									<col style="width:20%;">
									<col style="width:30%;">
									<col style="width:20%;">
									<col style="width:30%;">
								</colgroup>
							
							<thead class="hide">
								<tr>
									<th>����</th>
									<td>����</td>
								</tr>
							</thead>
							
							<tbody>
								<c:if test="${complain.complainState=='N'}">
									<tr>
										<th>�Ű�ó������</th>
										<td colspan="3">
											<div class="6u$ 12u$(small)" name="complainState" id="complainState">
											 	${complain.complainState=='N' ? "�����":"ó�� �Ϸ�"}
											 </div>
										</td>
									</tr>
								</c:if>
								
								<c:if test="${complain.complainState=='Y'}">
								<tr>
									<th>�Ű�ó������</th>
									<td>
										<div class="4u$ 12u$(small)" name="complainState" id="complainState">
										 	${complain.complainState=='N' ? "�����":"ó�� �Ϸ�"}
										 </div>
									</td>
										<th>�Ű�</th>
										<div class="4u$ 12u$(small)" name="complainCondition" id="complainCondition">
												<c:if test="${complain.complainCondition=='NOT'}"><td>����</td></c:if>
												<c:if test="${complain.complainCondition=='WAR'}"><td>���</td></c:if>
												<c:if test="${complain.complainCondition=='BLK'}"><td>������Ʈ</td></c:if>
										 </div>
								</tr>
								</c:if>
								
								<tr>
									<th>�Ű���</th>
									<td>
										<div class="6u$ 12u$(small)"  name="complainType"> ${complain.complainerId}</div>
									</td>
									
									<th>�ۼ���</th>
									<td colspan="3">
										<div class="6u$ 12u$(small)"  name="complainType" id="complainType"> ${complain.defendantId}</div>
										<div class="6u$ 12u$(small)"  name="complainType" id="complainType">&nbsp;&nbsp;&nbsp; ( ��� ${user.warningCount}ȸ  )</div>
									</td>
								</tr>
								
								<tr>
									<th>�Ű�¥</th>
									<td colspan="3">
										<div class="6u$ 12u$(small)" name="complainDate"> ${complain.complainDate}  </div>
									</td>
								</tr>
								
								<tr>
									<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
									<c:if test="${complain.complainKind == 'BD'}">
								  		<th>����</th>
								  		<td colspan="3">
									  		<div class="6u$ 12u$(small)" name="complainDetail" data-param="${complain.communityNo}" > 
									  			<a href="/info/getRestaurantInfo?communityNo=${complain.communityNo}" target=��_blank��>${complain.complainDetail}</a>
									  		</div>
								  		</td>
									</c:if>
									<c:if test="${complain.complainKind == 'MT'}">
								  		<th>�����̸�</th>
								  		<td colspan="3">
									  		<div class="6u$ 12u$(small) getComplainLink" name="complainDetail" data-param="${complain.meetingNo}">
									  		 	<a href="/meeting/getMeeting?meetingNo=${complain.meetingNo}" target=��_blank��>${complain.complainDetail}</a>
									  		</div>
								  		</td>
									</c:if>
								</tr>
								
								<tr>
									<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
							  		<th>�Ű����</th>
							  		<td colspan="3">
										<div class="6u$ 12u$(small)">
											<c:if test="${complain.complainType == 'FKU'}"> �弳/��� </c:if>
											<c:if test="${complain.complainType == 'SEX'}"> ���� </c:if>
											<c:if test="${complain.complainType == 'ADV'}"> ����/���� </c:if>
											<c:if test="${complain.complainType == 'ETC'}"> ��Ÿ </c:if>
										</div>
									</td>
								</tr>
								
								<tr>
									<%-- �Խñ�:���� / ���:���� / ����:���Ӹ� --%>
							  		<th>�Ű���</th>
							  		<td colspan="3">
										<div class="6u$ 12u$(small)">${complain.complainText}</div>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="doComplain"></div>
						
						<ul class="actions align-center">
							<div class="form-group text-center">
								<c:if test="${complain.complainState=='N'}">
									<li><a href="#" class="button" id="okBtn">Ȯ��</a></li>
									<li><a href="#" class="button" id="doComplainBtn">�Ű�ó��</a></li>
								</c:if>
								<c:if test="${complain.complainState=='Y'}">
									<li><a href="#" class="button" id="okBtn">Ȯ��</a></li>
								</c:if>
							</div>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>