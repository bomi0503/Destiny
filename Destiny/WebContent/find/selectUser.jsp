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
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script>
	$(function(){
		// 내부에 스크립트 코드 추가
		
		// checkbox controll
		var $chkbox = $('[name="selectInterest"]'); 
		
		$chkbox.on('change', function() {
			if( $('[name="selectInterest"]:checked').length <= 2 ) {
				$chkbox.attr('disabled', false);
			} else {
				$chkbox.attr('disabled', true);
				$('[name="selectInterest"]:checked').attr('disabled', false);
			}
		});
		
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
		
		
		// select 조건
		$("a[name='find']").on("click", function() {
			if( $('[name="selectGender"]:checked').length != 1 ){
				swal('성별을 선택해 주세요.');
			} else if( $('select[name="selectAge"]').val() == 0 ) {
				swal('나이를 선택해 주세요');
			} else if($('select[name="city"]').val() == 0 || $('select[name="town"]').val() == 0){
				swal('지역을 선택해 주세요.');
			} else if( $('[name="selectInterest"]:checked').length != 3 ) {
				swal('3개의 관심사를 선택해 주세요.');
			} else {
				$("form").attr("method", "POST").attr("action", "/find/getUserResult").submit();	
			}
		});		
		
		$( "a[name='back']" ).on("click" , function() {
			 history.go(-1);
		});
		
		
	})
		
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
		background-image : url("/resources/images/background/userbg.jpg");
		background-repeat : no-repeat;
		background-size : cover;
		width : 100%;
		height : 400px;
	}
	
	/*.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/userbg.jpg");
		background-position : center center;
		background-size : cover;
		background-repeat : no-repeat;
	}*/
	
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
	
	.homeImg{
		margin-top : -2px;
	}
	
	.form-control { -webkit-appearance: menulist;}
	/* sweetalert buttom design^^ */
	.swal-button{
		padding : 0 56px;
		color : rgba(0,0,0,.65) !important;
	}
</style>
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>이상형<span class="slim">검색</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->

	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
			<!-- 페이지 내부 네비게이션 경로 : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>Place</li>
				<li>></li>
				<li>이상형 검색</li>
			</ul>
			<!-- 페이지 내부 네비게이션 경로 : end -->
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">

				<div>
					<table class="row-table tablebm">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						
						<thead class="hide">
							<tr>
								<th>구분</th>
								<td>내용</td>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<th>성별</th>
								<td>
									<div class="row uniform">
										<div class="4u 6u$(small)">
											<input type="radio" id="male" name="selectGender" value="M">
											<label for="male">남자</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="radio" id="female" name="selectGender" value="W">
											<label for="female">여자</label>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>연령</th>
								<td>
									<div class="row uniform">
										<div class="6u$ 12u$(small)">
											<select name="selectAge" class="form-control">
												<option value="">원하는 연령을 선택해 주세요.</option>
												<option value="1">20세 ~ 24세</option>
												<option value="2">25세 ~ 29세</option>
												<option value="3">30세 ~ 34세</option>
												<option value="4">34세 ~ 39세</option>
												<option value="5">40세 ~ 44세</option>
												<option value="6">44세 ~ 49세</option>
												<option value="7">50세 ~ </option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>지역</th>
								<td>
									<div class="row uniform">
										<div class="6u 12u$(small)">
											<select name="city" id="city" name="city" class="form-control">
												<option value="">도/시를 선택해 주세요</option>
										      	<option value="서울">서울</option>
										      	<option value="경기">경기</option>
										      	<option value="인천">인천</option>
										      	<option value="부산">부산</option>
										      	<option value="대구">대구</option>
										      	<option value="광주">광주</option>
										      	<option value="대전">대전</option>
										      	<option value="울산">울산</option>
										      	<option value="세종">세종</option>
										      	<option value="강원">강원</option>
										      	<option value="경남">경남</option>
										      	<option value="경북">경북</option>
										      	<option value="전남">전남</option>
										      	<option value="전북">전북</option>
										      	<option value="충남">충남</option>
										      	<option value="충북">충북</option>
										      	<option value="제주">제주</option>
											</select>
										</div>
										
										<div class="6u$ 12u$(small)">
											<select id="town" name="town" class="form-control"></select>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>관심사</th>
								<td>
									<div class="row uniform">
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10000" id="sltInter01">
											<label for="sltInter01">아웃도어/여행</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10001" id="sltInter02">
											<label for="sltInter02">운동/스포츠</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10002" id="sltInter03">
											<label for="sltInter03">인문학/책/글</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10003" id="sltInter04">
											<label for="sltInter04">업종/직무</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10004" id="sltInter05">
											<label for="sltInter05">외국/언어</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10005" id="sltInter06">
											<label for="sltInter06">문화/공연/축제</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10006" id="sltInter07">
											<label for="sltInter07">음악/악기</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10007" id="sltInter08">
											<label for="sltInter08">공예/만들기</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10008" id="sltInter09">
											<label for="sltInter09">댄스/무용</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10009" id="sltInter10">
											<label for="sltInter10">봉사활동</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10010" id="sltInter11">
											<label for="sltInter11">사교/인맥</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10011" id="sltInter12">
											<label for="sltInter12">차/오토바이</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10012" id="sltInter13">
											<label for="sltInter13">사진/영상</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10013" id="sltInter14">
											<label for="sltInter14">야구관람</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10014" id="sltInter15">
											<label for="sltInter15">게임/오락</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10015" id="sltInter16">
											<label for="sltInter16">요리/제조</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10016" id="sltInter17">
											<label for="sltInter17">반려동물</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10017" id="sltInter18">
											<label for="sltInter18">가족/결혼</label>
										</div>
										<div class="4u 6u$(small)">
											<input type="checkbox" name="selectInterest" value="10018" id="sltInter19">
											<label for="sltInter19">함께해요</label>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
					<ul class="actions align-center">
						<li><a href="#" class="button" name="back">이전</a></li>
						<li><a href="#" class="button special" name="find">찾기</a></li>
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