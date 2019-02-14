<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�쿬</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<!--  ///////////////////////// ����Ʈ��Ŀ ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!--  ///////////////////////// Ÿ����Ŀ ////////////////////////// -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script
		src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
	
	
	
	
	<script>
////////////////* Ÿ����Ŀ */////////
	$(function() {
		$('.timepicker').timepicker();
	});	
	
 ////////////////* ����Ʈ��Ŀ ������ ���� */////////
		$( function() {
		    $( "#datepicker" ).datepicker({
		    	dateFormat:"yy/mm/dd"
		    });
		} );
 
	/* 	$( function() {
		    $( "#datepicker" ).datepicker();
		  } ); */
	//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "a[name='join']" ).on("click" , function() {
				fncAddProduct();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[name='reset']").on("click" , function() {
				//$("form")[0].reset();
				history.go(-1);
			});
		});	
	
		
		function fncAddProduct() {
			//Form ��ȿ�� ����

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

			console.log("���ɻ�" + interestName);
			console.log("���ü���" +meetingCity +meetingCenter);
			console.log("Ÿ��Ʋ�̹���" + titleImg);
			console.log("����" + meetingName);
			console.log("����" + meetingDetail);
			console.log("�ο�" + meetingCrewLimit);
			console.log("������" + snooze);
			console.log("��¥" + meetingDate);
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

			if (meetingDate == null && meetingDate == "") {
				alert("��¥�� �����Ͽ� �ּ���.");
				return;
			}
			
			if (meetingDate<today) {
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
		 
		//������ �޾ƿ��� ��
		 $(function() {
			$( "#address1" ).on("change" , function() {
				//console.log("������̿�");
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
								swal("����" + what);
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
		
		/* Ÿ����Ŀ */
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
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>ȸ��<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<h3>�����ϱ�</h3>
			
			
				<form class="form-horizontal" id="form111">
				
				
				<!-- ////////////////////////////////////////////////////////////////// -->
				
				<table class="row-table tablebm">
					<caption>���̺� ����</caption>
					
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
							<th>����</th>
							<td>����</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<th>���ɻ�</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�ƿ�����/����" id="sltInter01">
										<label for="sltInter01">�ƿ�����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�/������" id="sltInter02">
										<label for="sltInter02">�/������</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�ι���/å/��" id="sltInter03">
										<label for="sltInter03">�ι���/å/��</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����/����" id="sltInter04">
										<label for="sltInter04">����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�ܱ�/���" id="sltInter05">
										<label for="sltInter05">�ܱ�/���</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="��ȭ/����/����" id="sltInter06">
										<label for="sltInter06">��ȭ/����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����/�Ǳ�" id="sltInter07">
										<label for="sltInter07">����/�Ǳ�</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����/�����" id="sltInter08">
										<label for="sltInter08">����/�����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="��/����" id="sltInter09">
										<label for="sltInter09">��/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����Ȱ��" id="sltInter10">
										<label for="sltInter10">����Ȱ��</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�米/�θ�" id="sltInter11">
										<label for="sltInter11">�米/�θ�</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="��/�������" id="sltInter12">
										<label for="sltInter12">��/�������</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����/����" id="sltInter13">
										<label for="sltInter13">����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�߱�����" id="sltInter14">
										<label for="sltInter14">�߱�����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����/����" id="sltInter15">
										<label for="sltInter15">����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�丮/����" id="sltInter16">
										<label for="sltInter16">�丮/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�ݷ�����" id="sltInter17">
										<label for="sltInter17">�ݷ�����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="����/��ȥ" id="sltInter18">
										<label for="sltInter18">����/��ȥ</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="interestName" value="�Բ��ؿ�" id="sltInter19">
										<label for="sltInter19">�Բ��ؿ�</label>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>�߽� ��������</th>
							<td colspan="3">
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<div class="select-wrapper">
											<select id="address1" name="address1" class="select_wrapper join">
												<option value="">������ ������ �ּ���.</option>
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
							<th>��ǥ�̹���</th>
							<td colspan="3">
								<input type="file" id="file" name="imgFile"  multiple>
							</td>
						</tr>
						
						<tr>
							<th>�����̸�</th>
							<td colspan="3">
								<input type="text" class="form-control" name="meetingName"
									placeholder="�����̸��� �����ּ���" />
							</td>
						</tr>
						
						<tr>
							<th>���Ӽ���</th>
							<td colspan="3">
								<textarea class="form-control" cols="100" rows="3"
								name="meetingRule" placeholder="���ӿ� ��Ģ�� �ֳ���? �ִٸ� ������ �����ּ���"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>���ӱ�Ģ</th>
							<td colspan="3">
								<textarea class="form-control" cols="100" rows="3"
								name="meetingDetail" placeholder="� �������� �������ּ���"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>����ȸ��</th>
							<td colspan="3">
								<input name="meetingDues" type="text" class="form-control"
								placeholder="ex)ȸ�� 1����" />
							</td>
						</tr>
						
						<tr>
							<th>�������</th>
							<td colspan="3">
								<input name="meetingLocation" type="text" class="form-control"
									id="place" placeholder="�ּҸ� �Է����ּ���.">
							</td>
						</tr>
						
						<tr>
							<th>��������</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<div class="select-wrapper">
											<select name="meetingCrewLimit" class="select_wrapper join">
												<c:forEach var="i" begin="2" end="20" step="1">
													<option value="${i}">${i}��</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</td>
							<th>�ݺ�����</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<div class="select-wrapper">
											<select name="snooze" id="snooze" class="select_wrapper join">
												<option>�ݺ�����</option>
												<option value="Y">�ݺ�</option>
												<option value="N">�ѹ�</option>
											</select>
										</div>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>���ӳ�¥</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="text" id="datepicker" readonly="readonly" 
											class="form-control" placeholder="��¥�� �������ּ���." name="meetingDate" />
									</div>
								</div>
							</td>
							<th>���ӽð�</th>
							<td>
								<div class="row uniform">
									<div class="12u$ 12u$(small)">
										<input type="text" readonly="readonly"
											class='form-control timepicker' name="meetingTime"
											placeholder="�ð��� �������ּ���.">
									</div>
								</div>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<ul class="actions align-center">
					<li><a href="#" class="button" name="reset">���</a></li>
					<li><a href="#" class="button special" name="join">����</a></li>
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

