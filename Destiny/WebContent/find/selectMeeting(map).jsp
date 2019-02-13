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
<style>
#map {
    height: 500px; 
    min-width: 500x; 
    max-width: 500px; 
    margin: 0 auto; 
}
</style> 
<!-- //All CSS Insert -->


<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://code.highcharts.com/maps/highmaps.js"></script>
	<script src="http://code.highcharts.com/maps/modules/drilldown.js"></script>
	<script src="../resources/javascript/highmap/chart.js"></script>

	<script>
	$(function() {
		var town;
		var gu;
		var highMap = new highMaps();
		highMap.init();
		
		// 클릭 시, 정보 가져오기
		$("#map").click(function(){
			//console.log(highMap);
			console.log(highMap.selected);
			
			town = highMap.selected;
			$('#town-data').val(town)
			console.log(town);
			gu = encodeURI(town);
		});
		
		$("a[name='find']" ).on("click" , function() {
			if($('#town-data').val() == 0){
				alert('지역을 선택해 주세요.');
			}else{
				$("form").attr("method", "POST").attr("action", "/find/getMeetingResult").submit();
			}
		});
		
		$( "a[name='back']" ).on("click" , function() {
			 history.go(-1);
		});
	});
	
	//일반 & 지도 선택 start
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
	//일반 & 지도 선택 end
		
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
		background-image : url("/resources/images/background/meetingbg.jpg");
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
		position : absolute;
		line-height : 450px;
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

</style>
	

</head>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>모임<span class="slim">검색</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			
			<div class="row uniform">
				<div class="3u 6u$(small)">
					<input type="radio" name="selectRadio" id="ex1" value="1" >
					<label for="ex1">일반</label>
					<input type="radio" name="selectRadio" id="ex2" value="2" checked="checked">
					<label for="ex2">지도로 보기</label>
				</div>
			</div>
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
				<div>
					<table class="row-table">
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
								<th>Map</th>
								<td>
									<div class="row uniform">
										<div class="12u">
											<div id="map"></div>
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
				
				<input type="hidden" id="town-data" name="town">
			</form>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>