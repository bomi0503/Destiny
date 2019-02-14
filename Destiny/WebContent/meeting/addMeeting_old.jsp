<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>우연</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<!--  ///////////////////////// 데이트픽커 ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!--  ///////////////////////// 타임픽커 ////////////////////////// -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script
		src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
	
	
	
	
	<script>
////////////////* 타임피커 */////////
	$(function() {
		$('.timepicker').timepicker();
	});	
	
 ////////////////* 데이트픽커 데이터 포맷 */////////
		$( function() {
		    $( "#datepicker" ).datepicker({
		    	dateFormat:"yy/mm/dd"
		    });
		} );
 
	/* 	$( function() {
		    $( "#datepicker" ).datepicker();
		  } ); */
	//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "a[name='join']" ).on("click" , function() {
				fncAddProduct();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[name='reset']").on("click" , function() {
				//$("form")[0].reset();
				history.go(-1);
			});
		});	
	
		
		function fncAddProduct() {
			//Form 유효성 검증

			var interestName = $('input:checkbox[type=checkbox]:checked').val();
			var meetingCity = $("#address1").val();
			var meetingCenter = $("#address2").val();
			var titleImg = $("input[name='imgFile']").val();
			var meetingName = $("input[name='meetingName']").val();
			var meetingDetail = $("textarea[name='meetingDetail']").val();
			var meetingCrewLimit = $("select[name='meetingCrewLimit']").val();
			var snooze = $("select[name='snooze']").val();
			var meetingDate = $("input[name='meetingDate']").val();
			var meetingTime = $("input[name='meetingTime']").val();
			var meetingLocation = $("input[name='meetingLocation']").val();
			var dt = new Date();
			var month = dt.getMonth()+1;
			var day = dt.getDate();
			var year = dt.getFullYear();
			var hours = dt.getHours();
			var minute = dt.getMinutes();
			var time = (hours + ':' +minute);
			var today = (year+'-0' +month + '-' + day);
			var mitingTime = ('${meetingAct.meetingDate}'+'-'+'${meetingAct.meetingTime }');
			/* ${meetingAct.meetingDate} ${meetingAct.meetingTime } */

			console.log("관심사" + interestName);
			console.log("미팅센터" +meetingCity +meetingCenter);
			console.log("타이틀이미지" + titleImg);
			console.log("제목" + meetingName);
			console.log("내용" + meetingDetail);
			console.log("인원" + meetingCrewLimit);
			console.log("스누즈" + snooze);
			console.log("날짜" + meetingDate);
			console.log("시간" + meetingTime);
			console.log("장소" + meetingLocation);
			console.log("오늘" + today);
			console.log(meetingDate<today);

			if (interestName == null || interestName.length < 1) {
				alert("관심사를 선택해 주세요.");
				return;
			}

			if (meetingCenter == null || meetingCenter.length < 1) {
				alert("중심지역을 선택해 주세요.");
				return;
			}

			if (titleImg == null || titleImg.length < 1) {
				alert("대표이미지를 설정하여 주세요.");
				return;
			}

			if (meetingName == null || meetingName.length < 1) {
				alert("모임이름을 작성하여 주세요.");
				return;
			}

			if (meetingDetail == null || meetingDetail.length < 1) {
				alert("모임설명을 작성하여 주세요.");
				return;
			}

			if (meetingCrewLimit == null || meetingCrewLimit.length < 1) {
				alert("모임인원을 설정하여 주세요.");
				return;
			}

			if (snooze != 'Y' && snooze != 'N') {
				alert("반복여부를 설정하여 주세요.");
				return;
			}

			if (meetingDate == null && meetingDate == "") {
				alert("날짜를 지정하여 주세요.");
				return;
			}
			
			if (meetingDate<today) {
				alert("잘못 된 날짜입니다.");
				return;
			}

			if (meetingTime == null || meetingTime == '모임시간') {
				alert("모임시간을 입력하여 주세요.");
				return;
			}

			if (meetingLocation == null || meetingLocation.length < 1) {
				alert("모임장소를 입력하여 주세요.");
				return;
			}

			if (confirm("모임을 등록하시겠습니까?") == true) { //확인

				$("form").attr("method", "POST").attr("enctype",
						"multipart/form-data")
						.attr("action", "/meeting/addMeeting").submit();

				//document.removefrm.submit();

			} else { //취소

				return;

			}
			//alert("모임이 등록되었습니다.");
		}
		 
		//지역구 받아오는 놈
		 $(function() {
			$( "#address1" ).on("change" , function() {
				//console.log("히얼아이엠");
				var idx = $("#address1").index(this);
				var city = $(this).val();
				
				//alert(city + idx);
				
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
								$( "#address2:eq("+idx+")" ).empty().append(list);
							},
							error : function(what){
								swal("에러" + what);
							}
					});
				});
			});
			 
			 
			 $(function() {
				// checkbox controll
				var $chkbox = $('[name="selectInterest"]');  
				
				$chkbox.on('change', function() {
					if( $('[name="selectInterest"]:checked').length < 1 ) {
						$chkbox.attr('disabled', false);
						//$chkbox.attr('disabled', true);
						//$('[name="selectInterest"]:checked').attr('disabled', false);
					} else {
						$chkbox.attr('disabled', true);
						$('[name="selectInterest"]:checked').attr('disabled', false);
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
		
		/* /////////////////////////////////////////////////////////// */
		
			.box{
				width: 100%;
				margin: 0 auto;
			}
			
			input[type="text"], input[type="text"].join, input[type="password"].join, .join{
			    background: #fff;
			    border: none;
			    border-bottom: 2px solid #ababab;
			    color: #555;
			    border-radius: 2px;
			    width:100%;
			    display:inline-block;
			}
			
			row.join{
			    margin-top: 15px;
			}
			
			input[type="text"], input[type="password"], select.join, textarea {
		       background: #ffe7e7;
		       border: none;
		       color: #555;
		       border-radius: 2px;
		       width: 100%;
		   }
		   
		/* /////////////////////////////////////////////////////////// */
		
		/* 타임피커 */
		.ui-timepicker {
			font-size: 10px;
			width: 100px;
		}
		
		.ui-timepicker-table td a {
			width: 2em;
		}		
	</style>
</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>회원<span class="slim">가입</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<h3>개설하기</h3>
			
			
				<form class="form-horizontal" id="form111">
				
				
				<!-- ////////////////////////////////////////////////////////////////// -->
				
				<table class="row-table tablebm">
					<caption>테이블 설명</caption>
					
					<colgroup>
						<%-- <col style="width:20%;">
						<col style="width:80%;"> --%>
						<col style="width:20%;">
						<col style="width:30%;">
						<col style="width:20%;">
						<col style="width:30%;">
					</colgroup>
					
					<thead class="hide">
						<tr>
							<th>구분</th>
							<td>내용</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<th>관심사</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="아웃도어/여행" id="sltInter01">
										<label for="sltInter01">아웃도어/여행</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="운동/스포츠" id="sltInter02">
										<label for="sltInter02">운동/스포츠</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="인문학/책/글" id="sltInter03">
										<label for="sltInter03">인문학/책/글</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="업종/직무" id="sltInter04">
										<label for="sltInter04">업종/직무</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="외국/언어" id="sltInter05">
										<label for="sltInter05">외국/언어</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="문화/공연/축제" id="sltInter06">
										<label for="sltInter06">문화/공연/축제</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="음악/악기" id="sltInter07">
										<label for="sltInter07">음악/악기</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="공예/만들기" id="sltInter08">
										<label for="sltInter08">공예/만들기</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="댄스/무용" id="sltInter09">
										<label for="sltInter09">댄스/무용</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="봉사활동" id="sltInter10">
										<label for="sltInter10">봉사활동</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="사교/인맥" id="sltInter11">
										<label for="sltInter11">사교/인맥</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="차/오토바이" id="sltInter12">
										<label for="sltInter12">차/오토바이</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="사진/영상" id="sltInter13">
										<label for="sltInter13">사진/영상</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="야구관람" id="sltInter14">
										<label for="sltInter14">야구관람</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="게임/오락" id="sltInter15">
										<label for="sltInter15">게임/오락</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="요리/제조" id="sltInter16">
										<label for="sltInter16">요리/제조</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="반려동물" id="sltInter17">
										<label for="sltInter17">반려동물</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="가족/결혼" id="sltInter18">
										<label for="sltInter18">가족/결혼</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="함께해요" id="sltInter19">
										<label for="sltInter19">함께해요</label>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>중심 모임지역</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<div class="select-wrapper">
											<select id="address1" name="address1" class="select_wrapper join">
												<option value="">지역을 선택해 주세요.</option>
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
									</div>
									
									<div class="4u 6u$(small)">
										<div class="select-wrapper">
											<select id="address2" name="meetingCenter" class="select_wrapper join">
												<c:forEach var="location" items="${list}">
													<option value="${location.townName}">${location.townName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>대표이미지</th>
							<td colspan="3">
								<input type="file" id="file" name="imgFile"  multiple>
							</td>
						</tr>
						
						<tr>
							<th>모임이름</th>
							<td colspan="3">
								<input type="text" class="form-control" name="meetingName"
									placeholder="모임이름을 적어주세요" />
							</td>
						</tr>
						
						<tr>
							<th>모임설명</th>
							<td colspan="3">
								<textarea class="form-control" cols="100" rows="3"
								name="meetingRule" placeholder="모임에 규칙이 있나요? 있다면 간략히 적어주세요"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>모임규칙</th>
							<td colspan="3">
								<textarea class="form-control" cols="100" rows="3"
								name="meetingDetail" placeholder="어떤 모임인지 설명해주세요"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>모임회비</th>
							<td colspan="3">
								<input name="meetingDues" type="text" class="form-control"
								placeholder="ex)회비 1만원" />
							</td>
						</tr>
						
						<tr>
							<th>모임장소</th>
							<td colspan="3">
								<input name="meetingLocation" type="text" class="form-control"
									id="place" placeholder="주소를 입력해주세요.">
							</td>
						</tr>
						
						<tr>
							<th>모임정원</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<div class="select-wrapper">
											<select name="meetingCrewLimit" class="select_wrapper join">
												<c:forEach var="i" begin="2" end="20" step="1">
													<option value="${i}">${i}명</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</td>
							<th>반복여부</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<div class="select-wrapper">
											<select name="snooze" id="snooze" class="select_wrapper join">
												<option>반복여부</option>
												<option value="Y">반복</option>
												<option value="N">한번</option>
											</select>
										</div>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>모임날짜</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="text" id="datepicker" readonly="readonly" 
											class="form-control" placeholder="날짜를 선택해주세요." name="meetingDate" />
									</div>
								</div>
							</td>
							<th>모임시간</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="text" readonly="readonly"
											class='form-control timepicker' name="meetingTime"
											placeholder="시간을 선택해주세요.">
									</div>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<ul class="actions align-center">
					<li><a href="#" class="button" name="reset">취소</a></li>
					<li><a href="#" class="button special" name="join">토토</a></li>
				</ul>
					
				<!-- ////////////////////////////////////////////////////////////////// -->
						
				</form>
			</div>
			
		</div>
	</section>
	<div id="map" style="width:100%;height:350px; display: none;"></div>
	
		<script>
		
		    function initAutocomplete() {
		        var coordinateInput = document.getElementById("meeting_place_coordinate");
		
		        var coordinate = [];
		        /*
		        if (coordinateInput.value !== "") {
		            coordinate = coordinateInput.value.split(", ");
		            coordinate.forEach(function(value, idx) {
		                coordinate[idx] = parseFloat(value);
		            });
		        } else {
		            
		        }
		        */
		        coordinate[0] = 41.3870154;
		        coordinate[1] = 2.1700471000000334;
		        var map = new google.maps.Map(document.getElementById('map'), {
		            center: {lat: coordinate[0], lng: coordinate[1]},
		            zoom: 16,
		            mapTypeId: 'roadmap'
		        });
		
		        // Create the search box and link it to the UI element.
		        var input = document.getElementById('place');
		        var searchBox = new google.maps.places.SearchBox(input);
		
		        // Bias the SearchBox results towards current map's viewport.
		        map.addListener('bounds_changed', function() {
		            searchBox.setBounds(map.getBounds());
		        });
		
		        var markers = [];
		        // Listen for the event fired when the user selects a prediction and retrieve
		        // more details for that place.
		        searchBox.addListener('places_changed', function() {
		            var places = searchBox.getPlaces();
		
		            if (places.length == 0) {
		                return;
		            }
		
		            // Clear out the old markers.
		            markers.forEach(function(marker) {
		                marker.setMap(null);
		            });
		            markers = [];
		
		            // For each place, get the icon, name and location.
		            var bounds = new google.maps.LatLngBounds();
		
		
		
		            places.forEach(function(place) {
		                if (!place.geometry) {
		                    console.log("Returned place contains no geometry");
		                    return;
		                }
		
		                coordinateInput.value = place.geometry.location.lat()
		                                        + ", "
		                                        + place.geometry.location.lng();
		
		                var icon = {
		                    url: place.icon,
		                    size: new google.maps.Size(71, 71),
		                    origin: new google.maps.Point(0, 0),
		                    anchor: new google.maps.Point(17, 34),
		                    scaledSize: new google.maps.Size(25, 25)
		                };
		
		                // Create a marker for each place.
		                markers.push(new google.maps.Marker({
		                    map: map,
		                    icon: icon,
		                    title: place.name,
		                    position: place.geometry.location
		                }));
		
		                if (place.geometry.viewport) {
		                    // Only geocodes have viewport.
		                    bounds.union(place.geometry.viewport);
		                } else {
		                    bounds.extend(place.geometry.location);
		                }
		            });
		
		
		
		            map.fitBounds(bounds);
		        });
		
		    }
		</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAb4hgf3q51Cj-Gjo6nOW71otQR0Ws0S6M&libraries=places&callback=initAutocomplete" async defer></script>
	
	
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>

