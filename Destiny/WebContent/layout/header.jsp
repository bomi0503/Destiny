<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<link rel="stylesheet" href="/resources/dist/css/superfish.css" media="screen">
<script src="/resources/dist/js/hoverIntent.js"></script>
<script src="/resources/dist/js/superfish.js"></script>

<script type="text/javascript">



   $(function() {
      
      $("a[href='#' ]:contains('Destiny')").on("click", function() {
         self.location = "/index.jsp"
      });
      $("a[href='#' ]:contains('Meeting')").on("click", function() {
         self.location = "/meeting/listMeeting"
      });
      $("a[href='#' ]:contains('Chatting')").on("click", function() {
         self.location = "/chatting/mainChatting"
      });
      $("a[href='#' ]:contains('Place')").on("click", function() {
         self.location = "/find/mainFind"
      });
      $("a[href='#' ]:contains('MeetingStory')").on("click", function() {
         self.location = "/meetingStory/listMeetingStory"
      });
      $("a[href='#' ]:contains('DateStory')").on("click", function() {
         self.location = "/date/listDateStory"
      });
      $("a[href='#' ]:contains('RestaurantInfo')").on("click", function() {
         self.location = "/info/listRestaurantInfo"
      });
      $("a[href='#' ]:contains('LoveAdvice')").on("click", function() {
         self.location = "/love/listLoveAdvice"
      });
      $("a[href='#' ]:contains('Notice')").on("click", function() {
         self.location = "/notice/listNotice"
      });
      $("a[href='#' ]:contains('Complain')").on("click", function() {
         self.location = "/complain/listComplain"
      });
      $("a[href='#' ]:contains('UserList')").on("click", function() {
         self.location = "/user/listUser"
      });
      $("a[href='#' ]:contains('login')").on("click", function() {
         //self.location = "/user/login"
         //self.location = "/user/userInfo/login.jsp"
      });
      $("a[href='#' ]:contains('join')").on("click", function() {
         self.location = "/user/addUser"
      });
      $("a[href='#' ]:contains('MyPage')").on("click", function() {
         self.location = "/user/getUserView"
      });
      $("a[href='#' ]:contains('logout')").on("click", function() {
         self.location = "/user/logout/${me.userId}"
      });
      $("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
         $("#my-dialog,#dialog-background").toggle();
      });
      $("#letter_icon").on("click", function() {
    	  popWin = window.open("/letter/getLetterList",
				   	 "popWin",
					 "left=300, top=200, width=1100, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
       });
      
   });
//////////============= "로그인"  Event 연결 =============   
   $( function() {
      
      $("#headerPw").keypress(function(e) {
         if(e.which == 13) {
            $(this).blur();
            $('#loginButton').focus().click();
         }
      });
      
      $("#headerId").focus();
      
      $('#headerId').on("keyup", function(){
         var id=$("#headerId").val();
         $('.loginOk').text('');
         if(id.length > 3 ){
            $.ajax(
                   {
                      method : "GET",
                      url : '/user/json/getUser/'+id,
                      success : function(JSONData){
                         if(JSONData.user == null){
                            $('#loginCheckId').text('해당 회원이 존재하지 않습니다.');
                         }else{
                            $('#loginCheckId').text('');
                            if(JSONData.user.userGrade == 'BLK'){
                               $('#loginCheckBlack').text('블랙리스트');
                            }else if(JSONData.user.userGrade != 'BLK'){
                               $('#loginCheckBlack').text('');
                            }
                         }
                      }
                
             });
         }else if(id.length == 0){
            $('#loginCheckId').text('');
         }
      });
      
      $('#headerPw').on("keyup", function(){
         var id=$("#headerId").val();
         var pw=$("#headerPw").val();
         $('.loginOk').text('');
         $.ajax(
               {
                  method : "GET",
                  url : '/user/json/getUser/'+id,
                  success : function(JSONData){
                     if(JSONData.user.password != pw){
                        $('#loginCheckPw').text('비밀번호가 틀립니다.');
                     }else{
                        $('#loginCheckPw').text('');
                     }
                  }
            
         });
      });
      
      $("#loginButton").on("click" , function() {
         var id=$("#headerId").val();
         var pw=$("#headerPw").val();
         
         if(id == null || id.length <1) {
            //alert('ID 를 입력하지 않으셨습니다.');
            $('.loginOk').text('아이디를 입력해주세요.');

            $("#headerId").focus();
            return;
         }
         
         if(pw == null || pw.length <1) {
            //alert('패스워드를 입력하지 않으셨습니다.');
            $('.loginOk').text('비밀번호를 입력해주세요.');
            $("#headerPw").focus();
            return;
         }
         
         if($('#loginCheckId').text() != null && $('#loginCheckId').text() != ''){
            //alert('아이디가 존재하지 않습니다.');
            $('.loginOk').text('아이디가 존재하지 않습니다.');
            $("#headerId").focus();
            return false;
         }
         
         if($('#loginCheckPw').text() != null && $('#loginCheckPw').text() != ''){
            //alert('비밀번호가 틀립니다.');
            $('.loginOk').text('비밀번호가 일치하지 않습니다.');
            $("#headerPw").focus();
            return false;
         }
         
         if($('#loginCheckBlack').text() != null && $('#loginCheckBlack').text() != ''){
            //alert('블랙리스트 회원입니다.');
            $('.loginOk').text('블랙리스트 회원입니다.');
            $("#headerPw").focus();
            return false;
         }
         
         $("#loginForm").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
      });
      
         /* $.ajax(
               {
                  method : "GET",
                  url : '/user/json/getUser/'+id,
                  success : function(JSONData){
                     if(JSONData.user == null){
                        alert('user없음');
                        $('#loginCheck').text('user없음');
                     }
                  }
            
         }) */
      
   });   
</script>
<style>

   @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR|Pacifico');
   
   strong{
      font-family: 'Nanum Myeongjo', serif;
   }
   #example{
      font-family: 'Source Serif Pro', serif;
   }
      #example a:hover{
         /* color : #1c1c1c; */
      }
   .modal-login .avatar img {
       width: 100%;
       margin-top: 5px;
   }
   
   .modal-login .avatar {
       background: #fd5d7c;
   }
    #dialog-background {
       display: none;
       position: fixed;
       top: 0; left: 0;
       width: 100%; height: 100%;
       background: rgba(0,0,0,.3);
       z-index: 10;
   }
   #my-dialog {
       display: none;
       position: fixed;
       left: calc( 50% - 160px ); top: calc( 30% - 70px );
       width: 100px; height: 100px; 
       z-index: 11;
       padding: 10px;
   }
    body {
      font-family: 'Varela Round', sans-serif;
   }
   .modal-login {      
      color: #636363;
      width: 350px;
   }
   .modal-login .modal-content {
      padding: 20px;
      border-radius: 5px;
      border: none;
      background-color: #fff;
   }
   .modal-login .modal-header2 {
      border-bottom: none;   
        position: relative;
        justify-content: center;
   }
   
   .modal-login h4 {
      text-align: center;
      font-size: 26px;
      margin: 30px 0 ;
   }
   .modal-login .form-control:focus {
      /* border-color: #70c5c0; */
   }
   .modal-login .form-control, .modal-login .btn2 {
      min-height: 40px;
      border-radius: 3px; 
   }
   .modal-login .close {
        position: absolute;
      top: -5px;
      right: -5px;
   }   
   .modal-login .modal-footer {
      background: #ecf0f1; /* #ecf0f1; */
      border-color: #dee4e7; /* #dee4e7 */
      text-align: center;
        justify-content: center;
      margin: 0 -20px -20px;
      border-radius: 5px;
      font-size: 13px;
   }
   .modal-login .modal-footer a {
      color: #999;
   }      
   .modal-login .avatar {
      position: absolute;
      margin: 0 auto;
      left: 0;
      right: 0;
      top: -100px;
      width: 95px;
      height: 95px;
      border-radius: 50%;
      z-index: 9;
      /* background: #60c7c1; */
      padding: 15px;
      box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
   }
   .modal-login .avatar img {
      width: 100%;
   }
   .modal-login.modal-dialog {
      margin-top: 80px;
   }
    .modal-login .btn2 {
        color: #fff;
        border-radius: 4px;
      /* background: #60c7c1; */
      text-decoration: none;
      transition: all 0.4s;
        line-height: normal;
        border: none;
    }
   .modal-login .btn2:hover, .modal-login .btn2:focus {
      /* background: #45aba6; */
      outline: none;
   }
   .trigger-btn {
      display: inline-block;
      margin: 100px auto;
   }
   #headerId, #headerPw{
      margin-bottom : 20px;
  }
   
   input[type="text"], input[type="password"], select, textarea {
       background: #ffe7e7;
       border: none;
       color: #555;
       border-radius: 2px;
       width:100%;
   }
   #header a:last-child{
      padding-right : 14px;
   }
	
	.inner{
		
	}
	.inner .sf-menu{
		float : left;
		margin-left : 150px;
	}
	.right_nav{
		margin-left:0px;
		float : right;
	}
   .sf-menu .current{
      text-align : left;
   }
   .sf-menu li:hover{
      border-bottom : 2px solid white;
   }

   .right_nav{
		list-style-type : none;
   }
   .right_nav li{
		float : left;
   }
   		.right_nav li:hover{
   			border-bottom : 2px solid white;
   		}
   .welcome:hover{
		border-bottom : 0px solid white !important;
   }
   .welcome{
   		font-family: 'Nanum Myeongjo', serif;
   		font-size : 16px;
   		padding-right : 16px;
   }
   
   #mail{
   		position : relative;
   }
	   #mailCount{
	   	background : #ff3057;
	   	border-radius : 100%;
	   	width : 20px;
	   	height : 20px;
	   	line-height : 21px;
	   	text-align : center;
	   	position : absolute;
	   	top : 10px;
	   	left : 30px;
	   	color : white;
	   	font-size : 15px;
	   }
   
   
   @media screen and (max-width:1280px){
   		.welcome{display:none;}
   }
   @media screen and (max-width:1120px){
   		.welcome{display:none;}
   }
   @media screen and (max-width:1015px){
   		#mail{display:none;}
   }
   @media screen and (max-width:1035px){
   		.sf-menu{display:none;}
		.right_nav{display:none;}
   }

	.logo{
		font-family: 'Pacifico';
	}
	
	.login_icon img{
		width : 20px;
		margin-top : -4px;
		vertical-align: middle;
		margin-right : 10px;
	}
	
	.right_nav li{
		padding-left : 0px;
	}
</style>

<header id="header">

   <div class="inner">
      <a href="#" class="logo">Destiny</a>
      <!-- header 수정 후엔 footer.jsp에 #navepanel도 수정해주기 -->
      <ul class="sf-menu" id="example">
         <li><a href="#">Meeting</a></li>
         <li><a href="#">Chatting</a></li>
         <li><a href="#">Place</a></li>
         <li class="current">
            <a href="#">Story</a>
            <ul>
               <li><a href="#">MeetingStory</a></li>
               <li><a href="#">DateStory</a></li>
            </ul>
         </li>
         <li class="current">
            <a href="#">Information</a>
            <ul>
               <li><a href="#">RestaurantInfo</a></li>
               <li><a href="#">LoveAdvice</a></li>
            </ul>
         </li>
         <li><a href="#">Notice</a></li>
         <c:if test="${me.userGrade == 'ADM'}">
         	<li class="current">
	            <a href="#">Admin</a>
	            <ul>
	               <li><a href="#">Complain</a></li>
	               <li><a href="#">UserList</a></li>
	            </ul>
	         </li>
         </c:if>
      </ul>
      
      <ul class="right_nav" id="example">
		
         
         <c:if test="${me == null}">
            <li><a href="#" id="btn-open-dialog" ><span class="login_icon"><img src="/resources/icon/login.png"></span>login</a></li>
            <li><a href="#">join</a></li>
         </c:if>
         <c:if test="${me != null}">
         	<c:if test="${me.userGrade == 'ADM'}">
         		<li class="welcome">관리자로 접속중</li>
            	<c:if test="${notRead != 0}">
		            <li id="mail" >
		            	<a id="letter_icon" href="#">
		            		<span class="login_icon">
		            			<img src="/resources/icon/mail.png">
		            		</span>
		            	</a>
	            		<p id="mailCount">${notRead}</p>
		            </li>
	            </c:if>
	            <li><a href="#"><span class="login_icon"><img src="/resources/icon/myPage.png"></span>MyPage</a></li>
            	<li><a href="#"><span class="login_icon"><img src="/resources/icon/logout.png"></span>logout</a></li>
	         </c:if>
	         <c:if test="${me.userGrade != 'ADM'}">
	            <li class="welcome">${me.nickName}님 우리 ㄱr끔식 오래보r요...</li>
	            <c:if test="${notRead != 0}">
		            <li id="mail" >
		            	<a id="letter_icon" href="#">
		            		<span class="login_icon">
		            			<img src="/resources/icon/mail.png">
		            		</span>
		            	</a>
	            		<p id="mailCount">${notRead}</p>
		            </li>
	            </c:if>
	            <li><a href="#"><span class="login_icon"><img src="/resources/icon/myPage.png"></span>MyPage</a></li>
	            <li><a href="#"><span class="login_icon"><img src="/resources/icon/logout.png"></span>logout</a></li>
	         </c:if>
         </c:if>
      </ul>
      
      <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
   </div>
   
   <div id="myModal" >
      <div id="my-dialog">
         <div class="modal-dialog modal-login">
            <div class="modal-content">
               <div class="modal-header2 " style="height:50px">
                  <div class="avatar">
                     <img src="/resources/images/meeting/logo.png"  alt="Avatar">
                  </div>            
                  <h4>Login</h4>
               </div>
               <div class="modal-body">
                  <form id="loginForm">
                     <div class="form-group" class="form-horizontal">
                        <input id="headerId" type="text" class="" name="userId" placeholder="userId" required="required">
                     </div>
                     <div class="form-group">
                        <input id="headerPw" type="password" class="" name="password" placeholder="Password" required="required">
                     </div>  
                              
                     <span class="loginCheckId" id="loginCheckId"></span>
                     <input type="hidden" class="loginCheckPw" id="loginCheckPw"></input>
                     <input type="hidden" class="loginCheckBlack" id="loginCheckBlack"></input>
                     
                     <div class="loginOk" align="left"></div>
                     
                     <div class="form-group" align="center">
                        <button id="loginButton" type="submit" class="btn2">Login</button>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <a href="/user/userInfo/findId.jsp">Forgot Id?</a>
                  <a href="/user/userInfo/updatePassword.jsp">Forgot Password?</a>
               </div>
            </div>
         </div>
      </div>      
      </div>    
      
      <div id="dialog-background"></div>
      
      <div id="navPanel">
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Home</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Meeting</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Chatting</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Place</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">RestaurantInfo</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">LoveAdvice</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Notice</a>
			<c:if test="${me.userGrade == 'ADM'}">
				<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Complain</a>
				<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">UserList</a>
			</c:if>
			<c:if test="${me == null}">
				<a href="#" id="btn-open-dialog" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">login</a>
				<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">join</a>
			</c:if>
			<c:if test="${me != null}">
				<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">MyPage</a>
				<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">logout</a>
			</c:if>
			<a href="#navPanel" class="close" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></a>
		</div>

		<div class="nav_bg"></div>
</header>