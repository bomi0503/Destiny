<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
 <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="/resources/css/main.css" > 
   
   
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300' rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script>try{Typekit.load({ async: true });}catch(e){}</script>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>

<script>
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
	    	
	    	
	   $('.input').click( function(e) {
		   
	    	console.log(ti);
	    	
	        if (true) {
	        	
	        	ti=ti+5; 
	        	
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
	                    (bw - pw) / 2,
	                    ca = {
	                        left: cw
	                    }
	                ps.animate(pa);
	                cs.text(val + '%');
	                circle.animate(ca, function() {
	                    circle.removeClass(name)
	                }).addClass(name);
	            } else {
	                alert('range: 0 - 100');
	                ti.val('');
	            }
	        }
	    });
	  
	});
</script>

<style type="text/css">
/* gage */
.bar {
		float:left;
		clear:both;
		width:90%;
		height:30px;
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
</style>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="bar">
		 	<br><br>
		 		<div class="col-xs-11 col-sm-11">
				    <div class="percent">
				        <span style="width: 100%;"></span>
				    </div>
				    <div class="circle">
				        <span>0%</span>
				    </div>
			   </div>
			    <div class="text col-xs-1 col-sm-1">
			    
			        <!--  <input type="text" class="input" value="0" /> -->
			        <input type="image" class="input" src="/resources/images/chatting/heart.png" style="width:50px; height: 50px"value="좋아요"/>
			        <!-- <small>Please change a value and hit the enter key.</small> -->
			    </div>
			</div>
</body>
</html>