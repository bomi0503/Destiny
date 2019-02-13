<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>모임 찾기 결과</title>

	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
   
   
   <script type="text/javascript">
		$(function() {
			$( "button:contains('확인')" ).on("click" , function() {
				self.location = "/find/mainFind.jsp"
			});
			
			$(  "td:nth-child(3)" ).on("click" , function() {
				var meetingNo = $(this).data("param");
				self.location="/meeting/getMeeting?meetingNo="+meetingNo;
			});
		});
		
		
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        .row{text-align : center; }
        .count{font-size: 25px; font-weight: bold; color: #6666ff;}
        
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px; height: 90px;}
	    /* .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; } */
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	    .ellipsis p{display:block; width:20px; height:30px;}
	    
     </style>
     
</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	  <jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<div class="container">
	
		<div class="page-header"> <h3 class=" text-info">모임 찾기 결과</h3> </div>
		
		<div class="container">
			<div class="row">
				<!-- /////////모임 지도표시 ////////////////////////////////////////////////////////////////////////// -->
				<div class="col-md-6">
				
				<br/><br/><br/><br/>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9&libraries=services"></script>
					<div id="map" style="width:100%;height:350px;"></div>
					
					
					
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 5 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
					</script>
					
					<c:forEach var="meeting" items="${list}">
					<script>
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch('${meeting.meetingLocation} ', function(result, status) {
							
							    // 정상적으로 검색이 완료됐으면 
							     if (status === daum.maps.services.Status.OK) {
							
							        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
							        
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new daum.maps.Marker({
							            map: map,
							            position: coords
							        });
							        
							        var content = '<div class="wrap" id="${meeting.meetingNo}">' + 
						            '    <div class="info">' + 
						            '        <div class="title">' + 
						            '           ${meeting.meetingName}' + 
						            '            <div class="close" onclick="closeOverlay(${meeting.meetingNo})" title="닫기" ></div>' + 
						            '        </div>' + 
						            '        <div class="body">' + 
						            '            <div class="img">' +
						            '                <img src="/resources/images/meeting/${meeting.titleImg}" width="73" height="70"/>' +
						            '           </div>' + 
						            '            <div class="desc">' + 
						            '                <div class=""><p>${meeting.meetingLocation}</p></div>' + 	
						            '                <div><a href="/meeting/getMeeting?meetingNo=${meeting.meetingNo}" target="_blank" class="link">상세정보보기</a></div>' + 	
						            '            </div>' + 
						            '        </div>' + 
						            '    </div>' +    
						            '</div>';
							        
							        var overlay = new daum.maps.CustomOverlay({
							            content: content,
							            position: marker.getPosition()
							        });
			
							        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							       	daum.maps.event.addListener(marker, 'click', function() {
							       		if($('#${meeting.meetingNo}').hide()){
							       			$('#${meeting.meetingNo}').show();
							       		}
							       			overlay.setMap(map);
							            
							        });
			
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							     // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
							       /* function closeOverlay() {
							            //overlay.setMap(null);
							        } */
							     
							     // 인포윈도우로 장소에 대한 설명을 표시합니다
							        var infowindow = new daum.maps.InfoWindow({
							            content: '<div style="padding:5px;font-size:12px;"> ${meeting.meetingName}</div>'
							        });
							        /*infowindow.open(map, marker); */
							        
							        (function(marker, infowindow) {
							            // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
							            daum.maps.event.addListener(marker, 'mouseover', function() {
							                infowindow.open(map, marker);
							            });
			
							            // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
							            daum.maps.event.addListener(marker, 'mouseout', function() {
							                infowindow.close();
							            });
							        })(marker, infowindow);
							    } 
							    
							});
					</script>
					</c:forEach>
					
					<script>
						function closeOverlay(meetingNo) {
				            $('#'+meetingNo).click(function(){
				            	 $('#'+meetingNo).hide();
				            });
				            
				        }
					</script>
				
				</div>
				<!-- ////////////////////////////////////////////////////////////////////////////////////////// -->
	
				<!-- /////////모임 리스트 ////////////////////////////////////////////////////////////////////////// -->
				<div class="col-md-6">
				<br/><br/><br/>
					<table class="table table-hover table-striped" >
						
				        <thead>
				          <tr>
				            <th align="center">No</th>
				            <th align="center" >Image</th>
				            <th align="left" >모임명</th>
				            <th align="center">모임날짜</th>
				            <th align="center">중심지</th>
				            <th align="center">모임장소</th>
				          </tr>
				        </thead>
			       
						<tbody>
						  <c:set var="i" value="0" />
						  <c:forEach var="meeting" items="${list}">
							<c:set var="i" value="${ i+1 }" />
							<tr>
							  <td align="center">${ i }</td>
							  <td align="left"> <img src="/resources/images/meeting/${meeting.titleImg}" width=100px height=100px/></td>
							  <td align="left"  data-param="${meeting.meetingNo}" >${meeting.meetingName}</td>
							  <td align="left">${meeting.meetingDate}</td>
							  <td align="left">${meeting.meetingCenter}</td>
							  <td align="left">${meeting.meetingLocation}</td>
							</tr>
						  </c:forEach>
				        </tbody>
					</table>
					
					<div class="col-md-12 text-center ">
						<button type="button" class="btn btn-primary">확인</button>
					</div>
					
				</div>
		    	<!-- /////////////////////////////////////////////////////////////////////////////////// -->

		</div>
 	</div>
 </div>

</body>
</html>