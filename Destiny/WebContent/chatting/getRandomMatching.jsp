<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
	
	<!-- Bootstrap core CSS -->
    
    <link href="carousel.css" rel="stylesheet">
    
   <!-- �ɷ��� �Ϸ� -->
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
						console.log('ä�� �ߴ� ���');
					}else{
						popWin = window.open("/chatting/telepathyTest/"+JsonData.roomNo,"popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
						
					}
					return false;
				}else{
					console.log('roomNo�� 0�� ���');
				}
	        },
	        //timeout: 3000,
	        complete: setTimeout(function() { 
	        	if (n<5) {
	        	poll();
				}else{
					  var confirmflag = confirm("������ ã�� �� �����ϴ�. �����ðڽ��ϱ�?");

			           if(confirmflag){

			              //Ȯ�� ��ư Ŭ�� true 
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

			             //��� ��ư Ŭ�� false
			             setTimeout(function() { 
			            	 if (n2<10000) {
			            		 poll();
							}else{
								alert("������ ã�� �� �����ϴ�. ������ �ٽ� �̿����ּ���!");

							}
			            	 
			            	 console.log(n2); n2+3000; }, n2)
			        	   
			           }
			
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

/* #load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
} */
</style>
</head>

<body>
  

			  
	<div id="load" >
		<img src="/resources/images/chatting/loading.gif" alt="loading">
		<br> <h1>loading...</h1>
	</div>


   
</body>
</html>