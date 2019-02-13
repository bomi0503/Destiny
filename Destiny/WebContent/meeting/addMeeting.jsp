<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">


<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="/resources/css/main.css">

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// 데이트픽커 ////////////////////////// -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>

<!--  ///////////////////////// 타임픽커 ////////////////////////// -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
<script
	src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
.container {
	padding-top: 50px;
}

input[type="text"] {
	border: solid 1px #ccc;
}

body>div.container {
	border: 3px solid #D6CDB7;
	margin-top: 10px;
}

.ui-timepicker {
	font-size: 10px;
	width: 100px;
}

.ui-timepicker-table td a {
	width: 2em;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c&libraries=services"></script>
<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
/* 
	function loadMap(keyword){
		if(keyword ==null || keyword == ""){
			keyword = "비트캠프 종로센터";
		}
		
		
	
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places(); 

		// 키워드로 장소를 검색합니다
		ps.keywordSearch(keyword, placesSearchCB); 

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });
				console.log(place);
			    // 마커에 클릭이벤트를 등록합니다
			    daum.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			        $('#place').val(place.road_address_name + ", "+ place.place_name );
			    });
		}
	} */
	////////////////*로드맵 호출 */////////
	$(function() {
		$("#placeSearch").on("click", function() {
			console.log($("#place").val());
			loadMap($("#place").val());
		});
	});
	
	
	////////////////* 타임피커 */////////
	$(function() {
		$('.timepicker').timepicker();
	});

	////////////////* 데이트픽커 데이터 포맷 */////////
	$(function() {

		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});

	});

	function fncAddProduct() {
		//Form 유효성 검증

		var interestName = $("input[name='interestName']").val();
		var meetingCenter = $("#meetingCenter").val();
		var titleImg = $("input[name='imgFile']").val();
		var meetingName = $("input[name='meetingName']").val();
		var meetingDetail = $("textarea[name='meetingDetail']").val();
		var meetingCrewLimit = $("select[name='meetingCrewLimit']").val();
		var snooze = $("select[name='snooze']").val();
		var meetingDate = $("input[name='meetingDate']").val();
		var meetingDay = $("#weekday").val();
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
		console.log("미팅센터" + meetingCenter);
		console.log("타이틀이미지" + titleImg);
		console.log("제목" + meetingName);
		console.log("내용" + meetingDetail);
		console.log("인원" + meetingCrewLimit);
		console.log("스누즈" + snooze);
		console.log("날짜" + meetingDate);
		console.log("요일" + meetingDay);
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

		if (meetingDate == null && meetingDay == null) {
			alert("날짜를 지정하여 주세요.");
			return;
		}
		
		if (meetingDate>today) {
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

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		$("a.btn.btn-primary").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
			fncAddProduct();
		});

	});

	$(function() {
		$("#manuDate").datepicker();
	});

	////* 관심사가 선택되면  *////
	$(function() {
		$("#interest").on("change", function() {
			//var idx = $(".brand_ids").index(this);
			var interestNo = $(this).val();
			console.log(interestNo);

			$("#selectedInterest").val(interestNo);

		});
	});
	////* 관심사 끝  *////

	////* 지역구 선택부  *////
	$(function() {
		$("#centerLocation")
				
						.on("change",
						function() {
							//var idx = $(".brand_ids").index(this);
							var city = $(this).val();
							console.log(city);

							$
									.ajax({
										url : "/user/json/getLocationList/"
												+ city,
										method : "GET",
										dataType : "json",
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData, status) {

											var list = "";
											list += "<select id='meetingCenter' name='meetingCenter' class='form-control'>";
											list += "<option>시/군/구 선택</option>";
											for (i in JSONData.list) {
												var town = JSONData.list[i].townName;

												list += "<option name='meetingCenter' value='"+town+"'>"
														+ town + "</option>";
											}
											$("#location").empty().append(list);
										}
									});
						});
	});
</script>

</head>

<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container mybody">
		<h1 class="bg-primary text-center">개설하기</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="meetingMasterId"
				value="${sessionScope.me.userId}"> <input type="hidden"
				name="masterProfileImg" value="${sessionScope.me.profile}">
			<input type="hidden" name="crewNickName"
				value="${sessionScope.me.nickName}">
			<div class="form-group col-sm-4 col-md-4">
				<select id="interest" class="form-control">
					<option>관심사</option>
					<c:forEach var="Meeting" items="${list}">

						<option value="${Meeting.interestName}">${Meeting.interestName }</option>

					</c:forEach>
				</select>
			</div>

			<div class="form-group col-sm-8 col-md-8">
				<input name="interestName" id="selectedInterest" type="text"
					class="form-control" readonly="readonly" placeholder="관심사를 선택해 주세요">
			</div>

			<div class="form-group col-sm-6 col-md-6">
				<select id="centerLocation" class="form-control">
					<option>중심지역-지역</option>
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

			<div id="location" class="form-group col-sm-6 col-md-6">
				<input type="text" readonly="readonly" class="form-control"
					placeholder="시/군/구를 설정해주세요">
			</div>


			<!--
		 <div class="form-group col-sm-8 col-md-8">
		 	<input type="text" class="form-control" placeholder="모임지역을 입력해주세요">
		 </div>
		 -->
			<div class="form-group col-sm-12 col-md-12">
				<input type="file" class="form-control" name="imgFile"
					placeholder="대표이미지를 설정하여 주세요">
			</div>

			<div class="form-group col-sm-12 col-md-12">
				<input type="text" class="form-control" name="meetingName"
					placeholder="모임이름을 적어주세요" />
			</div>

			<div class="form-group col-sm-12 col-md-12">
				<textarea class="form-control" cols="100" rows="3"
					name="meetingDetail" placeholder="어떤 모임인지 설명해주세요"></textarea>
			</div>

			<div class="form-group col-sm-12 col-md-12">
				<textarea class="form-control" cols="100" rows="3"
					name="meetingRule" placeholder="모임에 규칙이 있나요? 있다면 간략히 적어주세요"></textarea>
			</div>

			<div class="form-group col-sm-10 col-md-10">모임인원을 입력하여 주세요</div>

			<div id="crewNo" class="form-group col-sm-2 col-md-2">
				<select name="meetingCrewLimit" class="form-control">
					<c:forEach var="i" begin="2" end="20" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group col-sm-4 col-md-4">
				<select name="snooze" id="snooze" class="form-control">
					<option>반복여부</option>
					<option value="Y">반복</option>
					<option value="N">한번</option>
				</select>
			</div>

			<div id="dateOrDay" class="form-group col-sm-4 col-md-4">
				<input type="text" id="datepicker" readonly="readonly"
					class="form-control" placeholder="날짜를 선택해주세요." name="meetingDate" />
			</div>

			<div class="form-group col-sm-4 col-md-4">
				<input type="text" readonly="readonly"
					class='form-control timepicker' name="meetingTime"
					placeholder="시간을 선택해 주세요.">
			</div>

			<div class="form-group col-sm-10 col-md-10">회비가 있다면 입력해주세요</div>

			<div class="form-group col-sm-2 col-md-2">
				<input name="meetingDues" type="text" class="form-control"
					placeholder="$" />
			</div>

			<div class="form-group col-sm-10 col-md-10">
				<input name="meetingLocation" type="text" class="form-control"
					id="place" placeholder="주소를 검색해주세요.">
			</div>

			<div class="form-group col-sm-2 col-md-2">
				<input type="button" class="btn btn-warning"
					 id="placeSearch" value="주소 검색"><br>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a type="button" class="btn btn-primary">등 &nbsp;록</a>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
				</div>
			</div>
		
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
			
		</form>
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
</body>

</html>
