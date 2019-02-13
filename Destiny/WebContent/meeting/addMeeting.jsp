<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">


<!-- ���� : http://getbootstrap.com/css/   ���� -->
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

<!--  ///////////////////////// ����Ʈ��Ŀ ////////////////////////// -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>

<!--  ///////////////////////// Ÿ����Ŀ ////////////////////////// -->
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
			keyword = "��Ʈķ�� ���μ���";
		}
		
		
	
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };  

		// ������ �����մϴ�    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// ��� �˻� ��ü�� �����մϴ�
		var ps = new daum.maps.services.Places(); 

		// Ű����� ��Ҹ� �˻��մϴ�
		ps.keywordSearch(keyword, placesSearchCB); 

		// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
		function placesSearchCB (data, status, pagination) {
		    if (status === daum.maps.services.Status.OK) {

		        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
		        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
		        var bounds = new daum.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
		        map.setBounds(bounds);
		    } 
		}

		// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(place) {
		    
			    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });
				console.log(place);
			    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
			    daum.maps.event.addListener(marker, 'click', function() {
			        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			        $('#place').val(place.road_address_name + ", "+ place.place_name );
			    });
		}
	} */
	////////////////*�ε�� ȣ�� */////////
	$(function() {
		$("#placeSearch").on("click", function() {
			console.log($("#place").val());
			loadMap($("#place").val());
		});
	});
	
	
	////////////////* Ÿ����Ŀ */////////
	$(function() {
		$('.timepicker').timepicker();
	});

	////////////////* ����Ʈ��Ŀ ������ ���� */////////
	$(function() {

		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});

	});

	function fncAddProduct() {
		//Form ��ȿ�� ����

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

		console.log("���ɻ�" + interestName);
		console.log("���ü���" + meetingCenter);
		console.log("Ÿ��Ʋ�̹���" + titleImg);
		console.log("����" + meetingName);
		console.log("����" + meetingDetail);
		console.log("�ο�" + meetingCrewLimit);
		console.log("������" + snooze);
		console.log("��¥" + meetingDate);
		console.log("����" + meetingDay);
		console.log("�ð�" + meetingTime);
		console.log("���" + meetingLocation);
		console.log("����" + today);
		console.log(meetingDate<today);

		if (interestName == null || interestName.length < 1) {
			alert("���ɻ縦 ������ �ּ���.");
			return;
		}

		if (meetingCenter == null || meetingCenter.length < 1) {
			alert("�߽������� ������ �ּ���.");
			return;
		}

		if (titleImg == null || titleImg.length < 1) {
			alert("��ǥ�̹����� �����Ͽ� �ּ���.");
			return;
		}

		if (meetingName == null || meetingName.length < 1) {
			alert("�����̸��� �ۼ��Ͽ� �ּ���.");
			return;
		}

		if (meetingDetail == null || meetingDetail.length < 1) {
			alert("���Ӽ����� �ۼ��Ͽ� �ּ���.");
			return;
		}

		if (meetingCrewLimit == null || meetingCrewLimit.length < 1) {
			alert("�����ο��� �����Ͽ� �ּ���.");
			return;
		}

		if (snooze != 'Y' && snooze != 'N') {
			alert("�ݺ����θ� �����Ͽ� �ּ���.");
			return;
		}

		if (meetingDate == null && meetingDay == null) {
			alert("��¥�� �����Ͽ� �ּ���.");
			return;
		}
		
		if (meetingDate>today) {
			alert("�߸� �� ��¥�Դϴ�.");
			return;
		}

		if (meetingTime == null || meetingTime == '���ӽð�') {
			alert("���ӽð��� �Է��Ͽ� �ּ���.");
			return;
		}

		if (meetingLocation == null || meetingLocation.length < 1) {
			alert("������Ҹ� �Է��Ͽ� �ּ���.");
			return;
		}

		if (confirm("������ ����Ͻðڽ��ϱ�?") == true) { //Ȯ��

			$("form").attr("method", "POST").attr("enctype",
					"multipart/form-data")
					.attr("action", "/meeting/addMeeting").submit();

			//document.removefrm.submit();

		} else { //���

			return;

		}
		//alert("������ ��ϵǾ����ϴ�.");
	}

	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		$("a.btn.btn-primary").on("click", function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			fncAddProduct();
		});

	});

	$(function() {
		$("#manuDate").datepicker();
	});

	////* ���ɻ簡 ���õǸ�  *////
	$(function() {
		$("#interest").on("change", function() {
			//var idx = $(".brand_ids").index(this);
			var interestNo = $(this).val();
			console.log(interestNo);

			$("#selectedInterest").val(interestNo);

		});
	});
	////* ���ɻ� ��  *////

	////* ������ ���ú�  *////
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
											list += "<option>��/��/�� ����</option>";
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container mybody">
		<h1 class="bg-primary text-center">�����ϱ�</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="meetingMasterId"
				value="${sessionScope.me.userId}"> <input type="hidden"
				name="masterProfileImg" value="${sessionScope.me.profile}">
			<input type="hidden" name="crewNickName"
				value="${sessionScope.me.nickName}">
			<div class="form-group col-sm-4 col-md-4">
				<select id="interest" class="form-control">
					<option>���ɻ�</option>
					<c:forEach var="Meeting" items="${list}">

						<option value="${Meeting.interestName}">${Meeting.interestName }</option>

					</c:forEach>
				</select>
			</div>

			<div class="form-group col-sm-8 col-md-8">
				<input name="interestName" id="selectedInterest" type="text"
					class="form-control" readonly="readonly" placeholder="���ɻ縦 ������ �ּ���">
			</div>

			<div class="form-group col-sm-6 col-md-6">
				<select id="centerLocation" class="form-control">
					<option>�߽�����-����</option>
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

			<div id="location" class="form-group col-sm-6 col-md-6">
				<input type="text" readonly="readonly" class="form-control"
					placeholder="��/��/���� �������ּ���">
			</div>


			<!--
		 <div class="form-group col-sm-8 col-md-8">
		 	<input type="text" class="form-control" placeholder="���������� �Է����ּ���">
		 </div>
		 -->
			<div class="form-group col-sm-12 col-md-12">
				<input type="file" class="form-control" name="imgFile"
					placeholder="��ǥ�̹����� �����Ͽ� �ּ���">
			</div>

			<div class="form-group col-sm-12 col-md-12">
				<input type="text" class="form-control" name="meetingName"
					placeholder="�����̸��� �����ּ���" />
			</div>

			<div class="form-group col-sm-12 col-md-12">
				<textarea class="form-control" cols="100" rows="3"
					name="meetingDetail" placeholder="� �������� �������ּ���"></textarea>
			</div>

			<div class="form-group col-sm-12 col-md-12">
				<textarea class="form-control" cols="100" rows="3"
					name="meetingRule" placeholder="���ӿ� ��Ģ�� �ֳ���? �ִٸ� ������ �����ּ���"></textarea>
			</div>

			<div class="form-group col-sm-10 col-md-10">�����ο��� �Է��Ͽ� �ּ���</div>

			<div id="crewNo" class="form-group col-sm-2 col-md-2">
				<select name="meetingCrewLimit" class="form-control">
					<c:forEach var="i" begin="2" end="20" step="1">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group col-sm-4 col-md-4">
				<select name="snooze" id="snooze" class="form-control">
					<option>�ݺ�����</option>
					<option value="Y">�ݺ�</option>
					<option value="N">�ѹ�</option>
				</select>
			</div>

			<div id="dateOrDay" class="form-group col-sm-4 col-md-4">
				<input type="text" id="datepicker" readonly="readonly"
					class="form-control" placeholder="��¥�� �������ּ���." name="meetingDate" />
			</div>

			<div class="form-group col-sm-4 col-md-4">
				<input type="text" readonly="readonly"
					class='form-control timepicker' name="meetingTime"
					placeholder="�ð��� ������ �ּ���.">
			</div>

			<div class="form-group col-sm-10 col-md-10">ȸ�� �ִٸ� �Է����ּ���</div>

			<div class="form-group col-sm-2 col-md-2">
				<input name="meetingDues" type="text" class="form-control"
					placeholder="$" />
			</div>

			<div class="form-group col-sm-10 col-md-10">
				<input name="meetingLocation" type="text" class="form-control"
					id="place" placeholder="�ּҸ� �˻����ּ���.">
			</div>

			<div class="form-group col-sm-2 col-md-2">
				<input type="button" class="btn btn-warning"
					 id="placeSearch" value="�ּ� �˻�"><br>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a type="button" class="btn btn-primary">�� &nbsp;��</a>
					<a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
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
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
</body>

</html>
