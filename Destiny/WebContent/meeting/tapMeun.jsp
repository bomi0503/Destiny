<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.1.2/css/material-design-iconic-font.min.css">
<style media="screen">
		#followingbtn {  
		  position:fixed;
		  /* height:10%;  */  /* 퀵메뉴, 배너 이미지의 높이 */
		 /*  width:10%;  */   /* 퀵메뉴, 배너 이미지의 너비*/
		 bottom :100px;
		 right : 15px;
		 /*
		 margin:0px 0px 10% 88%; */  /* 가장 오른쪽의 수치가 화면 가운데에서 얼마만큼 오른쪽으로 레이어를 붙일 것인지 설정  */ 
			
		 /*  top: 10%;  */ /* 배너 상단에서 얼마나 떨어뜨릴지 설정*/
		  text-align: left;
		  background: #fff0;
		}
	</style> 
	<style> /* 탭하면 나오는 메뉴 */
		@import url(https://fonts.googleapis.com/css?family=Roboto:400,500);
		
		.menu-button {
		  -webkit-transition: 0.4s;
		  -moz-transition: 0.4s;
		  transition: 0.4s;
		  /* position: absolute; */
		  /* top : 25em;
		  right: 10px; */
		  margin-top : 80px;
		  width: 60px;
		  height: 60px;
		  text-align: center;
		  line-height: 60px;
		  border-radius: 50%;
		  background-color: #E91E63;
		  color: #FFFFFF;
		  font-size: 24px;
		  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0 rgba(0, 0, 0, 0.22);
		  cursor: pointer;
		  z-index: 100;
		}
		.menu-butt {
		  -webkit-transition: 0.4s;
		  -moz-transition: 0.4s;
		  transition: 0.4s;
		  /* position: absolute;
		  top : 31em;
		  right: 10px; */
		  
		  width: 60px;
		  height: 60px;
		  text-align: center;
		  line-height: 60px;
		  border-radius: 50%;
		  background-color: #4169E1;
		  color: #FFFFFF;
		  font-size: 24px;
		  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0 rgba(0, 0, 0, 0.22);
		  cursor: pointer;
		  z-index: 100;
		}
		
		.menu-button:hover {
		  background: #d81557;
		  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.28), 0 4px 15px 0 rgba(0, 0, 0, 0.25);
		}
		.menu-button a {
		  -webkit-transition: 0.4s;
		  -moz-transition: 0.4s;
		  transition: 0.4s;
		  opacity: 0;
		  width: 0px;
		  height: 0px;
		  text-align: center;
		  line-height: 50px;
		  border-radius: 50%;
		  color: #FFFFFF;
		  font-size: 24px;
		  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26), 0 2px 10px 0 rgba(0, 0, 0, 0.22);
		  cursor: pointer;
		}
		.menu-button a:hover {
		  box-shadow: 0 5px 11px 0 rgba(0, 0, 0, 0.28), 0 4px 15px 0 rgba(0, 0, 0, 0.25);
		}
		.menu-button a:nth-child(2) {
		  -webkit-transition-delay: 0.3s;
		  -moz-transition-delay: 0.3s;
		  transition-delay: 0.3s;
		  position: absolute;
		  right: 30px;
		  bottom: 30px; 
		  background: #55acee;
		}
		.menu-button a:nth-child(3) {
		  -webkit-transition-delay: 0.4s;
		  -moz-transition-delay: 0.4s;
		  transition-delay: 0.4s;
		  position: absolute;
		  right: 30px;
		  bottom: 30px;
		  background: #dc4e41;
		}
		.menu-button a:nth-child(4) {
		  -webkit-transition-delay: 0.5s;
		  -moz-transition-delay: 0.5s;
		  transition-delay: 0.5s;
		  position: absolute;
		  right: 30px;
		  bottom: 30px;
		  background: #3F3F3F;
		}
		.menu-button a:nth-child(5) {
		  -webkit-transition-delay: 0.4s;
		  -moz-transition-delay: 0.4s;
		  transition-delay: 0.4s;
		  position: absolute;
		  right: 30px;
		  bottom: 30px;
		  background: #dc4e41;
		}
		.menu-button a:nth-child(6) {
		  -webkit-transition-delay: 0.5s;
		  -moz-transition-delay: 0.5s;
		  transition-delay: 0.5s;
		  position: absolute;
		  right: 30px;
		  bottom: 30px;
		  background: #3F3F3F;
		}
		.menu-button a:nth-child(7) {
		  -webkit-transition-delay: 0.4s;
		  -moz-transition-delay: 0.4s;
		  transition-delay: 0.4s;
		  position: absolute;
		  right: 30px;
		  bottom: 30px;
		  background: #dc4e41;
		}
		
		.menu-button:hover a {
		  opacity: 1;
		  width: 50px;
		  height: 50px;
		}
		.menu-button:hover a:nth-child(2) {
		  right: 80px;
		  bottom: 0px;
		}
		.menu-button:hover a:nth-child(2):hover {
		  -webkit-transition-delay: 0s;
		  -moz-transition-delay: 0s;
		  transition-delay: 0s;
		  background: #3ea1ec;
		}
		.menu-button:hover a:nth-child(3) {
		  right: 65px;
		  bottom: 65px;
		}
		.menu-button:hover a:nth-child(3):hover {
		  -webkit-transition-delay: 0s;
		  -moz-transition-delay: 0s;
		  transition-delay: 0s;
		  background: #d83a2b;
		}
	 	.menu-button:hover a:nth-child(4) {
		  right: 0px;
		  bottom: 80px;
		}
		.menu-button:hover a:nth-child(4):hover {
		  -webkit-transition-delay: 0s;
		  -moz-transition-delay: 0s;
		  transition-delay: 0s;
		  background: #323232;
		}
		.menu-button:hover a:nth-child(5) {
		  right: 65px;
		  bottom: -65px;
		}
		.menu-button:hover a:nth-child(5):hover {
		  -webkit-transition-delay: 0s;
		  -moz-transition-delay: 0s;
		  transition-delay: 0s;
		  background: #d83a2b;
		}
		.menu-button:hover a:nth-child(6) {
		  right: 0px;
		  bottom: -80px;
		}
		.menu-button:hover a:nth-child(6):hover {
		  -webkit-transition-delay: 0s;
		  -moz-transition-delay: 0s;
		  transition-delay: 0s;
		  background: #323232;
		}
		.menu-button:hover a:nth-child(7) {
		  right: -65px;
		  bottom: -65px;
		}
		.menu-button:hover a:nth-child(7):hover {
		  -webkit-transition-delay: 0s;
		  -moz-transition-delay: 0s;
		  transition-delay: 0s;
		  background: #d83a2b;
		}
		
		
		</style>
		
		<script type="text/javascript">
		 	$(function() {
		        
		        $( ".menu-butt" ).on("click" , function() {
		        	history.go(-1);
		         });
		    }); 
//===============메뉴얼==========
			$(function() {
				var masterNick = "${crewList['0'].crewNickName}";
				var condition = "";
				if(masterNick=='${sessionScope.me.nickName}'){
					condition = "MST";
				}else{
					condition = "MEM";
				}
				var thisRole = "${ crewList['0'].crewNickName==sessionScope.me.nickName ? '모임장님' : '' }";
				//console.log(masterNick);
				//console.log(condition);
				///신고하기 
				  	$( "a[href='#' ]:contains('신고')" ).on("click" , function() {
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
							self.location = "/complain/addComplain?meetingNo=${meeting.meetingNo}"
						}
					 
					});
				  //=============수정 시 모임장인지 확인==================================//
					$("a[href='#' ]:contains('수정')").click(function () {
						//$("#update-dialog").click(function () {
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
								$.ajax({
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
										console.log(JSONData);
										
										if(JSONData=='MST'){
											$("#dialog,#backround").toggle();
										}else {
											swal("모임장만 가능합니다.");
										}
									
									}
							});
								
								
							}
					});
					//=================삭제 시 모임장인지 확인==================================//		
					$("a[href='#' ]:contains('삭제')").click(function () {
						
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
											console.log(JSONData);
										
											if(JSONData=='MST'){
												swal({
													  title: "삭제하시겠습니까?",
													  icon: "info",
													  buttons: true,
													  dangerMode: true,
													})
													.then(function(value){
													 console.log(value);
													  if (value==true) {
														  $("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
													  } else {
														  return;
													  }
													});
											}else {
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
													swal("모임장만 가능합니다.");
												}
												
											}
											
										}
								}); 
					});
					
////////////////////* 탈퇴하기 눌렀을때 이벤트 처리부분 *////////////////////////////////////////
					$("a[href='#' ]:contains('탈퇴')").click(function () {
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
						}else if('${sessionScop.me.nickName==masterNick}'=='${crewCount==1}'){
							if (confirm("모집된 모임원이 없으시네요.\n모임을삭제하시겠습니까?") == true){    //확인
								$("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
							 }else{   //취소
							     return;
							 }	
						}else{
							$.ajax( 
									{
										url : "/meetingRest/dropMeeting",
										method : "post" ,
										dataType : "json" ,
										data : JSON.stringify({
											meetingNo : "${meeting.meetingNo}" ,
											meetingMasterId : "${sessionScope.me.userId}",
											meetingActCount : "${meetingAct.meetingActCount}",
											meetingCondition : condition,  /* 모임장인지 아닌지 전달 */
												
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											if(JSONData==5018){
												swal({title:"모임원이 아니십니다.",icon:"error"});
											}else{
												swal({title:"'"+thisRole+"'  "+" ${meeting.meetingName} 에서 \n탈퇴 하시겠습니까?",icon:"info",buttons:{cancel:"취소",confirm:"확인",},})
												.then(function(value){
													if(value==true){
														$.ajax( 
																{
																	url : "/meetingRest/dropMeeting",
																	method : "post" ,
																	dataType : "json" ,
																	data : JSON.stringify({
																		meetingNo : "${meeting.meetingNo}" ,
																		meetingMasterId : "${sessionScope.me.userId}",
																		meetingActCount : "${meetingAct.meetingActCount}",
																		meetingCondition : condition,  /* 모임장인지 아닌지 전달 */
																	}),
																	headers : {
																		"Accept" : "application/json",
																		"Content-Type" : "application/json"
																	},
																	success : function(JSONData , status) {
																		swal({title:"${meeting.meetingName} 에서 \n탈퇴하였습니다.",icon:"success"})	
																	}//success 끝
															});
														
														
													}else{
														return;
													}
												});
												
											}//if 문 끝
												
										}//success 끝
								});
							
					
							
							
						}
					});
					
			///////////* 가입하기에서 확인누르면 이벤트 처리 *//////////////
					 $( "#joinSubmit" ).on("click" , function() {
						 //alert("히얼??");
						 var interviewTitle = $("#interviewTitle").val();
						 var interview = $("#interview").val();
						 
						 if(interviewTitle == null || interviewTitle.length<1){
							swal("제목을 입력해주세요.");
							return;
						 }
						 if(interview == null || interview.length<1){
						 	swal("내용을 입력해주세요.");
							return;
						 }
						 
						
						  $.ajax( 
									{
										url : "/meetingRest/addCrewM",
										method : "post" ,
										dataType : "json" ,
										data : JSON.stringify({
											meetingNo : "${meeting.meetingNo}" ,
											meetingMasterId : "${sessionScope.me.userId}", 
											interviewTitle : $("#interviewTitle").val(),
											interview : $("#interview").val()
											
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											if(JSONData==5018){
												swal({title:"이미 가입하셨습니다.",icon:"error"});
												$("#dialog2form")[0].reset();
												$("#dialog2, #backround").toggle();
											}else{
												swal({title:"가입 신청이 완료되었습니다.\n 모임장의 승인후 가입됩니다.",icon:"success"});
												//window.opener.location.reload(false);
												$("#dialog2form")[0].reset();
												$("#dialog2, #backround").toggle();
											}
										}
						});
						
					});
			
				 $( "#pushCancle2" ).on("click" , function() {
					 //alert("취소");
					 $("#dialog2, #backround").toggle();
				 });

			

			});
				  
///////////////////////////* 가입하기 눌렀을때 로그인 확인 이벤트 처리  *////////////////
			 $( function() {
					$("button:contains('가입하기'), a[href='#' ]:contains('가입')").click(function () {
						if('${empty sessionScope.me}'=='true'){
							swal({
								  title: "로그인후이용가능합니다.\n로그인하시겠습니까?",
								  icon: "info",
								  buttons: true,
								  dangerMode: true,
								})
								.then((willDelete) =>{
								  if (willDelete) {
									  $("#my-dialog,#dialog-background").toggle();
								  } else {
								    	return;
								  }
								});
						}else{
							$("#dialog2, #backround").toggle();
						}
					});
				});

		</script>

</head>


<body>
		<div id="followingbtn">
			<div class="menu-butt"><i class="glyphicon glyphicon-chevron-left"></i>
			</div>
			
			<div class="menu-button"><i class="zmdi zmdi-share"></i>
				<a href="#">수정</a>
				<a href="#">삭제</a>
				<a href="#">신고</a>
				<a href="#">탈퇴</a>
				<a href="#">가입</a>
				<c:if test="${meeting.snooze}=='Y'">
				<a href="#">승계</a>
				</c:if>
			</div>	
			
			
		</div>
</body>
</html>