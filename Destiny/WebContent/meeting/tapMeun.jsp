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
		  /* height:10%;  */  /* ���޴�, ��� �̹����� ���� */
		 /*  width:10%;  */   /* ���޴�, ��� �̹����� �ʺ�*/
		 bottom :100px;
		 right : 15px;
		 /*
		 margin:0px 0px 10% 88%; */  /* ���� �������� ��ġ�� ȭ�� ������� �󸶸�ŭ ���������� ���̾ ���� ������ ����  */ 
			
		 /*  top: 10%;  */ /* ��� ��ܿ��� �󸶳� ����߸��� ����*/
		  text-align: left;
		  background: #fff0;
		}
	</style> 
	<style> /* ���ϸ� ������ �޴� */
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
//===============�޴���==========
			$(function() {
				var masterNick = "${crewList['0'].crewNickName}";
				var condition = "";
				if(masterNick=='${sessionScope.me.nickName}'){
					condition = "MST";
				}else{
					condition = "MEM";
				}
				var thisRole = "${ crewList['0'].crewNickName==sessionScope.me.nickName ? '�������' : '' }";
				//console.log(masterNick);
				//console.log(condition);
				///�Ű��ϱ� 
				  	$( "a[href='#' ]:contains('�Ű�')" ).on("click" , function() {
				  		if('${empty sessionScope.me}'=='true'){
							
							swal({
								  title: "�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?",
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
				  //=============���� �� ���������� Ȯ��==================================//
					$("a[href='#' ]:contains('����')").click(function () {
						//$("#update-dialog").click(function () {
							if('${empty sessionScope.me}'=='true'){
							
							swal({
								  title: "�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?",
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
											swal("�����常 �����մϴ�.");
										}
									
									}
							});
								
								
							}
					});
					//=================���� �� ���������� Ȯ��==================================//		
					$("a[href='#' ]:contains('����')").click(function () {
						
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
													  title: "�����Ͻðڽ��ϱ�?",
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
														  title: "�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?",
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
													swal("�����常 �����մϴ�.");
												}
												
											}
											
										}
								}); 
					});
					
////////////////////* Ż���ϱ� �������� �̺�Ʈ ó���κ� *////////////////////////////////////////
					$("a[href='#' ]:contains('Ż��')").click(function () {
						if('${empty sessionScope.me}'=='true'){
							swal({
								  title: "�α������̿밡���մϴ�.�α����Ͻðڽ��ϱ�?",
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
							if (confirm("������ ���ӿ��� �����ó׿�.\n�����������Ͻðڽ��ϱ�?") == true){    //Ȯ��
								$("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
							 }else{   //���
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
											meetingCondition : condition,  /* ���������� �ƴ��� ���� */
												
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											if(JSONData==5018){
												swal({title:"���ӿ��� �ƴϽʴϴ�.",icon:"error"});
											}else{
												swal({title:"'"+thisRole+"'  "+" ${meeting.meetingName} ���� \nŻ�� �Ͻðڽ��ϱ�?",icon:"info",buttons:{cancel:"���",confirm:"Ȯ��",},})
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
																		meetingCondition : condition,  /* ���������� �ƴ��� ���� */
																	}),
																	headers : {
																		"Accept" : "application/json",
																		"Content-Type" : "application/json"
																	},
																	success : function(JSONData , status) {
																		swal({title:"${meeting.meetingName} ���� \nŻ���Ͽ����ϴ�.",icon:"success"})	
																	}//success ��
															});
														
														
													}else{
														return;
													}
												});
												
											}//if �� ��
												
										}//success ��
								});
							
					
							
							
						}
					});
					
			///////////* �����ϱ⿡�� Ȯ�δ����� �̺�Ʈ ó�� *//////////////
					 $( "#joinSubmit" ).on("click" , function() {
						 //alert("����??");
						 var interviewTitle = $("#interviewTitle").val();
						 var interview = $("#interview").val();
						 
						 if(interviewTitle == null || interviewTitle.length<1){
							swal("������ �Է����ּ���.");
							return;
						 }
						 if(interview == null || interview.length<1){
						 	swal("������ �Է����ּ���.");
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
												swal({title:"�̹� �����ϼ̽��ϴ�.",icon:"error"});
												$("#dialog2form")[0].reset();
												$("#dialog2, #backround").toggle();
											}else{
												swal({title:"���� ��û�� �Ϸ�Ǿ����ϴ�.\n �������� ������ ���Ե˴ϴ�.",icon:"success"});
												//window.opener.location.reload(false);
												$("#dialog2form")[0].reset();
												$("#dialog2, #backround").toggle();
											}
										}
						});
						
					});
			
				 $( "#pushCancle2" ).on("click" , function() {
					 //alert("���");
					 $("#dialog2, #backround").toggle();
				 });

			

			});
				  
///////////////////////////* �����ϱ� �������� �α��� Ȯ�� �̺�Ʈ ó��  *////////////////
			 $( function() {
					$("button:contains('�����ϱ�'), a[href='#' ]:contains('����')").click(function () {
						if('${empty sessionScope.me}'=='true'){
							swal({
								  title: "�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?",
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
				<a href="#">����</a>
				<a href="#">����</a>
				<a href="#">�Ű�</a>
				<a href="#">Ż��</a>
				<a href="#">����</a>
				<c:if test="${meeting.snooze}=='Y'">
				<a href="#">�°�</a>
				</c:if>
			</div>	
			
			
		</div>
</body>
</html>