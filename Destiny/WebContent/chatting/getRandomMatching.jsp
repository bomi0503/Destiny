<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
<style>
#load {
	width: 100%;
	height: 100%;
	top: 30%;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
}

/* sweetalert buttom design^^ */
	.swal-button{
		padding : 0 56px;
		color : rgba(0,0,0,.65) !important;
	}
</style>
	

	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	var userId="${me.userId}";
	var userType="${me.myType}";
	var firstType="${me.firstType}";
	var secondType="${me.secondType}";
	var thirdType="${me.thirdType}";
	var manCount=0;
	var womanCount=0;
	var n=0;
	var n2=3000;
	var chattingNo='${chatting.chattingNo}';
	(function poll() {
	    $.ajax({
	        url: '/chatting/json/getRandomMatching',
	        type: 'GET',
	        dataType: 'json',
	        success: function(JsonData) {
	            console.log('success');
	          
				if (JsonData.roomNo!=0) {
					
					if (JsonData.roomNo==chattingNo&&chattingNo!=0) {
						console.log('채팅 했던 사람');
					}else{
						popWin = window.open("/chatting/telepathyTest/"+JsonData.roomNo,"popWin", "width=500, height=800, scrollbars=1");
						
					}
					return false;
				}else{
					console.log('roomNo가 0인 사람');
				}
	        },
	        //timeout: 3000,
	        complete: setTimeout(function() { 
	        	if (n<5) {
	        	poll();
				}else{
					swal({
						  title: "상대방을 찾을 수 없습니다.",
						  text: " 나가시겠습니까?",
						  icon: "warning",
						  buttons: true,
						  dangerMode: false,
						})
						.then(function(willDelete)  {
						  if (willDelete) {
							//확인 버튼 클릭 true 
				        	   window.close();
				        	   $.ajax({
			        		        url: '/chatting/json/endRandomMatching',
			        		        type: 'GET',
			        		        dataType: 'text',
			        		        success: function(JsonData) {
			        		            console.log('success');
			        		          //alert(JsonData);
			        					
			        		        }
			        				
			        		    });
						  } else {
							//취소 버튼 클릭 false
					             setTimeout(function() { 
					            	 if (n2<10000) {
					            		 poll();
									}else{
										swal("상대방을 찾을 수 없습니다. 다음에 다시 이용해주세요!");

									}
					            	 
					            	 console.log(n2); n2+3000; }, 10000)
						  }
						});
					//==========================================================
						/* 
					  var confirmflag = confirm("상대방을 찾을 수 없습니다. 나가시겠습니까?");

			           if(confirmflag){

			              //확인 버튼 클릭 true 
			        	   window.close();
			        	 
			        			$.ajax({
			        		        url: '/chatting/json/endRandomMatching',
			        		        type: 'GET',
			        		        dataType: 'text',
			        		        success: function(JsonData) {
			        		            console.log('success');
			        		          //alert(JsonData);
			        					
			        		        }
			        				
			        		    });
			        			
			        		
			        		 
			           }else{

			             //취소 버튼 클릭 false
			             setTimeout(function() { 
			            	 if (n2<10000) {
			            		 poll();
							}else{
								alert("상대방을 찾을 수 없습니다. 다음에 다시 이용해주세요!");

							}
			            	 
			            	 console.log(n2); n2+3000; }, n2) 
			           } */
			            	 //======================================================  
			           
			
				}console.log(n); n++; }, 3000)
			
	    })
	})();
	
	 
	window.addEventListener('beforeunload', function (e) {
		$.ajax({
	        url: '/chatting/json/endRandomMatching',
	        type: 'GET',
	        dataType: 'text',
	        success: function(JsonData) {
	            console.log('success');
	          //alert(JsonData);
				
	        }
			
	    });
		
	});
	
	</script>
<title>matching</title>

</head>

<body>
  

			  
	<div id="load" >
		<img src="/resources/images/chatting/loading.gif" alt="loading">
		<br> <h1>loading...</h1>
	</div>


   
</body>
</html>