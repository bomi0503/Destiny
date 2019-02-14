<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
<!-- All CSS Insert -->

<!-- //All CSS Insert -->

<!-- All js -->
   <!--  템플릿 사용하기 위해 필요한 js -->
   <script src="/resources/javascript/jquery.min.js"></script>
   <script src="/resources/javascript/skel.min.js"></script>
   <script src="/resources/javascript/util.js"></script>
   <script src="/resources/javascript/main.js"></script>
   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <link rel="stylesheet" href="/resources/css/main.css" > 
   
   
   <script type="text/javascript">
   var userId="${me.userId}";
   var userType="${me.myType}";
   var firstType="${me.firstType}";
   var secondType="${me.secondType}";
   var thirdType="${me.thirdType}";
   var userGrade="${me.userGrade}";
   var manCount=0;
   var womanCount=0;
   
   
   function getTelepathyTest(){
      if (userId=="") {
         alert("로그인 후 이용 가능합니다.");
         $("#my-dialog,#dialog-background").toggle();
      }else if (userGrade=='BLK') {
    	  alert("일반회원 이상부터 이용 가능합니다.");
	  }else{
         //location="/chatting/addRandomChatting";
         ///////////////////////////////////////////////
            
            $.ajax({   
               
               url : "/chatting/json/addRandomChatting" ,
               type : "GET" ,
               dataType : "json" ,
               headers : {
                  "Accept" : "application/json",
                  "Content-Type" : "application/json"
               },
               success : function(JsonData) {
                  //alert("성공");
                  
                  popWin = window.open("/chatting/getRandomMatching.jsp","popWin", " width=800, height=950, scrollbars=1");
                 
                 
                           },//success
                  error: function () {
                     alert("error");
                  },
                  complete: function () {
                    
                    //alert("complete");
                  }
               
            });//ajax
         
      }
   }
   function getPerfectChatting(){
      //////////////로그인 기능 작동 가능시
       if (userId=="") {
         alert("로그인 후 이용 가능합니다.");
         $("#my-dialog,#dialog-background").toggle();
      }else {
         if (userGrade=='NEW' || userGrade=='BLK') {
            alert("일반회원 이상부터 이용 가능합니다.");
         }else{
            
         
            if(userType==""||firstType==""){
               location = "/user/addTypeView";
            }else{
               
               ///////////////////////////////////////////////
               
               $.ajax({   
                  
                  url : "/chatting/json/addPerfectChatting" ,
                  type : "GET" ,
                  dataType : "json" ,
                  headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                  },
                  success : function(JsonData) {
                     //alert("성공");
                     
                     popWin = window.open("/chatting/getPerfectMatching.jsp","popWin", " width=800, height=950, scrollbars=1");
                     
                                    },//success
                     error: function () {
                        alert("error");
                     },
                     complete: function () {                
                       //alert("complete");
                     }
                  
               });//ajax 끝
            }//type 확인
         }//grade확인
         
      } 
      
   }
   
   
   $(function() {
      $( "#telepathy" ).on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         getTelepathyTest();
      });
      $( "#perfect" ).on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         
   
         getPerfectChatting();
      });
      
      
     
      
      
      
   });
  
   </script>
<!-- //All js -->
   
   
   <style>
      .topImg {
    max-width: 100%;
    height: 400px;
    background-image: url(/resources/images/background/mainChatting.jpg);
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
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
article {
    width: 50%;
    padding: 10px;
}
li{
		list-style-type : none;
	}

.smallNavi{
		overflow : hidden;
		float : right;
		margin-top : -80px;
		margin-bottom : 60px;
	}
	
	.smallNavi li{
		float : left;
		margin-right : 20px;
		margin-top : 8em;
	}
   </style>

</head>

<body>   
   <!-- header -->
   <jsp:include page="/layout/header.jsp" />
   <!-- //header -->
<!-- 메인배경이미지 : start -->
   	<div class="topImg">
		<h1>우연과 인연</h1>
	</div>
	<!-- 메인배경이미지 : end -->
	<div class="container">
        <ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>채팅</li>
			
		</ul>
          <!-- Community start -->
         <section id="three" class="wrapper align-center">
         <!-- 페이지 내부 네비게이션 경로 : start -->
		
		<!-- 페이지 내부 네비게이션 경로 : end -->
            <div class="inner">
               <div class="flex flex-2">
                  <article>
                     <div class="image fit" >
             
                      <img src="/resources/images/chatting/random.jpg" style=" height: auto;" alt="Pic 01">
                      </div>
                      <header>
                        <h3>랜덤채팅</h3>
                      </header>
                        <p>이성과 랜덤채팅 기능을 제공합니다.</p>
                       
                     <footer>
                        <a href="#" class="button" role="button" id="telepathy">참여하기</a>
                     </footer>
                  </article>
                  
                  
                  <article>
                     <div  class="image fit" >
             
                      <img src="/resources/images/chatting/perfect.jpg" style="  height: auto;" alt="Pic 01">
                       </div>
                       <header>
                       	<h3>이상형채팅</h3>
                       </header>
                        <p>성격유형을 이용한 랜덤채팅 기능을 제공합니다.</p>
                
                     <footer>
                        <a href="#" class="button" role="button" id="perfect">참여하기</a>
                     </footer>
                  </article>
               </div>
            </div>
         </section>
         <!-- Community end -->
        </div>
   <!-- //contents -->
   
   
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

   <!-- footer -->
   <jsp:include page="/layout/footer.jsp" />
   <!-- //footer -->
   
   
   
</body>
</html>