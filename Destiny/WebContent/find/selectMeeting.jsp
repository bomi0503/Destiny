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
<link rel="stylesheet" href="/resources/css/main.css" > 



<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	<script>
	$(function(){
		// ���ο� ��ũ��Ʈ �ڵ� �߰�
		
		// city & town
		$( "#city" ).on("change" , function() {
			var idx = $("#city").index(this);
			var city = $(this).val();
			
			alert(city + idx);
			
			$.ajax( 
					{
						url : "/user/json/getLocationList/"+city ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							var list="";
							for(i in JSONData.list){
								var town = JSONData.list[i].townName;
								list+="<option value='"+town+"'>"+town+"</option>";
						}
							$( "#town:eq("+idx+")" ).empty().append(list);
						},
						error : function(what){
							alert("town ERROR" + what);
						}
					});
			});
		
		//ã�� & ���� button
		var town = $(this).val();
		console.log(town);
		$("a[name='find']" ).on("click" , function() {
			if($('select[name="city"]').val() == 0 || $('select[name="town"]').val() == 0){
				alert('������ ������ �ּ���.');
			}else{
				$("form").attr("method", "POST").attr("action", "/find/getMeetingResult").submit();
			}
		});
		
		$( "a[name='back']" ).on("click" , function() {
			 history.go(-1);
		});
		
		
	});
		
	
	//�Ϲ� & ���� ���� start
	$(function(){
		 
		$('input[name="selectRadio"]').on("click", function(){
			 var state = $(":input:radio[name=selectRadio]:checked").val()
			
			if(state == '1'){
				self.location="/find/selectMeeting.jsp"
			}else if(state == '2'){
				self.location="/find/selectMeeting(map).jsp"
			}
			
		}); 
		
		
	});
	//�Ϲ� & ���� ���� end
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

	/* .topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/meetingbg.jpg");
		background-repeat : no-repeat;
		background-position : center center;
		background-size : cover;
		width : 100%;
		height : 400px;
	} */
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/meetingbg.jpg");
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
	
	h1 .slim{
		font-weight : lighter;
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
	
</style>
	

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>����<span class="slim">�˻�</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->

	<!-- contents -->
	<!-- <section id="main" class="wrapper">
		<div class="inner">	 -->	
	<div class="container">
	
		<div class="wrap">
		
			<!-- ������ ���� �׺���̼� ��� : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>Place</li>
				<li>></li>
				<li>���� �˻�</li>
			</ul>
			<!-- ������ ���� �׺���̼� ��� : end -->
			
			<div class="row uniform">
				<div class="3u 6u$(small)">
					<input type="radio" name="selectRadio" id="ex1" value="1" checked="checked">
					<label for="ex1">�Ϲ�</label>
					<input type="radio" name="selectRadio" id="ex2" value="2">
					<label for="ex2">������ ����</label>
				</div>
			</div>
			
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
				<div>
					<table class="row-table">
						<caption>���̺� ����</caption>
						
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						
						<thead class="hide">
							<tr>
								<th>����</th>
								<td>����</td>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<th>����</th>
								<td>
									<div class="row uniform">
										<div class="6u$ 12u$(small)">
											<div class="select-wrapper">
												<select name="city" id="city" name="city">
													<option value="">��/�ø� ������ �ּ���</option>
											      	<option value="����">����</option>
											      	<option value="���">���</option>
											      	<option value="��õ">��õ</option>
											      	<option value="�λ�">�λ�</option>
											      	<option value="�뱸">�뱸</option>
											      	<option value="����">����</option>
											      	<option value="����">����</option>
											      	<option value="���">���</option>
											      	<option value="����">����</option>
											      	<option value="����">����</option>
											      	<option value="�泲">�泲</option>
											      	<option value="���">���</option>
											      	<option value="����">����</option>
											      	<option value="����">����</option>
											      	<option value="�泲">�泲</option>
											      	<option value="���">���</option>
											      	<option value="����">����</option>
												</select>
											</div>
										</div>
										
										<div class="6u$ 12u$(small)">
											<div class="select-wrapper">
												<select id="town" name="town"></select>
											</div>
										</div>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<ul class="actions align-center">
						<li><a href="#" class="button" name="back">����</a></li>
						<li><a href="#" class="button special" name="find">ã��</a></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<!-- //contents -->

	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>