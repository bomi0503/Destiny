<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html><html>
<head>
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
 <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="/resources/css/main.css" > 
   
   
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!-- ///// -->
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<!-- <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
 --><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>

<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<!-- ///// -->
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src="http://192.168.0.35:82/socket.io/socket.io.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script >



//새로고침 방지====================================================================
function noEvent() { // 새로 고침 방지
           if (event.keyCode == 116) {
               //alert("새로고침을 할 수 없습니다.");
               swal("새로고침을 할 수 없습니다.", "", "warning");
               event.keyCode = 2;
               return false;
           } else if (event.ctrlKey
                   && (event.keyCode == 78 || event.keyCode == 82)) {
               return false;
           }
       }
   document.onkeydown = noEvent;


//==============================================================================



var socket = io.connect('http://192.168.0.35:82');
var timeout;
var userId="${me.userId}";
var wNickName="";
var mNickName="";
var chattingNo='${chatting.chattingNo}';
var manId="${chatting.manId}";
var womanId="${chatting.womanId}";
var chatting={"chattingNo":chattingNo,"manId":manId,"womanId":womanId};
var partnerType="";
var myType="";
var interest01="";
var interest02="";
var interest03="";
var otherGage=0;
var chatId="";
var telepathyList="${telepathyList}";
var profileOpen=false;
var profileImg="";
// on connection to server
socket.on('connect', function(){
	//이심전심 결과
	
	socket.emit('adduser', "${me.userId}");
	socket.emit('addroom',chatting);
	//이심전심 결과
	//상대방의 관심사를 가져오기
	if (womanId=="${me.userId}") {
		//여자일 경우===============================================================
			
		$.ajax({
	        url: '/chatting/json/getUserTypeInterest/'+manId,
	        type: 'GET',
	        dataType: 'json',
	        success: function(JsonData) {
	            console.log('woman');
	           // console.log(JsonData.user.myType);
	            console.log(JsonData.interest[0]);
	            console.log(JsonData.interest[1]);
	            console.log(JsonData.interest[2]);
	    		
	            //관심사==========================================================
	            //interest=[JsonData.interest[0],JsonData.interest[1],JsonData.interest[2]];
	            interest01=JsonData.interest[0];
	            interest02=JsonData.interest[1];
	            interest03=JsonData.interest[2];
	            myType=JsonData.type.myType;
	            partnerType=JsonData.type.firstType; 
	            $('#content01-you').append("<div><div><img src='/resources/images/chatting/mbti/"+JsonData.type.firstType+".png'  style='width: 100px; height: 100px;'></div><br><h1>"+JsonData.type.firstType+"</h1></div>");
	            $('#content01-me').append("<div><div><img src='/resources/images/chatting/mbti/"+JsonData.type.myType+".png' style='width: 100px; height: 100px;'></div><br><h1>"+JsonData.type.myType+"</h1></div>");
	            
	        }
			
	    });
		
		
		
			//$('#content01-me').append('<div><div><img src="/resources/images/telepathy/'+wOneImg+'" style="width: 50px; height: 50px;" ><img src="/resources/images/telepathy/'+wTwoImg+'" style="width: 50px; height: 50px;" ><img src="/resources/images/telepathy/'+wThreeImg+'" style="width: 50px; height: 50px;" ></div><br><div class="tel"><b>' + wResult01+'</b>&nbsp;&nbsp;<b>'+wResult02+'</b>&nbsp;&nbsp;<b>'+wResult03+'</b></div></div>');
			
    	//$('#content01-me').append('<div><img src="/resources/images/telepathy/'+wOneImg+'" style="width: 50px; height: 50px;" ><img src="/resources/images/telepathy/'+wTwoImg+'" style="width: 50px; height: 50px;" ><img src="/resources/images/telepathy/'+wThreeImg+'" style="width: 50px; height: 50px;" ></div><br>');
		
    	
	}else if(manId=="${me.userId}"){
		//남자일 경우==============================================================
			
		$.ajax({
	        url: '/chatting/json/getUserTypeInterest/'+womanId,
	        type: 'GET',
	        dataType: 'json',
	        success: function(JsonData) {
	           // console.log('success');
	            console.log('man');
	           // console.log(JsonData.user.myType);
	            console.log(JsonData.interest[0]);
	            console.log(JsonData.interest[1]);
	            console.log(JsonData.interest[2]);
	            
	            //interest=[JsonData.interest[0],JsonData.interest[1],JsonData.interest[2]];
	            interest01=JsonData.interest[0];
	            interest02=JsonData.interest[1];
	            interest03=JsonData.interest[2];
	            myType=JsonData.type.myType;
	            partnerType=JsonData.type.firstType;
	            $('#content01-you').append("<div><div><img src='/resources/images/chatting/mbti/"+JsonData.type.firstType+".png'  style='width: 100px; height: 100px;'></div><br><h1>"+JsonData.type.firstType+"</h1></div>");
	            $('#content01-me').append("<div><div><img src='/resources/images/chatting/mbti/"+JsonData.type.myType+".png' style='width: 100px; height: 100px;'></div><br><h1>"+JsonData.type.myType+"</h1></div>");
	            
				
	        }
			
	    });
			
		
   		
		
		
	}
	
	//이미지 파일 업로드=================================================================
	var imageFile="";
	var formData ="";
	var fileUpload="";
	
	 //이미지를 선택 했을 때 시작========================================================
	$("#img").change(function(e){
	
		formData = new FormData($("#form123")[0]);
		 fileUpload=$.ajax({
	        url: '/chatting/json/imageUpload',
	        type: 'POST',
	        //dataType: 'json',
	        data : formData,
	        processData : false,
         contentType : false,
	        success: function(JsonData) {
	           // console.log('success');
	        	
	        	while(true){
					var re = doesFileExist(JsonData);
					console.log("re : "+re)
					if(re){
						
						console.log("re들어옴");
						
						break;	
					}
				}//while 끝
	        }
			
	    }); 
		 
		 
		 function doesFileExist(urlToFile){
				var xhr = new XMLHttpRequest();
				xhr.open('HEAD', urlToFile, false);
				xhr.send();
				
				if (xhr.status == "404") {
					return false;
				} else {
					return true;
				}
			}
		//4초 뒤에 가져오기==========================================================
	    
	    fileUpload.done(function(Data) {
	    	  console.log('이미지 업로드 성공!');
	            console.log(Data);
	           setTimeout(function() {
	        	   var emitData={fileName:Data, userId:"${me.userId}"};
	              socket.emit('sendimgfile', emitData);
	          
	        	  
	        		console.log("내 파일 추가");
	        		if (!profileOpen) {
	        			$('<li class="replies"><img class="meProfile" src="/resources/images/chatting/loading.gif" alt="" /><p><img src="'+Data+'" style="width: 100px; height: 100px;" class="blur"></p></li>').appendTo($('.messages ul'));
							
	        		}else{
	        			$('<li class="replies"><img class="meProfile" src="/resources/images/userprofile/${me.profile}" alt="" /><p><img src="'+Data+'" style="width: 100px; height: 100px;" class="blur"></p></li>').appendTo($('.messages ul'));
						
	        		}
	        		//$('<li class="replies"><img class="meProfile" src="/resources/images/chatting/loading.gif" alt="" /><p><img src="'+Data+'" style="width: 100px; height: 100px;" class="blur"></p></li>').appendTo($('.messages ul'));
					
	        		$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
  
	        		//$('#user_1').append("<li><div class='me'><div><div class='name'>"+Data.userId+"</div><div class='img'></div><div class='text'><div><img src='/resources/images/chatting/image/"+Data.fileName+"' style='width: 100px; height: 100px;' class='blur'></div></div></div></div></li>");
	           }, 1000);
	            
		       
	       });
	

	   	
	    
	    
	  
	    });
	//오디오 파일 업로드==============================================================
	$("#voice").change(function(e){
	
		formData = new FormData($("#formVoice")[0]);
		 fileUpload=$.ajax({
	        url: '/chatting/json/voiceUpload',
	        type: 'POST',
	        //dataType: 'json',
	        data : formData,
	        processData : false,
         contentType : false,
	        success: function(JsonData) {
	           // console.log('success');
	        	while(true){
					var re = doesFileExist(JsonData);
					console.log("re : "+re)
					if(re){
						
						console.log("re들어옴");
						
						break;	
					}
				}//while 끝
	        	 
	        }
			
	    }); 
		 
		 function doesFileExist(urlToFile){
				var xhr = new XMLHttpRequest();
				xhr.open('HEAD', urlToFile, false);
				xhr.send();
				
				if (xhr.status == "404") {
					return false;
				} else {
					return true;
				}
			}
	    setTimeout(function() {
		    fileUpload.done(function(Data) {
	    	  	console.log('오디오 업로드 성공!');
	           // console.log(JsonData);
	           
	             var emitData={fileName:Data, userId:"${me.userId}"};
	              socket.emit('sendvoicefile', emitData);
	          
	       		console.log("내 파일 추가");
	       		if (!profileOpen) {
	       			$('<li class="replies"><img class="meProfile" src="/resources/images/chatting/loading.gif" alt="" /><p><audio controls ><source src="'+Data+'" ></audio></p></li>').appendTo($('.messages ul'));
						
	       		}else{
	       			$('<li class="replies"><img class="meProfile" src="/resources/images/userprofile/${me.profile}" alt="" /><p><audio controls ><source src="'+Data+'" ></audio></p></li>').appendTo($('.messages ul'));
					
	       		}
	       		
	       		$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);

	       		
	       		//$('#user_1').append("<li><div class='me'><div><div class='name'>"+Data.userId+"</div><div class='img'></div><div class='text'><div><audio controls class='col-xs-12 col-sm-12'><source src='/resources/images/chatting/image/"+Data.fileName+"' ></audio></div></div></div></div></li>");

	       	});
	

	    }, 1000);	
	    
	    
	  
	 });
	//파일 가져오기=================================================================
	
		socket.on('updateimgfile', function (file) {
	    	//console.log(file);
	    
			
				console.log("다른사람 파일 추가");
	    	if ("${me.userId}"!=file.userId) {
	    		if (!profileOpen) {
	    			$('<li class="sent"><img class="youProfile" src="/resources/images/chatting/loading.gif" alt="" /><b class="nickName"></b><br><p><img src="'+file.fileName+'" style="width: 100px; height: 100px;" class="blur"></p></li>').appendTo($('.messages ul'));
		    		
						
	       		}else{
	       			if (womanId==file.userId) {
	       				$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+wNickName+'</b><br><p><img src="'+file.fileName+'" style="width: 100px; height: 100px;" class="blur"></p></li>').appendTo($('.messages ul'));
			    		
					}else{
						$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+mNickName+'</b><br><p><img src="'+file.fileName+'" style="width: 100px; height: 100px;" class="blur"></p></li>').appendTo($('.messages ul'));
			    		
					}
	       			
	       		}
	    		$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);

				//$('#user_1').append("<li><div class='you'><div><div class='name'>"+file.userId+"</div><div class='img'></div><div class='text'><div><img src='/resources/images/chatting/image/"+file.fileName+"' style='width: 100px; height: 100px;' class='blur'></div></div></div></div></li>");
		
			}  
	    });//updateimgfile 끝
	
		socket.on('updatevoicefile', function (file) {
	    	console.log(file);
	    	
			
				console.log("다른사람 파일 추가");
	    	if ("${me.userId}"!=file.userId&&file.fileName!=null) {
	    		if (!profileOpen) {
	    			$('<li class="sent"><img class="youProfile" src="/resources/images/chatting/loading.gif" alt="" /><b class="nickName"></b><br><p><audio controls ><source src="'+file.fileName+'"  ></audio></p></li>').appendTo($('.messages ul'));
					
						
	       		}else{
	       			if (womanId==file.userId) {
	       				$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+wNickName+'</b><br><p><audio controls ><source src="'+file.fileName+'"  ></audio></p></li>').appendTo($('.messages ul'));
						
	       			}else{
	       				$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+mNickName+'</b><br><p><audio controls ><source src="'+file.fileName+'"  ></audio></p></li>').appendTo($('.messages ul'));
						
	       			}
	       			
	       		}
				
				$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);

	    		//$('#user_1').append("<li><div class='you'><div><div class='name'>"+file.userId+"</div><div class='img'></div><div class='text'><div><audio controls class='col-xs-12 col-sm-12'><source src='/resources/images/chatting/image/"+file.fileName+"'  ></audio></div></div></div></div></li>");
				
			}  
	    });//updatevoicefile 끝
	//==========================================================================


	
});//connect 끝

socket.on('updatechat', function (username, data1) {
	//내가 보낸 메세지가 아니라면 번역 시작=================================================
	if (username!='${me.userId}') {
		//번역
		var lang=$('select').val();
		var data2={"message":data1,"lang":lang};
		var transText='';
		
	  
		//alert(message);
		//alert(lang);
		if (username!="SERVER") {
			
			
			var message=data1;
			//alert(message);
			var trans=$.ajax({	
				
				url : "/chatting/json/translate" ,
				type : "POST" ,
				dataType : "text" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(data2),
				success : function(Data) {
										},//success
			      error: function () {
			    	  //alert("error");
			      },
			      complete: function () {			        
			        //alert("complete");
			      }
				
			});//ajax 끝
			//return false;
			trans.done(function(Data) {
			//번역끝
				
				//alert("다른 사람 message");
				if (!profileOpen) {
					//번역언어가 없을 경우
					if (lang=="") {
						$('<li class="sent"><img class="youProfile" src="/resources/images/chatting/loading.gif" alt="" /><b class="nickName"></b><br><p>' + data1 + '</p></li>').appendTo($('.messages ul'));
						//$('.message-input input').val(null);
						$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
						//$('#user_1').append("<li><div class='you'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"</div></div></div></div></li>");
					//번역언어가 있을 경우
					}else{
						$('<li class="sent"><img class="youProfile" src="/resources/images/chatting/loading.gif" alt="" /><b class="nickName"></b><br><p>' + data1 + '<br>'+Data+'</p></li>').appendTo($('.messages ul'));
						//$('.message-input input').val(null);
						$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
						//$('#user_1').append("<li><div class='you'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"<br>"+Data+"</div></div></div></div></li>");	
					}
				}else{
					//alert("90이상 프로필 공개 채팅중");
					if (lang=="") {
						if (username==womanId) {
							$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+wNickName+'</b><br><p>' + data1 + '</p></li>').appendTo($('.messages ul'));
							
						}else{
							$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+mNickName+'</b><br><p>' + data1 + '</p></li>').appendTo($('.messages ul'));
							
						}
						//$('.message-input input').val(null);
						$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
						//$('#user_1').append("<li><div class='you'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"</div></div></div></div></li>");
					//번역언어가 있을 경우
					}else{
						if (username==womanId) {
							$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+wNickName+'</b><br><p>' + data1 + '<br>'+Data+'</p></li>').appendTo($('.messages ul'));
								
						}else{
							$('<li class="sent"><img class="youProfile" src="/resources/images/userprofile/'+profileImg+'" alt="" /><b class="nickName">'+mNickName+'</b><br><p>' + data1 + '<br>'+Data+'</p></li>').appendTo($('.messages ul'));
							
						}
						//$('.message-input input').val(null);
						$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
						//$('#user_1').append("<li><div class='you'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"<br>"+Data+"</div></div></div></div></li>");	
					}
				}
				
				


			})
		}else{
			//alert("server message");
			
			$("<li><div class='title text-center'><div>"+username+"<div>"+data1+"</div></div></div></li>").appendTo($('.messages ul'));
			$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);

		}
		 
		
		
		
	
		
//ajax끝========================================================================
		
		
		
	}else{
		//alert("내 message");
		var height=$(document).height();
		if (!profileOpen) {
			
			$('<li class="replies"><img class="meProfile" src="/resources/images/chatting/loading.gif" alt="" /><p>' + data1 + '</p></li>').appendTo($('.messages ul'));
			$('.message-input input').val(null);
			$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
			
			//$(".messages").animate({ scrollTop: $(document).height() }, "fast");
			//$(".messages").scrollTop($(".messages ul").height()) ;	
			height=$(document).height()+$(".replies").height();
		}else{
			$('<li class="replies"><img class="meProfile" src="/resources/images/userprofile/${me.profile}" alt="" /><p>' + data1 + '</p></li>').appendTo($('.messages ul'));
			$('.message-input input').val(null);
			$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
			//$('#chat_box').animate({scrollTop: $('#chat_box').prop("scrollHeight")}, 500);   
			//$(".messages").scrollTop($(".messages ul").height()) ;	
			//height=$(document).height()+$(".replies").height();
		}
		//$('#user_1').append("<li><div class='me'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"</div></div></div></div></li>");

	}
	
	//스크롤 유지
	//$('.chat-box').scrollTop($('.chat-box').height());

	
	
});

//상대방이 채팅종료시 10초뒤 자동으로 나감===================================================
socket.on('updatechatend', function (username, data1) {
	//상대방이 나갔음을 알림
	$("<li><div class='title text-center'><div>"+username+"<div>"+data1+"</div></div></div></li>").appendTo($('.messages ul'));
	$("<h2 class='text-center'></h2>").appendTo($('.messages ul'));
	$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);
		
	//$('#user_1').append("<li><div class='title'><div>"+username+"<div>"+data1+"</div></div></div></li>");
	var n=1;
	//10초뒤 종료
	setTimeout(function() { 
		swal("채팅을 종료합니다!", "", "info")
		.then(function(value) {
			self.close();
		});
   		//alert("채팅을 종료합니다!");
   		 }, 10000);
	//10초동안 count
	(function poll() {
		setTimeout(function() { 
			if (n<11) {
				
				poll();
				
				$('h2').text(11-n);
	            
			}
			
	   		 n++; }, 1000);
		
	})();
});
//==============================================================================
// listener, whenever the server emits 'updaterooms', this updates the room the client is in
/* socket.on('updaterooms', function(rooms, current_room) {
	$('#rooms').empty();
	
		
	
	
}); */
// 프로필공개==============================================================================
function getProfile(){
	
	profileOpen=true;
	if (ti>=90) {
		
		if ("${me.userId}"==womanId) {
			
			$.ajax({
		        url: '/user/json/getUser/'+manId,
		        type: 'GET',
		        dataType: 'json',
		        success: function(JsonData) {
		       swal("상대방의 프로필이 공개되었습니다!", "닉네임과 프로필 사진을 확인해 보세요!", "success");
		       //alert("상대방의 프로필이 공개되었습니다!");
		       console.log(JsonData);
		       // JsonData.profile
		         // JsonData.userId
		          profileImg=JsonData.user.profile;
		           $(".youProfile").attr("src","/resources/images/userprofile/"+JsonData.user.profile);
		           $(".nickName").text(JsonData.user.nickName);
			       $(".meProfile").attr("src","/resources/images/userprofile/${me.profile}");
		          //$(".replies").attr("text",JsonData.user.userId); 
			        wNickName="${me.nickName}";
					mNickName=JsonData.user.nickName;
		        }
				
		    });	//ajax끝
		}else{
			$.ajax({
		        url: '/user/json/getUser/'+womanId,
		        type: 'GET',
		        dataType: 'json',
		        success: function(JsonData) {
		        	swal("상대방의 프로필이 공개되었습니다!", "닉네임과 프로필 사진을 확인해 보세요!", "success");
				       
		        	//alert("상대방의 프로필이 공개되었습니다!");
		        	//프로필 사진과 아이디 공개 
		        	console.log(JsonData);
		        	profileImg=JsonData.user.profile;
		        	 JsonData.user.profile
			          JsonData.user.userId
			          $(".youProfile").attr("src","/resources/images/userprofile/"+JsonData.user.profile);
		        	 $(".nickName").text(JsonData.user.nickName);
		        	 $(".meProfile").attr("src","/resources/images/userprofile/${me.profile}");
			         // $(".replies").attr("text",JsonData.user.userId);
		        	mNickName="${me.nickName}";
					wNickName=JsonData.user.nickName;
		        }
				
		    });//ajax끝
		}
		
	}
}

//서버로 gage보내기=================================================================
var myGage=0;
socket.on('updategage', function (username, data) {
	   if (username=="${me.userId}") {
		   myGage=ti;
		   
	}else{
		otherGage=data;
	}
	   console.log("1 상대방 gage : "+otherGage+" 나의 gage : "+myGage)
		
	   if (60>otherGage&&otherGage>=30&&60>myGage&&myGage>=30) {
		   swal("호감도 30% 달성!", "이제 오디오 파일을 전송 할 수 있습니다.", "info");
	       
		   //alert("호감도 30% 달성!");
			$("#voiceClick").attr("src","/resources/images/chatting/voice02.png").attr("onClick","document.all.voiceFile.click(); document.all.file1.value=document.all.voiceFile.value");
			
			console.log("1 상대방 gage : "+otherGage+" 나의 gage : "+myGage)
		}else if (90>otherGage&&otherGage>=60&&90>myGage&&myGage>=60) {
			
			swal("호감도 60% 달성!", "이제 이미지 파일을 전송 할 수 있습니다.\n※이미지는 블러처리 됩니다.", "info");
			//alert("호감도 60% 달성!");
			$("#imgClick").attr("src","/resources/images/chatting/image02.png").attr("onClick","document.all.imgFile.click(); document.all.file2.value=document.all.imgFile.value");
			console.log("2 상대방 gage : "+otherGage+" 나의 gage : "+myGage)
		}else if (otherGage>=90&&myGage>=90) {
			//alert("호감도 90% 달성!");
			 var confirmflag01="";
			 var confirmflagyou="";
			 //둘다 만남을 선택해야만 진행됨
			 
			 //====================================================================
				 
			 if (womanId=="${me.userId}") {
				 //confirmflag01 = confirm("호감도 90% 달성! 상대방과 만나시겠습니까?");
				 swal({
					  title: "호감도 90% 달성!",
					  text: "상대방과 만나시겠습니까?",
					  icon: "info",
					  buttons: true,
					  dangerMode: false,
					})
					.then(function(willDelete)  {
						confirmflag01=willDelete;
						socket.emit('sendcontact', confirmflag01);
					  
					});
				 
				 
			}else{
				// confirmflagyou=confirm("호감도 90% 달성! 상대방과 만나시겠습니까?");
				swal({
					  title: "호감도 90% 달성!",
					  text: "상대방과 만나시겠습니까?",
					  icon: "info",
					  buttons: true,
					  dangerMode: false,
					})
					.then(function(willDelete)  {
						confirmflagyou=willDelete; 
						socket.emit('sendcontact', confirmflagyou);
					});
				
				
			}
			 
				 socket.on('updatecontact',function(username,data){
					 if (womanId==username) {
						 confirmflag01=data;
					}else{
						confirmflagyou=data;
					}
					 console.log("socket으로 온 데이터 : "+data);
					 console.log(confirmflag01);
					 console.log(confirmflagyou);
					 setTimeout(function() {
			           if(confirmflag01&&confirmflagyou){
			        	   
			        	   console.log(confirmflag01);
			        	   console.log(confirmflagyou);
			              //확인 버튼 클릭 true 프로필 오픈 , 만남성사 테이블 업데이트
		        		var contactMeeting=$.ajax({
								        url: '/chatting/json/updateContactMeeting',
								        type: 'GET',
								        dataType: 'text',
								        success: function(JsonData) {
								        	//프로필 사진과 아이디 공개 
								        	
								        	 
								        }
										
							    	});//ajax끝
						contactMeeting.done(function(Data) {
							console.log(Data);
							getProfile();
						});
							 
			           }else{

			            //프로필 버튼 활성화
			        	   $("#profile").attr("src","/resources/images/chatting/profile02.png");
			   			 
			           }
					 }, 8000);
					});
			
			 
			
			
	
			console.log("3 상대방 gage : "+otherGage+" 나의 gage : "+myGage)
		} 
	   
});
//10분동안 10%의 호감도를 넘기지 못했을 경우==================================================
setTimeout(function() { 
	//10%이하 이면서 10분이 지났을 때 : 10분 timeout 안에 내 gage가 10 이하인 경우 나갈지 여부 확인한다.
	  
	console.log(ti);//ti는 나의 gage
	if (ti<10) {
		swal({
			  title: "10분동안 호감도가 10%를 넘지 못했습니다.",
			  text: "나가시겠습니까?",
			  icon: "info",
			  buttons: true,
			  dangerMode: false,
			})
			.then(function(willDelete)  {
			  if (willDelete) {
				  self.close();
			  } else {
			   
			  }
			});
		//==========================================================================
		 /* var confirmflag02 = confirm("10분동안 호감도가 10%를 넘지 못했습니다. 나가시겠습니까?");

         if(confirmflag02){

            //확인 버튼 클릭 true 나감
      	 	self.close();
      		 
         }else{

          //취소
      	    
         } */
       //==========================================================================
	}else{
		//10%이상일 경우
	}
	 //600000(10분)
	}, 600000);
//==============================================================================


// on load of page
$(function(){
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// when the client clicks SEND
	//==========================================================================

$(".messages").animate({ scrollTop: $(".messages").prop("scrollHeight") }, 500);





function newMessage() {
	message = $(".message-input input").val();
	
	
	if (message==""||message==null) {
		//return false;
	}else{
		socket.emit('sendchat', message);
		
	}
	
	
	
};

$('.submit').click(function() {
  newMessage();
  
});

$('input').keypress(function(e) {
	if(e.which == 13) {
		//$(this).blur();
		newMessage();
		
	}
});

});
$(function(){
	// when the client hits ENTER on their keyboard
	//질문===========================================================================
		
	
	function question() {
		var question = $("input[name='questionButton']").val();
		
		//alert(question);
		
		$.ajax({
			
			//url : "http://api.adams.ai/datamixiApi/deepqa?key=3758962826504551960&answerType=0&question="+question,
			url : "/user/json/getAnswer/"+question,
			method : "GET",
			datatype : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status){
				//alert(JSONData.answer.return_object.answer);
				$('#content03result').remove();
				
				$('#content03-result').append('<div id="content03result">'+JSONData.answer.return_object.answer+'</div>');
    	
				//$('#answerWirte').text(JSONData.answer.return_object.answer);
			}
			
		});
	}
	$('#question').keypress(function(e) {
		if(e.which == 13) {
			//$(this).blur();
			question();
			
			}
	});
	$("a[id='questionButton']").on("click", function(){
			
	question();
	});
	$('h1:contains("무엇이든 물어보세요!")').click(function () {
		$('#question').val(null);
		$('#content03result').remove();
	});
	//관심사=====================================================================
	$('h1:contains("관심사")').click(function () {
		$('.interest').remove();
		var interest01split=interest01.split('/')[0];
		var interest02split=interest02.split('/')[0];
		var interest03split=interest03.split('/')[0];
		$('#content02').append('<div class="text-center interest"><img src="/resources/images/interest/'+interest01split+'.png"><h1>' +interest01+'</h1><br><img src="/resources/images/interest/'+interest02split+'.png"><h1>'+interest02+'</h1><br><img src="/resources/images/interest/'+interest03split+'.png"><h1>'+interest03+'</h1></div>');
		})
	
	//프로필 공개===================================================================
	
	$('#profile').click( function(e) {
		
		getProfile();
	});
});//function의 끝



//게이지=========================================================================
var ti = 0;
	$(function() {
	    var input = $('.input'),
	        bar = $('.bar'),
	        bw =
	        bar.width(),
	        percent = bar.find('.percent'),
	        circle =
	        bar.find('.circle'),
	        ps = percent.find('span'),
	        cs =
	        circle.find('span'),
	        name = 'rotate';
	    	
	    	
	   $('.input').on("click", function(e) {
		   
	    	console.log(ti);
	    	
	        if (true) {
	        	
	        	ti=ti+5; 
	        	
	        	socket.emit('sendgage', ti);
	            var val = ti;
	            console.log("안쪽"+ti);
	            if (val >= 0 && val <=
	                100) {
	                var w = 100 - val,
	                    pw = (bw * w) / 100,
	                    pa = {
	                        width: w + '%'
	                    },
	                    cw =
	                    (bw - pw) / 1.3,
	                    ca = {
	                        left: cw
	                    }
	                ps.animate(pa);
	                cs.text(val + '%');
	                circle.animate(ca, function() {
	                    circle.removeClass(name)
	                }).addClass(name);
	            } else {
	            	swal("호감도 100%!", "더이상 호감도가 올라가지 않습니다.", "warning");
	            	//alert('range: 0 - 100');
	                ti.val('');
	            }
	        }
	    });
	  
	});
//채팅방 나감=======================================================================
window.addEventListener('beforeunload', function (e) {
		$.ajax({
	        url: '/chatting/json/endPerfectChatting',
	        type: 'GET',
	        dataType: 'text',
	        success: function(JsonData) {
	            console.log('success');
	          //alert(JsonData);
				
	        }
			
	    });
		
	});
//==============================================================================
//modal=========================================================================
$(function(){
    dragElement(document.getElementById("mydiv"));
    function dragElement(elmnt) {
var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
if (document.getElementById(elmnt.id + "header")) {
/* if present, the header is where you move the DIV from:*/
document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
} else {
/* otherwise, move the DIV from anywhere inside the DIV:*/
elmnt.onmousedown = dragMouseDown;
}

function dragMouseDown(e) {
e = e || window.event;
e.preventDefault();
// get the mouse cursor position at startup:
pos3 = e.clientX;
pos4 = e.clientY;
document.onmouseup = closeDragElement;
// call a function whenever the cursor moves:
document.onmousemove = elementDrag;
}

function elementDrag(e) {
e = e || window.event;
e.preventDefault();
// calculate the new cursor position:
pos1 = pos3 - e.clientX;
pos2 = pos4 - e.clientY;
pos3 = e.clientX;
pos4 = e.clientY;
// set the element's new position:
elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
}

function closeDragElement() {
/* stop moving when mouse button is released:*/
document.onmouseup = null;
document.onmousemove = null;
}
}
 })
 
//modal end=========================================================================

	//arccordion start=====================================================================
$(function() {
	var Accordion = function(el, multiple) {
			this.el = el || {};
			this.multiple = multiple || false;

			var links = this.el.find('.article-title');
			links.on('click', {
					el: this.el,
					multiple: this.multiple
			}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
			var $el = e.data.el;
			$this = $(this),
					$next = $this.next();

			$next.slideToggle();
			$this.parent().toggleClass('open');

			if (!e.data.multiple) {
					$el.find('.accordion-content').not($next).slideUp().parent().removeClass('open');
			};
	}
	var accordion = new Accordion($('.accordion-container'), false);
	
	$('#question').click(function() {
		$('#question').focus();
	})
});

//arccordion end======================================================================= 

	</script>

<!-- All CSS Insert -->

<!-- //All CSS Insert -->
   <!--  템플릿 사용하기 위해 필요한 js -->
   <script src="/resources/javascript/jquery.min.js"></script>
   <script src="/resources/javascript/skel.min.js"></script>
   <script src="/resources/javascript/util.js"></script>
   <script src="/resources/javascript/main.js"></script>
   
<style class="cp-pen-styles">
body {
  display: flex;
  align-items: center; 
  justify-content: center;
  min-height: 100vh;
 /*  background: #27ae60; */
  font-family: "proxima-nova", "Source Sans Pro", sans-serif;
  font-size: 1em;
  letter-spacing: 0.1px;
  color: #32465a;
  text-rendering: optimizeLegibility;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
  -webkit-font-smoothing: antialiased;
  overflow: auto;
      
}

body:after{
 background-image: url("https://i.pinimg.com/564x/50/79/22/5079229dd8060505843905136ff5b330.jpg?b=t"); 
  background-repeat: no-repeat;
   background-color: rgba(243, 190, 190, 0.5);
   
   background-size: cover;
    top:0;
    left:0;
    position:absolute;
    background-size:cover;
    opacity:0.5!important;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width:100%;
    height:100%;
}

#frame {
  width: 95%;
  min-width: 360px;
  max-width: 1000px;
  height: 92vh;
  min-height: 300px;
  max-height: 720px;
  background: rgba(50, 70, 90, 0.48);
  
}

@media screen and (max-width: 360px) {
  #frame {
    width: 100%;
    height: 100vh;
  }
}





#frame .content {
  /* float: right; */
  width: 100%;
  height: 100%;
  overflow: hidden;
  position: relative;
}
@media screen and (max-width: 735px) {
  #frame .content {
    width: calc(100% );
    min-width: 300px !important;
  }
}
@media screen and (min-width: 900px) {
  #frame .content {
    width: calc(100%);
  }
}
#frame .content .contact-profile {
  width: 100%;
  height: 60px;
  line-height: 60px;
  background: #f5f5f5;
}
#frame .content .contact-profile img {
  width: 40px;
  border-radius: 50%;
  float: left;
  margin: 9px 12px 0 9px;
}
/* #frame .content .contact-profile p {
  float: left;
} */
#frame .content .contact-profile .social-media {
  /* margin-top: 10px;
  float: right; */
}
#frame .content .contact-profile .social-media i {
  margin-left: 14px;
  cursor: pointer;
}
#frame .content .contact-profile .social-media i:nth-last-child(1) {
  margin-right: 20px;
}
#frame .content .contact-profile .social-media i:hover {
  color: #435f7a;
}
#frame .content .messages {
  height: auto;
  min-height: calc(100% - 93px);
  max-height: calc(100% - 93px);
  overflow-y: scroll;
  overflow-x: hidden;
}
@media screen and (max-width: 735px) {
  #frame .content .messages {
    max-height: calc(100% - 105px);
  }
}
#frame .content .messages::-webkit-scrollbar {
  width: 8px;
  background: transparent;
}
#frame .content .messages::-webkit-scrollbar-thumb {
  background-color: rgba(0, 0, 0, 0.3);
}
#frame .content .messages ul li {
  display: inline-block;
  clear: both;
  float: left;
  margin: 15px 15px 5px 15px;
  width: calc(100% - 25px);
  font-size: 0.9em;
}
#frame .content .messages ul li:nth-last-child(1) {
  margin-bottom: 20px;
}
#frame .content .messages ul li.sent img {
  margin: 6px 8px 0 0;
}
#frame .content .messages ul li.sent p {
  background: #ff9494;
  color: #f5f5f5;
}
#frame .content .messages ul li.replies img {
  float: right;
  margin: 6px 0 0 8px;
}
#frame .content .messages ul li.replies p {
  background: #f5f5f5;
  float: right;
}
#frame .content .messages ul li img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  float: left;
}
#frame .content .messages ul li p {
  display: inline-block;
  padding: 10px 15px;
  border-radius: 20px;
  max-width: 205px;
  line-height: 130%;
  word-break: break-all;
}
#frame .content .messages ul li p audio{
  max-width: 100px;
  }
@media screen and (min-width: 735px) {
  #frame .content .messages ul li p {
    max-width: 300px;
  }
  #frame .content .messages ul li p audio{
  max-width: 200px;
  }
}
#frame .content .message-input {
  position: absolute;
  bottom: 0;
  width: 100%;
  z-index: 99;
}
#frame .content .message-input .wrap {
  position: relative;
}
#frame .content .message-input .wrap input {
    font-family: "proxima-nova", "Source Sans Pro", sans-serif;
    float: left;
    border: none;
    width: calc(100% - 90px);
    padding: 11px 32px 10px 8px;
    margin: 10px 0 0 5px;
    font-size: 0.8em;
    color: #32465a;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap input {
    padding: 15px 32px 16px 8px;
  }
}
#frame .content .message-input .wrap input:focus {
  outline: none;
}
#frame .content .message-input .wrap .attachment {
  position: absolute;
  right: 60px;
  z-index: 4;
  margin-top: 10px;
  font-size: 1.1em;
  color: #435f7a;
  opacity: .5;
  cursor: pointer;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap .attachment {
    margin-top: 17px;
    right: 65px;
  }
}
#frame .content .message-input .wrap .attachment:hover {
  opacity: 1;
}
#frame .content .message-input .wrap button {
  float: right;
  border: none;
  width: 80px;
  height: 50px;
  padding: 12px 0;
  cursor: pointer;
  background: #32465a;
  color: #f5f5f5;
}
@media screen and (max-width: 735px) {
  #frame .content .message-input .wrap button {
    padding: 16px 0;
  }
}
#frame .content .message-input .wrap button:hover {
  background: #435f7a;
}
#frame .content .message-input .wrap button:focus {
  outline: none;
}

.blur{
 filter: blur(6px); 

  -webkit-filter: blur(6px); 

  -moz-filter: blur(6px);

  -o-filter: blur(6px);

  -ms-filter:progid:DXImageTransform.Microsoft.Blur(PixelRadius='50');

}

select{
	margin-top: 5px;
	width: 100px;
    height: 30px;
    line-height: normal;
    border: solid 2px #ffb6c5;
}
.icon{
	float: right;
	margin-top: 10px;
}

.select-lang{
	float: right;
	padding: 10px;
}


.list-etc{
	width: 10%;
	float: left; 
}

.fa-list-ul:before {
    padding: 10px;
   
   
}

#telepathy{
background-color: rgba(241, 188, 193, 0.6);
border-radius: 10px 10px 10px 10px;
}

#interest{
background-color: rgba(241, 188, 193, 0.6);
border-radius: 10px 10px 10px 10px;
}

.bar-image{
	width: 95%;
}
/* modal start*/
#mydiv {
  position: absolute;
  z-index: 9;
  text-align: center;
   background-color: white; 
  /* height: 400px; */
  width: 300px;
}

#mydivheader {
  cursor: move;
  z-index: 10;
  background-color: rgba(0,0,0,0.3);
  color: #fff;
  margin-top: 0px;
  border-top-width: 150px;

}

.modal-content{
	/* background-color:rgba(255, 122, 122, 0.24); */
	top: -58px; 
	left: -438px;
}

.modal-backdrop{
	background-color: rgba(0, 0, 0, 0);
	    position: relative;
}
body.modal-open{
     margin-right: 0px; 
     padding-right: 0px; 
}
.modal-dialog{
	left: 300px;
    top: 120px;
    width: 10px;
    height: 5px;
}
    
/* modal end */
/* gage */
.bar {
		float:right;
		clear:both;
		width:90%;
		position:relative;
		
		}
		  
		.bar .percent {
		background:#2caedd;
		background:-moz-linear-gradient(left, #2caedd 0%, #86dd2a 28%, #e0d72a 46%, #e8902c 66%, #ed2d2d 86%, #ff0000 100%);
		background:-webkit-gradient(linear, left top, right top, color-stop(0%,#2caedd), color-stop(28%,#86dd2a), color-stop(46%,#e0d72a), color-stop(66%,#e8902c), color-stop(86%,#ed2d2d), color-stop(100%,#ff0000));
		background:-webkit-linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		background:-o-linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		background:-ms-linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		background:linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#2caedd', endColorstr='#ff0000', GradientType=1);
		float:left;
		width:100%;
		height:30px;
		position:relative;
		border-radius: 10px 10px 10px 10px;
		}
		  
		.bar .percent span {
		display:block;
		position:absolute;
		top:0;
		right:0;
		z-index:2;
		width:100%;
		height:30px;
		background:rgba(255, 255, 255, .7);
		border-radius: 0 10px 10px 0;
		
		}
		  
		.bar .circle {
		display:block;
		position:absolute;
		top:50%;
		left:0;
		z-index:3;
		margin:-40px 0 0 -40px;
		width:80px;
		height:80px;
		line-height:80px;
		text-align:center;
		font-size:20px;
		font-family:'PT Sans Narrow', sans-serif;
		color:#fff;
		background:rgba(0, 0, 0, .1);
		-moz-border-radius:40px;
		-webkit-border-radius:40px;
		border-radius:40px;
		-webkit-transition:all 1s ease;
		-moz-transition:all 1s ease;
		-o-transition:all 1s ease;
		}
		  
		.bar .circle.rotate {
		-webkit-transform:rotate(1080deg);
		-moz-transform:rotate(1080deg);
		-o-transform:rotate(1080deg);
		}
		  
		.bar .circle span {
		display:inline-block;
		width:70px;
		height:70px;
		line-height:70px;
		background:rgba(243, 178, 178, 0.86);
		-moz-border-radius:35px;
		-webkit-border-radius:35px;
		border-radius:35px;
		}
		/* gage끝 */
		/* arccordion start */
.accordion-container {
		position: relative;
		width: 100%;
		/* border: 1px solid #0079c1; */
		border-top: none;
		outline: 0;
		cursor: pointer
}

.accordion-container .article-title {
		display: block;
		position: relative;
		margin: 0;
		padding: 0.625em 0.625em 0.625em 2em;
		/* border-top: 1px solid #0079c1; */
		font-weight: bold;
		color: #ffb6c5;
		cursor: pointer;
}

.accordion-container .article-title:hover,
.accordion-container .article-title:active,
.accordion-container .content-entry.open .article-title {
		/* background-color: #00aaa7; */
		color: #fd5d7c;
}

.accordion-container .article-title:hover i:before,
.accordion-container .article-title:hover i:active,
.accordion-container .content-entry.open i {
		color: #f55d7c;
}

.accordion-container .content-entry i {
		position: absolute;
		top: 3px;
		left: 12px;
		font-style: normal;
		font-size: 1.625em;
		sans-serif;
		color: #feb6c5;
}

.accordion-container .content-entry i:before {
		content: "+ ";
}

.accordion-container .content-entry.open i:before {
		content: "- ";
}

.accordion-content {
		display: none;
		/* padding-left: 2.3125em; */

	margin-left: 20px;

		
}

/* #frame .content .contact-profile .accordion-content p{
		
		float: none;
} */
/* This stuff is just for the Codepen demo */

#content {
		width: 100%;
}

.accordion-container,
#description {
		width: 100%;
		margin: 1.875em auto;
}

#description p {
		line-height: 1.5;
}



/* arccordion end */
h2{
	font-size: 30px;
	font-weight: bold;
}	
h1{
	font-weight: bold;
    color: #fd5d7c;
}
.content01{
	margin-left: 20px;	
}

/* sweetalert buttom design^^ */
.swal-button{
	padding : 0 56px;
	color : rgba(0,0,0,.65) !important;
}
.tel{
	margin-right: 20px;
}
input[type="text"]{
border: none;
color: #333;
}
#content03{
    margin-left: 0;
}
</style>


</head>
<body>
<!-- 

A concept for a chat interface. 

Try writing a new message! :)


Follow me here:
Twitter: https://twitter.com/thatguyemil
Codepen: https://codepen.io/emilcarlsson/
Website: http://emilcarlsson.se/

-->

<div id="frame">
	
	<div class="content" id="scroll">
		<div class="contact-profile">
			<div class="social-media" id='favorability'>
			 	<div class="list-etc">
					<i class="fa fa-list-ul" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#basicExampleModal" id="mdStart"></i>
					<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				        aria-hidden="true">
				        <div class="modal-dialog" role="document">
				          <div class="modal-content" id="mydiv">
				            <div class="modal-body" id="m_body">
				            	<div>
				            	

										<div id="accordion" class="accordion-container">
												<article class="content-entry">
														<h1 class="article-title"><i></i>MBTI</h1>
														<div class="accordion-content" id="content01">
															<h1 >you</h1>
																<div id="content01-you"></div>
															<h1 >me</h1>
																<div id="content01-me"></div>	
														</div>
														<!--/.accordion-content-->
												</article>
								
												
								
												<article class="content-entry">
														<h1 class="article-title"><i></i>관심사</h1>
														<div class="accordion-content" id="content02">
															
														</div>
														<!--/.accordion-content-->
												</article>
												<article class="content-entry">
													<h1 class="article-title"><i></i>무엇이든 물어보세요!</h1>
													<div class="accordion-content" id="content03">
														<div class="12u">
															<input type="text" name="questionButton" id="question"> <a
																class="button special 12u" href="#" id="questionButton">질문!</a>
														</div>
													
														
														<div id="content03-result"></div>	
													</div>
														
									
													 
												</article>
												
										</div>
										<!--/#accordion-->
								
										
								
								
									<!-- 	<ul class='col-xs-4 col-sm-12' id='telepathy'>
											<li>이심전심</li>
											<li><a href='#user_1' >상대방</a></li>
											<br ><li id="you"></li>
											<li><a href='#user_2'>나</a></li>
											
											
											<br><li id="me"></li>
										</ul>
										<ul class='col-xs-4 col-sm-12' id='interest'>
											<li>관심사</li>
											<li><a href='#user_1'>상대방</a></li>
											<br>
											 <div class=" text-center"><a class="button" href="#" role="button">확인</a></div>
											 <br>
											
										</ul>
								 -->
								</div>
				            </div>
				            <div class="modal-footer">
				              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				            </div>
				          </div>
				        </div>
				      </div>
				
				</div>
				
				<div class="select-lang">
					<select id="lang"	name="lnag" class=""  >
						<option value>language</option>
						<option value="ko">Korean</option>
						<option value="en">English</option>
						<option value="ja">Japanese</option>
						<option value="zh-cn">Simplified Chinese</option>
						<option value="zh-tw">Traditional Chinese</option>
						<option value="hi">Hindi</option>
						<option value="es">Spanish</option>
						<option value="fr">French</option>
						<option value="de">German</option>
						<option value="ru">Russian</option>
					</select>	
				</div>
				<div class="icon">
					<img   src="/resources/images/chatting/translate02.png" id="translateClick" border='0' style="width: 20px; height: 20px;">
				</div>
				
				<div class="icon">
					<img alt="" src="/resources/images/chatting/profile01.png" id="profile" style="width: 20px; height: 20px;">
				</div> 
				
				<div class="icon">
					<form class='background' id="form123"  enctype="multipart/form-data">
					<input class="form-control" type="file" id="img" name='imgFile' accept="image/*" style='display: none;'> 
					</form>
					<input type="text" name='file2' id='file2' style='display: none;'>
					<img alt="" src="/resources/images/chatting/image01.png" id="imgClick" border='0'  style='width: 20px; height: 20px;'>
				</div>
				
				
				 
				<div class="icon">
					<form class='background' id="formVoice"  enctype="multipart/form-data">
						<input class="form-control" type="file" id="voice" name='voiceFile' accept="audio/*" style='display: none;'> 
					</form>
					<input type="text" name='file1' id='file1' style='display: none;'>
					<img  src="/resources/images/chatting/voice01.png" id="voiceClick" border='0' style="width: 20px; height: 20px;">
				</div>
				
				
				 
			</div>
		</div>
		<div class="messages">
			<ul>
			
			</ul>
		</div>
		<div class="message-input">
			<div class="wrap">
			<input type="text" placeholder="Write your message..." />
			
			<button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
			</div>
		</div>
	</div>
	
	<div class="bar-image">
		<div class="bar">
	 	<br><br>
	 		<div class="col-xs-10 col-sm-10">
			    <div class="percent">
			        <span style="width: 100%;"></span>
			    </div>
			    <div class="circle">
			        <span>0%</span>
			    </div>
		   </div>
		    <div class="text-center col-xs-2 col-sm-2">
		    
		        <!--  <input type="text" class="input" value="0" /> -->
		        <input type="image" class="input" src="/resources/images/chatting/heart.png" style="width:50px; height: 50px"value="좋아요"/>
		        <!-- <small>Please change a value and hit the enter key.</small> -->
		    </div>
		</div>
	</div>
</div>

</body></html>