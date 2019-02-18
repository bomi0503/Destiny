<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c&libraries=services"></script><!-- 다음지도 -->
	<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script><!-- 카카오공유 -->
	
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<link rel="stylesheet" href="/resources/css/main.css" > <!-- 우연메인 -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!--  ///////////////////////// 데이트픽커 시작////////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  ///////////////////////// 데이트픽커 엔드 ////////////////////////// -->
    
    <!--  ///////////////////////// 타임픽커 ////////////////////////// -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script
		src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
	    
	<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script ><!-- sweetAlert -->
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	/* 메세지 스타일 */
	#sendMessage {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
  width: 200px;
  height: 40px;
  line-height: 37px;
  vertical-align: middle;
  background-color: rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.4);
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
  -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.6);
  font-family: "Open Sans Condensed";
  font-size: 1.3rem;
  color: White;
  cursor: pointer;
  z-index: 10;
  -moz-transform-style: preserve-3D;
  -webkit-transform-style: preserve-3D;
  transform-style: preserve-3D;
  -moz-transform: none;
  -ms-transform: none;
  -webkit-transform: none;
  transform: none;
  -moz-backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  opacity: 1.0;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
#sendMessage.hide {
  -moz-transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  -ms-transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  -webkit-transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  opacity: 0.2;
}

.popup {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
  width: 30%;
  height: 300px;
  overflow: hidden;
  z-index: 20;
  font-family: "Montserrat", "Open Sans";
  padding: 10px;
  background-color: #777373;
  border: 1px solid rgba(0, 0, 0, 0.4);
  -moz-border-radius: 10px;
  -webkit-border-radius: 10px;
  border-radius: 10px;
  -moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  text-shadow: 1px 1px 8px rgba(0, 0, 0, 0.6);
  -moz-transform-style: preserve-3D;
  -webkit-transform-style: preserve-3D;
  transform-style: preserve-3D;
  -moz-transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  -ms-transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  -webkit-transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  -moz-backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  opacity: 0.2;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.popup.show {
  display: block;
  opacity: 1;
  -moz-transform: none;
  -ms-transform: none;
  -webkit-transform: none;
  transform: none;
}
.popup .headerMessage {
  padding: 10px 10px;
}
.popup .headerMessage .titleMessage {
  font-size: 1.6rem;
  font-family: "Open Sans Condensed";
  float: left;
}
.popup .headerMessage .iconMessage {
  float: right;
  font-size: 1.3rem;
}
.popup .headerMessage .iconMessage img {
  cursor: pointer;
  -moz-transform: none;
  -ms-transform: none;
  -webkit-transform: none;
  transform: none;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  -webkit-transition: all 0.3s ease;
  transition: all 0.3s ease;
}
.popup .contentMessage .iconMessage img:hover {
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -webkit-transform: scale(1.2);
  transform: scale(1.2);
}
.popup .headerMessage:before, .popup .headerMessage:after {
  content: "";
  display: table;
}
.popup .headerMessage:after {
  clear: both;
}
.popup .contentMessage {
  padding: 10px;
  position: relative;
}
.popup .contentMessage * {
  box-sizing: border-box;
  box-sizing: border-box;
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}
.popup .contentMessage html {
  background-color: #1d1f20;
  color: White;
}
.popup .contentMessage body {
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/102308/Blur-4.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  overflow: hidden;
  width: 100%;
  height: 100%;
  padding: 0;
  margin: 0;
}
.popup .contentMessage #sendMessage {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
  width: 200px;
  height: 40px;
  line-height: 37px;
  vertical-align: middle;
  background-color: rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.4);
  border-radius: 10px;
  border-radius: 10px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.6);
  font-family: "Open Sans Condensed";
  font-size: 1.3rem;
  color: White;
  cursor: pointer;
  z-index: 10;
  transform-style: preserve-3D;
  transform-style: preserve-3D;
  transform-style: preserve-3D;
  transform: none;
  transform: none;
  transform: none;
  transform: none;
  backface-visibility: hidden;
  backface-visibility: hidden;
  backface-visibility: hidden;
  opacity: 1;
  transition: all 0.5s ease;
  transition: all 0.5s ease;
  transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.popup .contentMessage #sendMessage.hide {
  transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  transform: perspective(1000px) translateY(-300px) rotateX(74deg);
  opacity: 0.2;
}
.popup .contentMessage .popup {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
  width: 50%;
  height: 300px;
  overflow: hidden;
  z-index: 20;
  font-family: "Montserrat", "Open Sans";
  padding: 10px;
  background-color: rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.4);
  border-radius: 10px;
  border-radius: 10px;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.7);
  text-shadow: 1px 1px 8px rgba(0, 0, 0, 0.6);
  transform-style: preserve-3D;
  transform-style: preserve-3D;
  transform-style: preserve-3D;
  transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  transform: perspective(1000px) translateY(300px) rotateX(-74deg);
  backface-visibility: hidden;
  backface-visibility: hidden;
  backface-visibility: hidden;
  opacity: 0.2;
  transition: all 0.5s ease;
  transition: all 0.5s ease;
  transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.popup .contentMessage .popup.show {
  display: block;
  opacity: 1;
  transform: none;
  transform: none;
  transform: none;
  transform: none;
}
.popup .contentMessage .popup .headerMessage {
  padding: 10px 10px;
}
.popup .contentMessage .popup .headerMessage .titleMessage {
  font-size: 1.6rem;
  font-family: "Open Sans Condensed";
  float: left;
}
.popup .contentMessage .popup .headerMessage .iconMessage {
  float: right;
  font-size: 1.3rem;
}
.popup .contentMessage .popup .headerMessage .iconMessage img {
  cursor: pointer;
  transform: none;
  transform: none;
  transform: none;
  transform: none;
  transition: all 0.3s ease;
  transition: all 0.3s ease;
  transition: all 0.3s ease;
  transition: all 0.3s ease;
}
.popup .contentMessage .popup .headerMessage .iconMessage img:hover {
  transform: scale(1.2);
  transform: scale(1.2);
  transform: scale(1.2);
  transform: scale(1.2);
}
.popup .contentMessage .popup .headerMessage:before, .popup .contentMessage .popup .headerMessage:after {
  content: "";
  display: table;
}
.popup .contentMessage .popup .headerMessage:after {
  clear: both;
}
.popup .contentMessage .popup .contentMessage {
  padding: 10px;
  position: relative;
}
.popup .contentMessage .popup .contentMessage textarea {
  width: 100%;
  height: 150px;
  margin: 0;
  border: 0;
  padding: 5px;
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  border-radius: 5px;
  border-radius: 5px;
  font-family: "Open Sans";
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
  color: White;
}
.popup .contentMessage textarea {
  width: 100%;
  height: 150px;
  margin: 0;
  border: 0;
  padding: 5px;
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 5px;
  border-radius: 5px;
  border-radius: 5px;
  font-family: "Open Sans";
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
  color: White;
}
	/* 메세지 끝 */

	.botton{
	 
	}
        #backround {
		    display: none;
		    position: fixed;
		    top: 0; left: 0;
		    width: 100%; height: 100%;
		    background: rgba(0,0,0,.3);
		    z-index: 10;
		}
		
		#dialog, #dialog2, #dialog3, #nextDialog {
		    display: none;
		    position: fixed;
		    left: calc( 35%); top: calc( 10% ); 
		    background: #fff;
		    z-index: 11;
		    padding: 10px;
		    max-height: 700px;
		    max-width: 350px;
		    overflow: auto;
		}
		
		#header{
			position : inherit;
		}
		
		.form-control{
			height: 38.5px;
		}
		.form-horizontal .form-group{
			margin-right: 0;
			margin-left: 0;
		}
		
		.ui-timepicker {
			font-size: 10px;
			width: 100px;
		}
		
		.ui-timepicker-table td a {
			width: 2em;
		}
     </style>
     

    
    <style>/* !!!폰트설정!!!!! */
	@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	@import url('https://fonts.googleapis.com/css?family=Cute+Font');
	 
	#bigletter span{
	     font-family: 'Nanum Pen Script', cursive;
	     font-size : 90px;
	}
	.imgmen{
		border-radius: 50%;
	}
	
	hr {    border-top: 1px solid #fff0;}
	strong { font-size : 30px}
	.neayong {
		font-family: 'Cute Font', cursive;
		font-size : 30px;
	}
	
	@media screen and (max-width:600px){	
		#dialog, #dialog2, #nextDialog{
		    left: calc( 5%);
		}
	}
	</style>
    
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	//카카오 공유
	function shareKakaotalk() {
		var titleName = $("#titleName").data("param");
		var titleImg = "192.168.0.52:8080/resources/images/meeting/"+$("#imgFile").data("param");
		var reffer = window.location.href;
		console.log(titleName);
		console.log(titleImg);
		console.log(reffer);
		
        Kakao.init("baad7faa4b3ad6290f086e2b755b061f");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"No.1 만남 Web\n우리들의 연결고리"   // 콘텐츠의 타이틀
                , description:"["+titleName+"] 모임에 초대합니다"   // 콘텐츠 상세설명
                , imageUrl: "https://i.imgur.com/hKx0BFY.jpg"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:reffer   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:reffer // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
                  likeCount:0       // LIKE 개수
                , commentCount:0    // 댓글 개수s
                , sharedCount:0     // 공유 회수
            }
            , buttons : [
                {
                      title:"우연 웹으로 이동"    // 버튼 제목
                    , link : {
                        mobileWebUrl:reffer   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:reffer // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
       
    }
	
	//다음 지도
	function loadMap(keyword){
		if(keyword ==null || keyword == ""){
			keyword = "비트캠프 종로센터";
		}
		
		
	
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
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
	}
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
		$( function() {
		    $( ".datepicker" ).datepicker({
		    	dateFormat:"yy/mm/dd"
		    });
		} );
////////////////* 수정하기에서 등록 */////////	    
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "#dialogConfrim" ).on("click" , function() {
				//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
				fncAddProduct();
		});
		
		function fncAddProduct(){
			//Form 유효성 검증
			var interestName=$("input[name='interestName']").val();
			var centerMeeting=$("#centerMeeting").data("param");
			var meetingCenter=$("select[name='meetingCenter']").val();
			var titleImg=$("input[name='imgFile']").val();
			var meetingName=$("input[name='meetingName']").val();
			var meetingDetail=$("textarea[name='meetingDetail']").val();
			var meetingCrewLimit=$("select[name='meetingCrewLimit']").val();
			var snooze=$("select[name='snooze']").val();
			var meetingDate=$("#reDate").val();
			var meetingDay=$("#weekday").val();
			var meetingTime=$("input[name='meetingTime']").val();
			var meetingLocation=$("input[name='meetingLocation']").val();
			var dt = new Date();
			var month = dt.getMonth()+1;
			var day = dt.getDate();
			var year = dt.getFullYear();
			var hours = dt.getHours();
			var minute = dt.getMinutes();
			var time = (hours + ':' +minute);
			var today = (year+'-0' +month + '-' + day+'-'+time);
			var mitingTime = ('${meetingAct.meetingDate}'+'-'+'${meetingAct.meetingTime }');
		
			console.log("관심사"+interestName);
			//console.log("센터미팅"+centerMeeting);
			//console.log("미팅센터"+meetingCenter);
			//console.log("타이틀이미지"+titleImg);
			//console.log("제목"+meetingName);
			//console.log("내용"+meetingDetail);
			//console.log("인원"+meetingCrewLimit);
			//console.log("스누즈"+snooze);
			console.log("날짜"+meetingDate);
			//console.log("요일"+meetingDay);
			//console.log("시간"+meetingTime);
			//console.log("장소"+meetingLocation);
			console.log("오늘"+today);
			alert("여기니???");
			if(interestName == null || interestName.length<1){
				swal("관심사를 선택해 주세요.");
				return;
			}
			
			if(meetingCenter == null && centerMeeting == null){
				swal("중심지역을 선택해 주세요.");
				return;
			}
			/* 
			if(titleImg == null || titleImg.length<1){
				alert("대표이미지를 설정하여 주세요.");
				return;
			}
			 */
			if(meetingName == null || meetingName.length<1){
				swal("모임이름을 작성하여 주세요.");
				return;
			}
			
			if(meetingDetail == null || meetingDetail.length<1){
				swal("모임설명을 작성하여 주세요.");
				return;
			}
			
			if(meetingCrewLimit == null || meetingCrewLimit.length<1){
				swal("모임인원을 설정하여 주세요.");
				return;
			}
			
			if(snooze!='Y' && snooze!='N'){
				swal("반복여부를 설정하여 주세요.");
				return;
			}
			
			if(meetingDate == null && meetingDay == null){
				swal("날짜를 지정하여 주세요.");
				return;
			}
			
			if (meetingDate<today) {
				swal("잘못 된 날짜입니다.");
				return;
			}
			
			if(meetingTime == null && meetingTime=='모임시간'){
				swal("모임시간을 입력하여 주세요.");
				return;
			}
			
			if(meetingLocation == null){
				swal("모임장소를 입력하여 주세요.");
				return;
			}
			
			if (confirm("내용을 수정하시겠습니까?") == true){    //확인
				
				$("#contentsForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();

			     //document.removefrm.submit();

			 }else{   //취소

			     return;

			 }
			//alert("모임이 등록되었습니다.");
		}
		
////////////////////* 다음 모임 등록 눌렀을때 이벤트 처리부분 *////////////////////////////////////////
		 $( function() {
			 var meetingnickname = "${crewList['0'].crewNickName}"; 
			 var dt = new Date();
			 var month = dt.getMonth()+1;
			 var day = dt.getDate();
			 var year = dt.getFullYear();
			 var hours = dt.getHours();
			 var minute = dt.getMinutes();
			 var time = (hours + ':' +minute);
			 var today = (year+'-0' +month + '-' + day+'-'+time);
			 var mitingTime = ('${meetingAct.meetingDate}'+'-'+'${meetingAct.meetingTime }');
			 /* ${meetingAct.meetingDate} ${meetingAct.meetingTime } */
			 console.log(today);
			 console.log(mitingTime);
			 console.log(mitingTime<today);
				
				$("button:contains('다음 모임 등록')").click(function () {
					if('${empty sessionScope.me}'=='true'){
						
						swal({
							  title: "로그인후이용가능합니다.로그인하시겠습니까?",
							  icon: "info",
							  buttons: true,
							  dangerMode: true,
							})
							.then(function(willDelete){
							  if (willDelete) {
								  $("#my-dialog,#dialog-background").toggle();
							  } else {
							    	return;
							  }
							});
					}else if("${sessionScope.me.nickName eq crewList['0'].crewNickName}"=="false"){
						swal({title:"모임장이 아니시네요", icon:"error"});
					}else if(mitingTime<today==false){
						swal({title:"아직진행중인 모임이 있습니다.완료후 등록해 주세요",icon:"error"});
					}else{
						$("#nextDialog, #backround").toggle();
					}
					
				});
		 		 $( "button.btn.btn-primary:contains('등 &nbsp;록')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
					fncAddProduct();
				}); 
			});		 
		///////////* 다음 모임 이벤트 처리 *//////////////
			
			 $( "#nextSchedul" ).on("click" , function() {
					//alert("왓음")
					var meetingDate=$("#nextDay").val();
					var meetingTime=$("#nextTime").val();
					var meetingLocation=$(".nextLocation").val();
					var meetingDues=$("#nextDues").val();
					//console.log(meetingDate);
					//console.log(meetingTime);
					//console.log(meetingLocation);
					//console.log(meetingDues);
					
					if(meetingDate == null && meetingDay == null){
						swal("날짜or요일을 설정하요 주세요.");
						return;
					}
					
					if(meetingTime == null || meetingTime=='모임시간'){
						swal("모임시간을 입력하여 주세요.");
						return;
					}
					
					if(meetingLocation == null || meetingLocation.length<1){
						swal("모임장소를 입력하여 주세요.");
						return;
					}
					
					if (confirm("내용을 수정하시겠습니까?") == true){    //확인
						
						//$("#nextDialogForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
						$.ajax( 
							 {
									url : "/meetingRest/nextMeeting",
									method : "post" ,
									dataType : "json" ,
									data : JSON.stringify({
										meetingNo : "${meeting.meetingNo}" ,
										meetingActCount : "${meetingAct.meetingActCount}",
										meetingDate :	meetingDate, 
										meetingLocation :	meetingLocation,
										meetingTime :	meetingTime,
										meetingDues :	meetingDues,
										
									}),
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										if(JSONData.result=="5018"){
											swal("someting wrong");
										}else{
											//alert(JSONData.changeList.role);
											//alert(JSONData.Meeting.role);
											//alert(JSONData.Meeting);
											if (confirm(JSONData.changeList.meetingActCount+"회 모임이 등록되었습니다.") == true){    //확인
												//alert(JSONData.changeList);
												//alert(JSONData.changeAct);
												var change = "";
												change+="<span id='thisCount' data-param='${meetingAct.meetingActCount}'>"+JSONData.changeList.meetingActCount+"회차 모임 일정 </span>";
												
												var changeList = "";
												changeList+="<img src='/resources/images/meeting/calendar.png' height='50px' alt='Pic 01' >";
												var changeList2 = "";
												changeList2+="<p>날짜 : "+JSONData.changeList.meetingDate+" "+JSONData.changeList.meetingTime+"</p><br/>";
												changeList2+="<p>장소 : "+JSONData.changeList.meetingLocation+"</p><br/>";
												changeList2+="<p>회비 :"+JSONData.changeList.meetingDues+"</p><br/>";
												
												$("#thisP").empty().html(change);
												$("#meetingActCount").empty().html(changeList);
												$("#meetingActCount2").empty().html(changeList2);
											 }else{   //취소
											     return;
											 } 
											
											
										}
									}
							}); 
					     //document.removefrm.submit();

					 }else{   //취소

						 $("#nextDialog, #backround").toggle();

					 }
				});
		
			 $( "#nextCancle" ).on("click" , function() {
				 $("#nextDialog, #backround").toggle();
			 });
		});
		

		
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
				fncAddProduct();
			});
		});
		
		 $( function() {
			    $( "#manuDate" ).datepicker();
		});
		 
		////* 관심사가 선택되면  *////
		 $(function(){
				$( "#interest" ).on("change" , function() {
					//var idx = $(".brand_ids").index(this);
					var interestNo=$(this).val();
					//console.log(interestNo);
					
					$( "#selectedInterest" ).val(interestNo);
						
				});
			});
		////* 관심사 끝  *////
		
		////* 지역구 선택부  *////
		 $(function(){
				$( "#centerLocation" ).on("change" , function() {
					//var idx = $(".brand_ids").index(this);
					var city=$(this).val();
					//console.log(city);
					
					$.ajax( 
							{
								url : "/user/json/getLocationList/"+city,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									
									var list="";
									list+="<select readonly='readonly' name='meetingCenter' class='form-control'>";
									list+="<option>시/군/구 선택</option>";
									for(i in JSONData.list){
										var town = JSONData.list[i].townName;
										
										list+="<option value='"+town+"'>"+town+"</option>";
								}
									$( "#location" ).empty().append(list);
								}
						});
				});
			});	
	 
	 
		$( function() {
			var meetingnickname = ""; 
			var index111= "";
	
			$("a.thisName").click(function () {
				var indext = $(".thisName").index(this);
				meetingnickname = $( ".thisName:eq("+indext+")" ).data("param");
				index111 = $(".thisName").index(this);
				//console.log("안쪽 인덱스"+indext);
			});
			
			//=============강퇴 클릭 시 이벤트 처리==================================//		
				$("a[href='#' ]:contains('강퇴하기')").click(function () {
					console.log("밖같쪽 인덱스"+index111);
						var masterNick = "${crewList['0'].crewNickName}";
						//console.log($(".thisName:eq("+index111+")").parent().remove());
					if(meetingnickname==masterNick){
						swal("자기자신을 선택하셨습니다.");
						
					}else{
						
						$.ajax( 
								 {
										url : "/meetingRest/getCrewrole",
										method : "post" ,
										dataType : "text" ,
										data : JSON.stringify({
											meetingNo : "${meeting.meetingNo}" ,
											meetingMasterId : "${sessionScope.me.userId}", 
											
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											
											if(JSONData=='MST'){
												swal({title:meetingnickname+"님을 강퇴하시겠습니까?",icon:"info",buttons:{cancel:"취소",confirm:"확인",},})
												.then(function(value){
													console.log(value==true);
										
													if(value==true){
														$(".thisName:eq("+index111+")").parent().remove();
														$.ajax( 
																 {
																		url : "/meetingRest/kickOut",
																		method : "post" ,
																		dataType : "json" ,
																		data : JSON.stringify({
																			meetingNo : "${meeting.meetingNo}" ,
																			crewNickName : meetingnickname,
																			crewCondition : "OUT",
																			meetingActCount : "${meetingAct.meetingActCount}",
																			
																		}),
																		headers : {
																			"Accept" : "application/json",
																			"Content-Type" : "application/json"
																		},
																		success : function(JSONData , status) {
																			if(JSONData==1){
																				swal({title:meetingnickname+" 님이 강퇴되었습니다.",icon:"success"});
																			}else{
																				swal({title:"404 관리자에게 문의하세요.",icon:"error"});
																			}
																		}
																});
													}else{
														return;
													}
												
												});
												
											}else {
												swal("모임장만 가능합니다.");
											}
										}
								}); 
					}
					 
				}); 
		
			$("a:contains('쪽지보내기')").click(function () {
				if('${empty sessionScope.me}'=='true'){
					swal({
						  title: "로그인후이용가능합니다.\n로그인하시겠습니까?",
						  icon: "info",
						  buttons: true,
						  dangerMode: true,
						})
						.then(function(willDelete){
						  if (willDelete) {
							  $("#my-dialog,#dialog-background").toggle();
						  } else {
						    	return;
						  }
						});
				}else{
					$(".popup").addClass("show");
				}
			 });
			//쪽지 취소 아이콘 눌리면
			$( "#messageCancle" ).on("click" , function() {
				$("#contentMessage").empty();
				$(".popup").removeClass("show");
			});
			
			
			//쪽지보내기 아이콘 눌리면
			 $( "#sendNow" ).on("click" , function() {
				  
				 var letterTitle = $("input[name='letterTitle']").val();
				 var letterDetail = $("textarea[name='letterDetail']").val();
				 $("#thisIsReceiver").val(meetingnickname); 
				 
				 if(letterTitle == "" || letterDetail == ""){
					swal("필수값이 입력되지 않았습니다.")
					return; 
				 }
				 $(".popup").removeClass("show");
				 swal({title:meetingnickname+"님에게 쪽지를 발송하였습니다.",icon:"success",buttons:{confirm:"확인"},})
				 .then(function(value){
					 if(value==true){
						 //$("#massageForm").attr("method" , "POST").attr("action" , "/letter/sendLetter").submit();
						
						 $.ajax( 
								 {
										url : "/letterRest/sendLetter",
										method : "post" ,
										dataType : "json" ,
										data : JSON.stringify({
											receiverId : meetingnickname,
											letterTitle : letterTitle,
											letterDetail :letterDetail,
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											//alert("왔음");
												swal({title:"404 관리자에게 문의하세요.",icon:"error"});
											
										}
						});
						 
					 }else{
						 return;
					 }
				 });
				 //$("#massageForm").attr("method" , "POST").attr("action" , "/letter/sendLetter").submit();
				 
			 });
				
			});
		 
		$( function() {
			var meetingnickname = ""; 
			$("a.thisName").click(function () {
				var indext = $(".thisName").index(this);
				meetingnickname = $( ".thisName:eq("+indext+")" ).data("param");
			});
			
				//==================위임 클릭 시 모임장인지 확인==================================//
				$("a[href='#' ]:contains('위임하기')").click(function () {
					var masterNick = "${crewList['0'].crewNickName}";
					
					if(meetingnickname==masterNick){
						swal({title:"자기자신을 선택하셨습니다 다른사람을 선택해주세요",icon:"error"});
					}else{
						
						swal({title:meetingnickname+"님에게 모임장을 위임 하시겠습니까?",icon:"info",buttons:{cancel:"취소",confirm:"확인",},})
						.then(function(value){
							if(value==true){    //확인
								
								$.ajax( 
										 {
												url : "/meetingRest/passto",
												method : "post" ,
												dataType : "json" ,
												data : JSON.stringify({
													meetingNo : "${meeting.meetingNo}" ,
													crewNickName : masterNick, /* 모임장 아이디 */
													role : "MST",
													targetId : meetingnickname, /* 타겟 아이디 */
													
												}),
												headers : {
													"Accept" : "application/json",
													"Content-Type" : "application/json"
												},
												success : function(JSONData , status) {
													console.log(JSONData);
												
													if(JSONData==2){
														swal({title:meetingnickname+" 님이 모임장이되었습니다.",icon:"success"});
														window.location.reload();
													}
													
												}
								}); 
							 }else{   //취소
							     return;
							 }
						});
					}
				});
		});
						
//////////////////////////////////////////////////////////////////////////////////////////////////////////////			

///////////////////////////////* 참여하기 눌렀을때 이벤트 처리부분 *///////////////////
		 $( function() {
				$("button:contains('참여하기')").click(function () {
					var count = $("#thisCount").data("param");
					if('${empty sessionScope.me}'=='true'){
						
						swal({
							  title: "로그인후이용가능합니다.\n로그인하시겠습니까?",
							  icon: "info",
							  buttons: true,
							  dangerMode: true,
							})
							.then(function(willDelete){//확인
							  if (willDelete) {
								  $("#my-dialog,#dialog-background").toggle();
							  } else {
							    	return;
							  }
							});
						
					}else{
						
						$.ajax( 
						 {
								url : "/meetingRest/addActList",
								method : "post" ,
								dataType : "json" ,
								data : JSON.stringify({
									meetingNo : "${meeting.meetingNo}" ,
									meetingMasterId : "${sessionScope.me.userId}",
									meetingActCount : count,
									//meetingDate : "${meetingAct.meetingDate}",
									//meetingTime : "${meetingAct.meetingTime}",
									//meetingLocation : "${meetingAct.meetingLocation}",
								
									
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData==5018){
										/* 
										if (confirm("모임원만 참여가능합니다.\n가입하시겠습니까?") == true){    //확인
											$("#dialog2, #backround").toggle();
										 }else{   //취소
										     return;
										 }
										 */
										swal({
											  title: "모임원만 참여가능합니다.\n가입하시겠습니까?",
											  icon: "info",
											  buttons: true,
											  dangerMode: true,
											})
											.then(function(willDelete){//확인
											  if (willDelete) {
												  $("#dialog2, #backround").toggle();
											  } else {
											    	return;
											  }
											});
										 
									}else if(JSONData==486){
										swal("이미 참여하셨습니다.");
									}
									else{
										swal("${meeting.meetingName} ${meetingAct.meetingActCount} 회", "모임에 참여되었습니다.","success");
										
									}
								}
						}); 
						
					}
					
				});
			});

		 $( function() {
				/////////////////* 참여자목록 눌렀을때 이벤트 처리부분 */
				$("button:contains('참여자목록')").click(function () {
					var count = $("#thisCount").data("param");
					console.log(count);
					
					if('${empty sessionScope.me}'=='true'){
					
						swal({
							  title: "로그인후이용가능합니다.\n로그인하시겠습니까?",
							  icon: "info",
							  buttons: true,
							  dangerMode: true,
							})
							.then(function(willDelete){//확인
							  if (willDelete) {
								  $("#my-dialog,#dialog-background").toggle();
							  } else {
							    	return;
							  }
							});
					}else{
						
						$.ajax( 
						 {
								url : "/meetingRest/getActCrew",
								method : "post" ,
								dataType : "json" ,
								data : JSON.stringify({
									meetingNo : "${meeting.meetingNo}" ,
									meetingMasterId : "${sessionScope.me.userId}", 
									meetingActCount : count,
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData.result==0){
										
										swal({
											  title: "모임원만 열람가능합니다.\n가입하시겠습니까?",
											  icon: "info",
											  buttons: true,
											  dangerMode: true,
											})
											.then((willDelete) =>{//확인
											  if (willDelete) {
												  $("#dialog2, #backround").toggle();
											  } else {
											    	return;
											  }
											});
									}else {
										//alert(JSONData.actCrewList[0].masterProfileImg);
										 var crewArray = new Array();
										var displayValue = JSONData.actCrewList;
										for(i=0; i+1<=displayValue.length; i++){
											crewArray[i] = displayValue[i].masterProfileImg;
										}
										//console.log(crewArray);
										//console.log("<img src='/resources/images/userprofile/"+crewArray[0]+"'width='100px' height='100px'>")
										
											var display = "<h6>"
											for(i=0; i+1<=displayValue.length; i++){
												display+="<img src='/resources/images/userprofile/"+displayValue[i].masterProfileImg+"' width='100px' height='100px'> <br/>";
												display+=displayValue[i].crewNickName+"<br/>";
											}
												display+="<button id='joinerConfirm' role='button'>확인</button>"
												display+="</h6>";
												
										console.log(display);	
										$( ".actCrewList" ).html(display);
										$("#dialog3, #backround").toggle();
										
									}
								}
						}); 
						
					}
					 
				});
				/////         참여자 끝!!!!!!!!!!!                  ////
				
				/////////////////빽그라운드////////////////////
		 		$("#backround").click(function () {
					//alert("dd");
					$("#backround,#dialog2,#dialog,#dialog3,#nextDialog").hide();
				});
				//////////////////빽그라운드 끝!!!!!!!/////////////////
				//=============승계
				$("button:contains('승계')").click(function () { 	
					if('${empty sessionScope.me}'=='true'){
						
						swal({
							  title: "로그인후이용가능합니다.\n로그인하시겠습니까?",
							  icon: "info",
							  buttons: true,
							  dangerMode: true,
							})
							.then((willDelete) =>{//확인
							  if (willDelete) {
								  $("#my-dialog,#dialog-background").toggle();
							  } else {
							    	return;
							  }
							});
					}else{
						
				
						$.ajax( 
							 {
									url : "/meetingRest/takeOver",
									method : "post" ,
									dataType : "json" ,
									data : JSON.stringify({
										meetingNo : "${meeting.meetingNo}" ,
										meetingMasterId : "${sessionScope.me.userId}", 
										role : "MST",
									}),
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										if(JSONData.result==0){
											swal("모임원이 아니시네요");
											
										}else {
											//alert("모임장 가자~~");
											self.location="/meeting/getMeeting?meetingNo="+${meeting.meetingNo};
											
										}
									}
							}); 
						
					}//else 끝!!
					
				});
			});
		
		$(function () {
			///////////      참여자 확인 눌렀을때    ////////////
			$(document).on("click","#joinerConfirm",function(){
				$("#dialog3, #backround").toggle();
			});
		});

	</script>
	
	<!-- 다음 우편 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c"></script> -->
	<script>
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	    
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample6_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	    
	</script>
	<!-- 다음우편 끝 -->
	
	
	
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
    <jsp:include page="/layout/header.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->


	<!--  화면구성 div Start /////////////////////////////////////-->
	<form id="detailForm">
	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
	<input type="hidden" name="meetingCondition" value="DEL">
	</form>
	<div class="container" >
		<div class="col-xs-12 col-sm-12 col-md-12 neayong" align="center" id="bigletter">
		  	<span id="titleName" data-param="${meeting.meetingName}">${meeting.meetingName}</span><br/>
		  	<script type="text/javascript">
			  	window.onload = function () {
			  		var meetlist = "${meeting.interestName}".split("/");
				  	console.log(meetlist[0]);
				  	$("#imgid").attr("src","/resources/images/interest/"+meetlist[0]+".png");
			  	}
			  	
		  	</script>
		  	<img id="imgid" src="/resources/images/interest/dd.png" width="50px" height="50px"/>
		  	${meeting.interestName}
		  	
		</div>

		<c:if test="${crewList['0'].role != 'MST'}">	

		 <div class="page-header">
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-mm-dd" /></c:set> 
	       <h3 class=" text-info">
	       	<p>모임장이 떠낫어요ㅠㅠ</p> 
	       	<p>모임장을 승계하지 않으면 </p> 
	       	<p>모임이 삭제 될 예정입니다.</p> 
	       </h3>
	       <button type="button" id="btn-takeOver">승계</button>
	      <!-- <img src="/resources/images/meeting/master2.png" width="50px" height="50px"/> be a master -->
	    </div>
		</c:if>

		<div class="row">
		  <div class="col-md-12">
		  	<img src="/resources/images/meeting/${meeting.titleImg}" class="col-xs-12 col-md-12"/>
		  </div>
		  
		  <div class="col-md-12">
		  
		  	<div class="row"><br/>
	  			<div class="col-xs-4 col-md-4"><strong>Who I'm</strong></div><hr/>
				<div style="white-space:pre;" class="col-xs-8 col-md-8 neayong">${meeting.meetingDetail}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-5 col-md-5 "><strong>Rule</strong></div><hr/>
				<div style="white-space:pre;" class="col-xs-7 col-md-7 neayong">${meeting.meetingRule}</div>
			</div>
			<hr/>
		  </div>
		 </div>
		<c:if test="${crewList['0'].role=='MST'}">	
		<div class='row'>
			<table class="col-sm-12 col-md-12">
				<tr>
					<td id="thisP">
					<span id="thisCount" data-param="${meetingAct.meetingActCount}"> ${meetingAct.meetingActCount}회차 모임 일정 </span>
					</td>
				</tr>
			</table>
		</div>	
		

		<div>
			<div class='row'>
				<div id="meetingActCount" align="center" class="col-xs-2 col-md-2 ">
					<img src="https://img.icons8.com/color/48/000000/calendar.png" style="width: 100%" alt="Pic 01" >
				</div>
				
				<div id="meetingActCount2" class="col-xs-6 col-md-6 ">
				<p> 날짜 : ${meetingAct.meetingDate} ${meetingAct.meetingTime } </p>
				<p> 장소 : ${meetingAct.meetingLocation} </p>
				<p> 회비 : ${meetingAct.meetingDues} </p>
				
				</div>
			
				<div class="col-xs-4 col-md-4 ">
					<div align="center">
					<button class="button small">참여하기</button>
					<button class="button small">참여자목록</button><hr/>
					</div>
				</div>
					<c:if test="${meeting.snooze=='Y'}">
						<div align="center">
							<button  class="button small" type="button" id="nextMeeting">다음 모임 등록</button>
						</div>
						
					</c:if>
				<a id="kakao-link-btn" onclick="shareKakaotalk()">
					<img style="width: 42px; height: 42px;" src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
				</a>
			</div>
			<div class='row'>
			<!-- 다음지도 -->
			<div id="map" style="width:70%;height:350px;margin-left: 12%; margin-top: 15px;"></div>

			
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${meetingAct.meetingLocation}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			/* 
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);
			 */
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 
			</script>
			<!-- 다음지도 끝 -->
			</div>
			
		</div>
		</c:if>
	
		<hr/>
		<div align="center" class="col-xs-12 col-md-12 ">
			<button class="button" style="margin-bottom: 30px; width: 100%;">가입하기</button>
		</div>
		
		<!-- 후기 보기  -->
		<section id="linkmove" class="wrapper align-center" style="margin-top: 100px;">
				
				
				<div class="inner col-xs-12 col-md-12">
				<h2 style="margin-top: -80px;text-align: -webkit-auto;">모임 후기 </h2>
					<div id="frogue-container" class="position-right-bottom"
					      data-color="#555a9c"
					      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-init-key="value"
					      ></div>
					
					<div class="flex secondSection">
					<%-- <c:set var="i" value="0"/>
				 	<c:forEach var="hot" begin="0" end="2" step="1" items="${hotlist}">
				 	<c:set var="i" value="${ i+1 }" /> --%>
						<div class='move_meeting todayTogether' id="">
							<span onclick="gotoMeeting(${hot.meetingNo })"><img style='width: 300px; height: 300px; border-radius:30px; margin-bottom: 10px;' src='/resources/images/meeting/job2.jpg'></span>
						</div>
						<div class='move_meeting todayTogether' id="">
							<span onclick="gotoMeeting(${hot.meetingNo })"><img style='width: 300px; height: 300px; border-radius:30px; margin-bottom: 10px;' src='/resources/images/meeting/job2.jpg'></span>
						</div>
						<div class='move_meeting todayTogether' id="">
							<span onclick="gotoMeeting(${hot.meetingNo })"><img style='width: 300px; height: 300px; border-radius:30px; margin-bottom: 10px;' src='/resources/images/meeting/job2.jpg'></span>
						</div>
					<%-- </c:forEach> --%>
					<%-- <c:if test="${empty hotlist}">
						<span>등록된 후기가 없습니다.<input style="margin-left: 2%;" type="button" class="addMeeting" value="게시판 바로가기"></span>
					</c:if> --%>
					
					</div>
					
				</div>
			</section>
		<!-- 후기 완료  -->
		
		<jsp:include page="/meeting/modal.jsp" />
		<!-- 모달창 디자인 부분 :: 가입하기 모달창 -->
        <div id="dialog2" class="madal">
        <form id="dialog2form" class="form-horizontal">
        <div>
        	<div name="meetingMasterId" value="${sessionScope.me.userId}" class="form-group col-sm-12 col-md-12" align="center">
        		<img src="/resources/images/userprofile/${sessionScope.me.profile}" width="100px" height="100px" class="imgmen"/>
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
        		${sessionScope.me.nickName}
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
        		<textarea id="interviewTitle" class="form-control" cols="100" rows="1" 
		 	 placeholder="제목을 입력해주세요" ></textarea>
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
		 	<textarea id="interview" class="form-control" cols="100" rows="3" 
		 	 placeholder="내용을 입력해주세요" ></textarea>
		 	</div>
	        <div class="form-group col-sm-12 col-md-12" align="center">
	         <a type="button" class="btn btn-success"  >확 &nbsp;인</a>
	         <a class="btn btn-primary btn cancelbtn" id="pushCancle2" role="button">취&nbsp;소</a>
	         </div>
	    </div>
        </form>
        <!-- 모달창 디자인 부분  끝-->
        </div>

		<div style="margin-top: 213px;">
			<table>
				
				<tr>
					<td>
					모임멤버${crewCount}명 / 정원 ${meeting.meetingCrewLimit}명
					</td>
				</tr>
				
				<tr>
					<td>
					
					<c:forEach var="crew" items="${crewList}">
					
					 		<div class="dropdown">
					 			<div class="col-xs-12 col-sm-12 col-md-12">
						 			<img src="/resources/images/userprofile/${crew.masterProfileImg}" style="height: 50px; margin-bottom: 6px;"  class="col-xs-4 col-sm-1 col-md-1 imgmen">
									<c:if test="${me.nickName ne crew.crewNickName }">
										<a href="#" class="dropdown-toggle thisName col-xs-2 col-sm-3 col-md-3" data-param="${crew.crewNickName}" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
											<span id="masterNick" data-param="${crew.crewNickName}">${crew.crewNickName}</span>
											<span class="caret"></span>
										</a>
									</c:if>
									<c:if test="${me.nickName eq crew.crewNickName }">
										<div class="thisName col-xs-2 col-sm-6 col-md-6" data-param="${crew.crewNickName}" role="button" aria-haspopup="true" aria-expanded="false"> 
											<span id="masterNick" data-param="${crew.crewNickName}">${crew.crewNickName}</span>
											<span class="caret"></span>
										</div>
									</c:if>
									<span class="col-xs-1 col-sm-2 col-md-2">${crew.interviewTitle}</span>
									<c:if test="${crew.role=='MST' }"><span><strong class="col-xs-3 col-sm-3 col-md-3">모임장</strong></span></c:if>
									
								
								<ul class="dropdown-menu">
									<c:if test="${sessionScope.me.nickName eq crewList['0'].crewNickName }">
										<li><a href="#">강퇴하기</a></li>
										<li><a href="#">위임하기</a></li>
									</c:if>
										<li><a href="#">쪽지보내기</a></li>
								</ul>
								</div>
							</div>
					</c:forEach>
					</td>
				</tr>
			</table>
		</div>
		
<!--=======================참여자 목록 모달창================-->
		<div id="dialog3">
			<div class="actCrewList">
				<form id="dialog3From" class="form-horizontal">
				
				</form>
			</div>
		</div>
		
	</div>
	
			<!-- footer -->
		<jsp:include page="/layout/footer.jsp" />
		<!-- //footer -->

	<!-- ////////////////      탭하면 나오는 메뉴 시작             ////////////////////// -->

		    <jsp:include page="/meeting/tapMeun.jsp" />

	<!-- ////////////////      탭하면 나오는 메뉴 끝ㅇ             ////////////////////// -->
		    <!-- 수정하기 모달창  -->
        <div id="dialog" class="modal">
        <!-- //////////////////////////모달창  내용부/////////////////////////////////////////////////// -->
        	<form id="contentsForm" class="form-horizontal">
        	<div id="nextdelete">
        	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
				 <div  class="form-group col-sm-4 col-md-4">
				 	<select id="interest" class="form-control">
				 		<option >관심사</option>
				 		<c:forEach var="Meeting" items="${list}">
				 		
				 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
				 		
				 		</c:forEach>
				 	</select>
				 </div>
				
				 <div class="form-group col-sm-8 col-md-8">
				 	<input style="width: 100%" name="interestName" id="selectedInterest" type="text" class="form-control" value="${meeting.interestName}">
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
				 	<input style="width: 100%" type="text" class="form-control" id="centerMeeting" name="meetingCenter" data-param="${meeting.meetingCenter}" value="${meeting.meetingCenter}">
				 	
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input type="file" class="form-control" name="imgFile" id="imgFile" data-param="${meeting.titleImg}" value="${meeting.titleImg}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input style="width: 100%" type="text" class="form-control" name="meetingName" value="${meeting.meetingName}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<textarea class="form-control" cols="100" rows="3" 
				 	name="meetingDetail" placeholder="어떤 모임인지 설명해주세요" >${meeting.meetingDetail}</textarea>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<textarea class="form-control" cols="100" rows="3" 
				 	name="meetingRule" placeholder="모임에 규칙이 있나요? 있다면 간략히 적어주세요">${meeting.meetingRule}</textarea>
				 </div>
				 
				 <div class="form-group col-sm-8 col-md-8">
				 	모임인원을 입력하여 주세요
				 </div>
				
				 <div id="crewNo" class="form-group col-sm-4 col-md-4">
				 	<select name="meetingCrewLimit" class="form-control">
				 		<option value="2" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==2 ? "selected" : "" }>2</option>
				 		<option value="3" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==3 ? "selected" : "" }>3</option>
				 		<option value="4" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==4 ? "selected" : "" }>4</option>
				 		<option value="5" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==5 ? "selected" : "" }>5</option>
				 		<option value="6" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==6 ? "selected" : "" }>6</option>
				 		<option value="7" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==7 ? "selected" : "" }>7</option>
				 		<option value="8" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==8 ? "selected" : "" }>8</option>
				 		<option value="9" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==9 ? "selected" : "" }>9</option>
				 		<option value="10" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==10 ? "selected" : "" }>10</option>
				 		<option value="11" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==11 ? "selected" : "" }>11</option>
				 		<option value="12" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==12 ? "selected" : "" }>12</option>
				 		<option value="13" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==13 ? "selected" : "" }>13</option>
				 		<option value="14" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==14 ? "selected" : "" }>14</option>
				 		<option value="15" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==15 ? "selected" : "" }>15</option>
				 		<option value="16" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==16 ? "selected" : "" }>16</option>
				 		<option value="17" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==17 ? "selected" : "" }>17</option>
				 		<option value="18" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==18 ? "selected" : "" }>18</option>
				 		<option value="19" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==19 ? "selected" : "" }>19</option>
				 		<option value="20" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==20 ? "selected" : "" }>20</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<select style="width: 100%;" name="snooze" id="snooze" class="form-control">
				 		<option>반복여부</option>
				 		<option value="Y" ${ ! empty meeting.snooze && meeting.snooze=='Y' ? "selected" : "" }>반복</option>
				 		<option value="N" ${ ! empty meeting.snooze && meeting.snooze=='N' ? "selected" : "" }>한번</option>
				 	</select>
				 </div>
			</div>	 
				 <div  id="dateOrDay" class="form-group col-sm-12 col-md-12">
		 			<input value="${meetingAct.meetingDate }" style="width: 100%;padding-left: 0px;padding-right: 0px;" 
		 			type="text" class="datepicker" readonly="readonly" class="form-control" 
		 			placeholder="모임날짜" id="reDate" name="meetingDate"/>
		 	
				 	<!--  
				 	<select class="form-control">
				 		<option value="">모임날짜or요일</option>
				 	</select>
				 	-->
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input value="${meetingAct.meetingTime }" style="width: 100%;" type="text" readonly="readonly"
					class='form-control timepicker' name="meetingTime"
					placeholder="시간을 선택해 주세요.">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	회비가 있다면 입력해주세요
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input value="${meetingAct.meetingDues}" style="width: 100%;" name="meetingDues" placeholder="ex)회비 1만원" type="text" class="form-control" value="${meeting.meetingDues}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
					<input value="${meetingAct.meetingLocation}" style="width: 100%;" name="meetingLocation" type="text" class="form-control"
						id="place" placeholder="주소를 입력해주세요.">
				</div>
	
				<div class="form-group col-sm-12 col-md-12">
					<input style="width: 100%;" type="button" class="btn btn-warning"
						 id="placeSearch" value="주소 검색"><br>
				</div>
				  
				 <div class="form-group">
				   <div class="col-sm-12 col-md-12 text-center">
				     <button class="col-sm-6 col-md-6 text-center"  id="dialogConfrim">확&nbsp;인</button>
					 <button class="col-sm-6 col-md-6 text-center" >취&nbsp;소</button>
				   </div>
				 </div>
				 
				 <div id="map2" style="width:100%;height:350px;"></div>
		</form>
		<!-- //////////////////////////모달창  내용부 끝/////////////////////////////////////////////////// -->
		</div>
		
		<div class="popup">
		<form id="massageForm">
		
		<input type="hidden" name="receiverId" id="thisIsReceiver" value="">
		  <div class="headerMessage">
		    <div class="titleMessage">Send a message</div>
		    <div id="messageCancle" align="end"><img src="https://img.icons8.com/ultraviolet/20/000000/delete-sign.png"></div>
		  </div>
		  <div class="contentMessage">
		 	<input placeholder="message title" type="text" id="letterTitle" name="letterTitle" style="background:#0000004d; border: 1px solid #00000033;width: 100%;margin-bottom: 5px; color: white;">
		    <textarea name="letterDetail" id="messageText" placeholder="Your message"></textarea>
		    <div class="iconMessage" id="sendNow" align="end"><img src="https://img.icons8.com/ultraviolet/30/000000/paper-plane.png"></div>
		  </div>
		</form> 
		</div>
		<div id="backround"></div>
		
</body>

</html>