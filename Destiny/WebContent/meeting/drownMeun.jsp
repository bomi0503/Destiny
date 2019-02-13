<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.1.2/css/material-design-iconic-font.min.css">
<style media="screen">
		#content {  
		  position:absolute;
		  height:10%;   /* ���޴�, ��� �̹����� ���� */
		  width:10%;    /* ���޴�, ��� �̹����� �ʺ�*/
		  margin:0px 0px 10% 88%;   /* ���� �������� ��ġ�� ȭ�� ������� �󸶸�ŭ ���������� ���̾ ���� ������ ����  */ 
		  top: 10%;  /* ��� ��ܿ��� �󸶳� ����߸��� ����*/
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
		  position: absolute;
		  top : 25em;
		  right: 10px;
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
		.menu-button2 {
		  -webkit-transition: 0.4s;
		  -moz-transition: 0.4s;
		  transition: 0.4s;
		  position: absolute;
		  top : 31em;
		  right: 10px;
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
		 		
		        var offset = $("#content").offset();
		        var topPadding =15;
		        $(window).scroll(function() {
		
		            if ($(window).scrollTop() > offset.top) {
		                $("#content").stop().animate({
		                    marginTop: $(window).scrollTop() - offset.top + topPadding
		                }, 500);
		            } else {
		                $("#content").stop().animate({
		                    marginTop: 0
		                });
		            };
		         });
		         
		         
		    }); 
//===============�޴���==========
			$(function() {
				
				///==============���� 
				  	$( "a:contains('����')" ).on("click" , function() {
				  		alert("����");	
					 
					});
				  //=============�ƴ�============================
					$("a:contains('�ƴ�')").click(function () {
						alert("�ƴ�");
					});
					//=================Ȱ��==================================//		
					$("a:contains('Ȱ��')").click(function () {
						alert("Ȱ��");
					});
					
					//=======����==============================
					$("a:contains('����')").click(function () {
						alert("����");
					});
					
					//========me================================
					 $( "a:contains('Me')" ).on("click" , function() {
						 alert("Me");
					});

			

			});
				  

		</script>

</head>


<body>
		<div id="content" >
			<div class="menu-button"><i class="zmdi zmdi-share"></i>
				<a>����</a>
				<a>�ƴ�</a>
				<a>Ȱ��</a>
				<a>����</a>
				<a>Me</a>
			</div>	
		</div>
</body>
</html>