<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>



	<script type="text/javascript">
	
		$(function() {
			$("a[href='#' ]:contains('우리들의 연결고리')").on("click", function() {
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
			$("a[href='#' ]:contains('RestaurantInfo')").on("click", function() {
				self.location = "/info/listRestaurantInfo"
			});
			$("a[href='#' ]:contains('Complain')").on("click", function() {
				self.location = "/complain/listComplain"
			});
			$("a[href='#' ]:contains('UserList')").on("click", function() {
				self.location = "/user/listUser"
			});
			/* $("a[href='#' ]:contains('login')").on("click", function() {
				self.location = "/user/login"
			}); */
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
			
		});
	/* 
	$(document).ready(function(){
		    $("#preview").attr("scrolling", "no"); 
			
			/* // Fullscreen preview
		    $("#myModal").on('show.bs.modal', function(event){
		        $(this).find(".modal-body").html('<iframe src="bootstrap/elegant-modal-login-form-with-avatar-icon.php" frameborder="0" class="fullscreen"></iframe>');
		    }); 
		});
	 */
		//============= "로그인"  Event 연결 =============
		$( function() {
			
			$("#password").keypress(function(e) {
				if(e.which == 13) {
					$(this).blur();
					$('#loginButton').focus().click();
				}
			});
			
			$("#userId").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#loginButton").on("click" , function() {
				var id=$("input[name='userId']").val();
				var pw=$("input[name='password']").val();
				
				if(id == null || id.length <1) {
					alert('ID 를 입력하지 않으셨습니다.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('패스워드를 입력하지 않으셨습니다.');
					$("#password").focus();
					return;
				}
				
				$("#loginForm").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
				//self.location = "/user/login/"+id+"/"+pw;
			});
		});	
		
	</script>
	
	<style>
        body {padding-top : 100px;}
        
        .navbar-fixed-top{height:100px; padding-top:20px;}
        .navbar-nav-left{text-align:right;}
        
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
   	</style>

   	<style type="text/css">
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
	}
	.modal-login .modal-header {
		border-bottom: none;   
        position: relative;
        justify-content: center;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-login .form-control:focus {
		border-color: #70c5c0;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-login .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-login .modal-footer {
		background: #ecf0f1;
		border-color: #dee4e7;
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
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #60c7c1;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-login .avatar img {
		width: 100%;
	}
	.modal-login.modal-dialog {
		margin-top: 80px;
	}
    .modal-login .btn {
        color: #fff;
        border-radius: 4px;
		background: #60c7c1;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #45aba6;
		outline: none;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
	</style>
   	</head>
   	<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
    
    <div class="container">
    	<div class="navbar-header">
    		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<!-- <span class="sr-only">Toggle navigation</span> -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">우리들의 연결고리</a>
		</div>
        
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<!-- <li class="active"><a href="#">Home</a></li> -->
				<li><a href="#">Meeting</a></li>
				<li><a href="#">Chatting</a></li>
				<li><a href="#">Place</a></li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
						<span>Story</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">RestaurantInfo</a></li>
						<li><a href="#">LoveAdvice</a></li>
					</ul>
				</li>
				<li><a href="#">Notice</a></li>
				
				<c:if test="${me.userGrade == 'ADM'}">
				
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
							<span>Admin</span>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">Complain</a></li>
							<li><a href="#">UserList</a></li>
						</ul>
					</li>
				
					<!-- <li><a href="#">Complain</a></li> -->
				</c:if>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<c:if test="${me == null}">
					<li><a href="#" id="btn-open-dialog" id="btn-open-dialog">login</a></li>
					<li><a href="#">join</a></li>
				 
					
				</c:if>
				
				<c:if test="${me != null}">
					<li><a> ${me.nickName}님 반갑습니다. </a></li>
					<li><a href="#">MyPage</a></li>
					<li><a href="#">logout</a></li>
				</c:if>
			</ul>
			
		</div>
		<div id="myModal" >
		<div id="my-dialog">
			<div class="modal-dialog modal-login">
				<div class="modal-content">
					<div class="modal-header ">
						<div class="avatar">
							<img src="/resources/images/meeting/logo.png"  alt="Avatar">
						</div>				
						<h4 class="modal-title">Login</h4>	
		                
					</div>
					<div class="modal-body">
						<form id="loginForm">
							<div class="form-group" class="form-horizontal">
								<input id="userId" type="text" class="form-control" name="userId" placeholder="Username" required="required">		
							</div>
							<div class="form-group">
								<input id="password" type="password" class="form-control" name="password" placeholder="Password" required="required">	
							</div>        
							<div class="form-group">
								<button id="loginButton" type="submit" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<a href="#">Forgot Password?</a>
					</div>
				</div>
			</div>
		</div>      
		</div>	 
		<!--/.nav-collapse -->
	
	</div>
	<div id="dialog-background"></div>
	</nav>
</body>
</html>