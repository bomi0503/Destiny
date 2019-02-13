<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- fullPage.js의 CSS :start -->
	<link rel="stylesheet" type="text/css" href="resources/javascript/fullPage.js-master/dist/fullpage.css" />
	<link rel="stylesheet" type="text/css" href="resources/javascript/fullPage.js-master/examples/examples.css" />
	<!-- fullPage.js의 CSS :end -->
	
	<style>
        body {
            padding-top : 100px;
        }
        .navbar-fixed-top{height:100px; padding-top:20px;}
        .thumbnail img{width:300px; height:300px; vertical-align:middle;}
        .jumbotron{height:450px;}
        
        <style>

	/* Style for our header texts
	* --------------------------------------- */
	h1{
		font-size: 5em;
		font-family: arial,helvetica;
		color: #fff;
		margin:0;
		padding:0;
	}

	/* Centered texts in each section
	* --------------------------------------- */
	.section{
		text-align:center;
		overflow: hidden;
	}

	#myVideo{
		position: absolute;
		right: 0;
		bottom: 0;
		top:0;
		right:0;
		width: 100%;
		height: 100%;
		background-size: 100% 100%;
 		background-color: black; /* in case the video doesn't fit the whole page*/
  		background-image: /* our video */;
  		background-position: center center;
  		background-size: contain;
   		object-fit: cover; /*cover video background */
   		z-index:3;
	}



	/* Layer with position absolute in order to have it over the video
	* --------------------------------------- */
	#section0 .layer{
		position: absolute;
		z-index: 4;
		width: 100%;
		left: 0;
		top: 43%;

		/*
		* Preventing flicker on some browsers
		* See http://stackoverflow.com/a/36671466/1081396  or issue #183
		*/
		-webkit-transform: translate3d(0,0,0);
		-ms-transform: translate3d(0,0,0);
		transform: translate3d(0,0,0);
	}

	/*solves problem with overflowing video in Mac with Chrome */
	#section0{
		overflow: hidden;
	}


	/* Bottom menu
	* --------------------------------------- */
	#infoMenu li a {
		color: #fff;
	}


	/* Hiding video controls
	* See: https://css-tricks.com/custom-controls-in-html5-video-full-screen/
	* --------------------------------------- */
	video::-webkit-media-controls {
	  display:none !important;
	}

	</style>

   	</style>
   	
  </head>

  <body>
  
  <!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/toolBar.jsp" /> --%>
  <!-- ToolBar End /////////////////////////////////////-->
    
    <!-- fullpage.js : start -->
    <div id="fullpage">
    
    	<!-- 첫번째 section : start -->
		<div class="section " id="section0">
			<!-- toolBar : start -->
			<jsp:include page="/layout/toolBar.jsp" />
			<!-- toolBar : end -->
			<video id="myVideo" loop muted data-autoplay>
				<source src="resources/javascript/fullPage.js-master/examples/imgs/flowers.mp4" type="video/mp4">
				<source src="resources/javascript/fullPage.js-master/examples/imgs/flowers.webm" type="video/webm">
			</video>
			<div class="layer">
				<h1>fullPage.js videos</h1>
			</div>
		</div>
		<!-- 첫번째 section : end -->
		
		<!-- 두번째 section : start -->
		<div class="section" id="section1">
			
		    <div class="container">
		      
		      <div class="page-header">
		        <h1 align="center">BEST</h1>
		      </div>
		      
		      <div class="row">
			  
				  <div class="col-xs-6 col-md-3">
				      <a href="#" class="thumbnail">
				      	<img src="../resources/images/layout/mbti.jpg" alt="...">
				    </a>
				  </div>
			  
				  <div class="col-xs-6 col-md-3">
				    <a href="#" class="thumbnail">
				      <img src="../resources/images/layout/meeting.jpg" alt="...">
				    </a>
				  </div>
			  
				  <div class="col-xs-6 col-md-3">
				    <a href="#" class="thumbnail">
				      <img src="../resources/images/layout/find.png" alt="...">
				    </a>
				  </div>
			  
				  <div class="col-xs-6 col-md-3">
				    <a href="#" class="thumbnail">
				      <img src="../resources/images/layout/chatting.jpg" alt="...">
				    </a>
				  </div>
			  
				</div>
				
		    </div>
		</div>
		<!-- 두번째 section : end -->
		
		<!-- 세번째 section : start -->
		<div class="section" id="section2">
			<h1>Lovely images <br />for a lovely page</h1>
		</div>
		<!-- 세번째 section : end -->
		
	</div>
	
	<script type="text/javascript" src="resources/javascript/fullPage.js-master/dist/fullpage.js"></script>
	<script type="text/javascript" src="resources/javascript/fullPage.js-master/examples/examples.js"></script>

	<script type="text/javascript">
	    var myFullpage = new fullpage('#fullpage', {
	        verticalCentered: true,
	        sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE']
	    });
	</script>
    <!-- fullpage.js : end -->
    
    <div class="jumbotron">
      <div class="container">
        <h1>우연	</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
      	
      </div>
    </div>
  
  
    <!-- thumnail -->
    <!-- <div class="container">
      <div class="page-header">
        <h1 align="center">BEST</h1>
      </div>
      <p class="lead"> <br/> </p>
    </div> -->
    
    <!-- Begin page content -->
    <!-- <div class="row">
	  <div class="col-xs-6 col-md-3">
	      <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/mbti.jpg" alt="...">
	    </a>
	  </div>
	  
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/meeting.jpg" alt="...">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/find.png" alt="...">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/chatting.jpg" alt="...">
	    </a>
	  </div>
	  
	</div> -->
    <!-- /.thumnail -->
    

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- <br/><br/><br/><br/><br/><br/> -->
	<jsp:include page="/layout/footer.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
    
  </body>
</html>
