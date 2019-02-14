
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
<style>
#map {
    width:100%; 
    min-width: 500x; 
    max-width: 1000px;
    height: 500px; 
    margin: 0 auto;
}

.row{text-align : center; }
.count{font-size: 25px; font-weight: bold; color: #6666ff;}
   
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px; height: 90px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; }
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
.ellipsis p{display:block; width:20px; height:30px;}

.border article{border:1px solid red;}

/* /////////////////////////////////// */

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

/* /////////////////////////////////// */
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
		$( "button:contains('Ȯ��')" ).on("click" , function() {
			self.location = "/find/mainFind.jsp"
		});
		
		$(  "a[name='goMeeting']" ).on("click" , function() {
			var meetingNo = $(this).data("param");
			console.log(meetingNo);
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		});
	});
		
	</script>
	
	<!-- //All js -->	

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>����<span class="slim">���</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			
			<div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9&libraries=services"></script>
				<div id="map"></div>
				<script>
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
					    mapOption = {
					        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
					        level: 5 // ������ Ȯ�� ����
					    };  
					
					// ������ �����մϴ�    
					var map = new daum.maps.Map(mapContainer, mapOption); 
					
				</script>
				
				<c:forEach var="meeting" items="${list}">
				<script>
					// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
					var geocoder = new daum.maps.services.Geocoder();
						// �ּҷ� ��ǥ�� �˻��մϴ�
						geocoder.addressSearch('${meeting.meetingLocation} ', function(result, status) {
						
						    // ���������� �˻��� �Ϸ������ 
						     if (status === daum.maps.services.Status.OK) {
						
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						        
						        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
						        var marker = new daum.maps.Marker({
						            map: map,
						            position: coords
						        });
						        
						        var content = '<div class="wrap" id="${meeting.meetingNo}">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '           ${meeting.meetingName}' + 
					            '            <div class="close" onclick="closeOverlay(${meeting.meetingNo})" title="�ݱ�" ></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="img">' +
					            '                <img src="/resources/images/meeting/${meeting.titleImg}" width="73" height="70"/>' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis"><p>${meeting.meetingLocation}</p></div>' + 	
					            '                <div><a href="/meeting/getMeeting?meetingNo=${meeting.meetingNo}" target="_blank" class="link">����������</a></div>' + 	
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';
						        
						        var overlay = new daum.maps.CustomOverlay({
						            content: content,
						            position: marker.getPosition()
						        });
		
						        // ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
						       	daum.maps.event.addListener(marker, 'click', function() {
						       		if($('#${meeting.meetingNo}').hide()){
						       			$('#${meeting.meetingNo}').show();
						       		}
						       			overlay.setMap(map);
						            
						        });
		
						        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
						        map.setCenter(coords);
						     // Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
						       /* function closeOverlay() {
						            //overlay.setMap(null);
						        } */
						     
						     // ����������� ��ҿ� ���� ������ ǥ���մϴ�
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="padding:5px;font-size:12px;"> ${meeting.meetingName}</div>'
						        });
						        /*infowindow.open(map, marker); */
						        
						        (function(marker, infowindow) {
						            // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
						            daum.maps.event.addListener(marker, 'mouseover', function() {
						                infowindow.open(map, marker);
						            });
		
						            // ��Ŀ�� mouseout �̺�Ʈ�� ����ϰ� ���콺 �ƿ� �� ���������츦 �ݽ��ϴ�
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
			
<style>
body ul, body ol, body li{margin:0; padding:0; list-style:none;}
.list-wrap{max-width:1400px; margin:0 auto;}
.list-wrap:after{content:''; display:block; clear:both;}
.list-item{box-sizing:border-box; float:left; width:calc(33.333% - 30px); margin:0 15px; margin-top:20px; padding: 15px; border:1px solid #7d7b7b; border-radius:10px;}
.list-img{max-width:200px; width:100%;}
.list-tit{
	font-size: 1.75em;
	color: #555;
    font-weight: 400;
    line-height: 1.5;
    margin: 1em 0 1em 0;
}
.list-desc{margin-bottom:15px;}

@media all and (max-width:1280px) {
.border .inner{max-width:100%;}
}

@media all and (max-width:1024px) {
.list-wrap .button{box-sizing:border-box; width:100%; padding:0 2%; max-width:180px;}
.list-item{width:calc(50% - 30px); margin-top:10px;}
}

@media all and (max-width:768px) {
.list-item{width:100%; margin:10px 0 0;}
.list-item:nth-child(-n+2){margin-top:10px;}
.list-desc{margin-bottom:5px; font-size:0.8rem;}
.list-tit{
	font-size: 1.25em;
	color: #555;
    font-weight: 400;
    line-height: 1.5;
    margin: 1em 0 1em 0;
}
}
</style>
		
			<section class="align-center border">
				<div class="inner">
					<ul class="list-wrap">
					
						<c:set var="i" value="0" />
					  	<c:forEach var="meeting" items="${list}">
						<c:set var="i" value="${ i+1 }" />						  
						  <li class="list-item">
							<img src="/resources/images/meeting/${meeting.titleImg}" class="list-img" width="50px" height="150px">
							<h3 class="list-tit">${meeting.meetingName}</h3>
							<p class="list-desc">${meeting.meetingDate}</p>
							<p class="list-desc">${meeting.meetingCenter}</p>
							<p class="list-desc" style="min-height:60px;">${meeting.meetingLocation}</p>
							<a href="#" class="button" name="goMeeting" data-param="${meeting.meetingNo}">��������</a>
						</li>
					  </c:forEach>
					</ul>
				</div>
			</section>
			
			<%-- <div>
				<table class="table table-hover table-striped">
			        <thead>
			          <tr>
			            <th align="center">No</th>
			            <th align="center">Image</th>
			            <th align="left">���Ӹ�</th>
			            <th align="center">���ӳ�¥</th>
			            <th align="center">�߽���</th>
			            <th align="center">�������</th>
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
			</div> --%>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>