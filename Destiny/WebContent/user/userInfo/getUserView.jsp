<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>

<!-- All js -->
<!-- ��Ʈ��Ʈ�� CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>
<script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css">
<!-- //All CSS Insert -->

<script>
		
		$(function(){
			$("button[id='leaveSite']").on("click", function(){
				/* self.location = "/user/userInfo/leaveSite.jsp"; */
				swal("Ż���ϴ� ��� �ٽ� ������ �� ������ ����� �ű�ȸ������ ���µ˴ϴ�.", {
					icon:"info",
					  buttons: {
					    cancel: "���",
					    catch: {
					      text: "Ż��",
					      value: "catch",
					    },
					  },
					})
					.then((value) => {
					  switch (value) {
					 	
					  	case "catch":
					      swal({title:"Ż�𼺰�", icon:"success"}).then((value => {
					    	  self.location = "/user/leaveSite";
					      }))
					      break;
					 
					    default:
					      swal("��ҵǾ����ϴ�.",{icon:"success"});
					  }
					});
			});
		});
		
		
		
		$(function(){
			$("button[id='actMainButton']").on("click", function(){
				self.location = "/user/userAct/actMain.jsp";
			});
		});
		
		
		$(function(){
			$("a[id='letterList']").on("click", function(){
				popWin = window.open("/letter/getLetterList",
					   	 "popWin",
						 "left=300, top=200, width=1100, height=585, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
				/* popWin = window.open("/letter/getLetterList2.jsp",
					   	 "popWin",
						 "left=300, top=200, width=1100, height=585, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no"); */						 

			});
		});
		
		$(function(){
			$("a[id='questionButton']").on("click", function(){
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
						alert(JSONData.answer.return_object.answer);
						//$('#answerWirte').text(JSONData.answer.return_object.answer);
					}
					
				});
				
			});
		});
		
		$(function() {
            var offset = $("#content").offset();
            var topPadding = 15;
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
		
	</script>


<!-- //All js -->


<style>
#grad1 {
	height: 300px;
	background-color: #000000;
	background-image: linear-gradient(to right, #000000, #FFFFFF);
}

#communitymove h3 {
	color: #ff264a;
	font-weight: bold;
}

#communitymove p {
	color: #3e3e3e;
}

.ment {
	text-align: center;
}
</style>

<style type="text/css" media="screen">
#content {
	position: absolute;
	width: 270px; /* ���޴�, ��� �̹����� �ʺ�*/
	/* ���� �������� ��ġ�� ȭ�� ������� �󸶸�ŭ ���������� ���̾ ���� ������ ����  */
	top: 30em; /* ��� ��ܿ��� �󸶳� ����߸��� ����*/
	right : 50px; /* ���̾��� �������� �������� ���� 50% ���� */
	text-align: left;
	border: 1px solid #ff879b;
	border-radius: 15px;
	padding : 20px;
}

#questionButton{
	margin-top : 10px;
}

.topImg {
	max-width: 100%;
	height: 400px;
	background-image: url("/resources/images/background/myPageBackground.jpg");
	background-position: center center;
	background-size: cover;
	background-repeat: no-repeat;
}

.topImg::after {
	content: "";
	background: rgba(0, 0, 0, 0.2);
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 400px;
}

.topImg h1 {
	position: absolute;
	width: 100%;
	margin: 0;
	padding: 0;
	font-family: 'Nanum Myeongjo', serif;
	font-size: 60px;
	text-align: center;
	height: 400px;
	line-height: 450px;
	color: white;
	z-index: 99;
}

.my{
	margin : 0;
	padding : 0;
	overflow : hidden;
}
.my li{
	list-style-type : none;
	float : left;
	width : 25%;
	padding : 2em;
	margin : 0 auto;
}
.my li h4{
	margin : 0;
	margin-bottom : 1em;
	font-family: 'Nanum Myeongjo', serif;
	font-weight : bold;
}
.my li .image{
	display : block;
	margin-bottom : 1em;
}
.my li .image img{
	margin : 0 auto;
}

@media screen and (max-width:1280px){
	.my li{
		width : 50%;
	}
}
@media screen and (max-width:750px){
	.my li{
		width : 100%;
	}
}





		/* ������CSS : start */
		ul{
			margin : 0;
			padding : 0;
		}
		
		.modal-header{
			border : 0;
			text-align : center;
		}
		.modal-body{
			padding : 0;
		}
		.modal-footer{
			border : 0;
		}
		
		#top{
			overflow : hidden;
		}
			#top li{
				list-style-type : none;
				float : left;
				padding : 0;
				width : 50%;
				border-top : 1px solid #e5e5e5;
				border-bottom : 1px solid #e5e5e5;
			}
			#top li:nth-child(1){
				border-right : 1px solid #e5e5e5;
			}
			#top li a{
				text-decoration : none;
				color : black;
				display : block;
				width : 100%;
				text-align : center;
				padding : 20px;
			}
			#top li a:hover{
				color : white;
				background : #ff264a;
				transition : 1s;
			}
		/* ������CSS : end */
		
	/* sweetalert buttom design^^ */
	.swal-button{
		padding : 0 56px;
		color : rgba(0,0,0,.65) !important;
	}
</style>



</head>

<body>


	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->


	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>����������</h1>
	</div>
	<!-- ���ι���̹��� : end -->


	<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="communitymove" class="wrapper align-center">

		<div class="inner">

			<div id="content">
				<div class="12u">
					<input type="text" name="questionButton" id="question">
					<a class="button special 12u" href="#" id="questionButton">����!</a>
				</div>

			</div>


			<div class="box alt">
				

					
					
						<ul class="my">
							<li>
								<h4>���� &amp; ����</h4>
								<p>
								<div class="image">
									<img
										src="/resources/images/layout/KakaoTalk_20190129_213128976.jpg"
										alt="Pic 01" width="250" height="250">
								</div>
								<a class="button" href="/user/addTypeView/${me.userId}">select</a>
							</li>
							<li>
								<h4>����</h4>
								<div class="image">
									<img
										src="/resources/images/layout/letterother.jpg" alt="Pic 01"
										width="250" height="250" />
								</div>
								<!-- Button trigger modal -->
								<!-- <button type="button" data-toggle="modal" data-target="#myModal2">
									open
								</button>-->
								<a href="#" class="button" id="letterList">open</a>
							</li>
							<li>
								<h4>Ȱ������</h4>
								<div class="image">
									<img alt="Pic 01"
										src="/resources/images/layout/act.jpg" width="250" height="250" />
								</div>
								<a href="/user/userAct/actMain.jsp" class="button"
									id="actMainButton">move</a>
							</li>
							<li>
								<h4>����������ȸ</h4>
								<div class="image">
									<img alt="Pic 01"
										src="/resources/images/layout/users.png" width="250"
										height="250" />
								</div>
								<a href="/user/getUser/${me.userId}" class="button"
									id="myInfoButton">move</a>
							</li>
						</ul>
				<br />
				<br />
				<div>
					<br />
					<button id="leaveSite" type="button" >
						<p>����Ʈ Ż��</p>
					</button>
				</div>
			</div>

		</div>

	</section>
	<!-- //contents -->
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">

	    <!-- modal-content : start -->
	    <div class="modal-content">
	      
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalLabel">����</h4>
	      </div>
	      
	      <div class="modal-body">
			<section id="top">
				<ul>
					<li><a href="/letter/getLetterList">���� ������</a></li>
					<li><a href="/letter/sendLetterList">���� ������</a></li>
				</ul>
			</section>
			<section id="bottom"></section>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" data-dismiss="modal">Close</button>
	      </div>
	      
	    </div>
	    <!-- modal-content : end -->
	  </div>
	</div>
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->



</body>
</html>