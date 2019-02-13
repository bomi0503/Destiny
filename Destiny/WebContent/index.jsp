<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>

<!-- All js -->
<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>
<!-- //All js -->

<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet"> 

<!-- //All CSS Insert -->
</head>

   <script>
   
   var userId = "${me.userId}";
   
   $(function(){
      
      var currentPage = 0;
      
      fncNextList();
      
      function fncNextList(){
         currentPage++;
         $.ajax({
            url : "/date/json/index/listDateStory",
            method : "post",
            async : false,
            dataType : "json",
            data : JSON.stringify({
               currentPage : currentPage
            }),
            headers : {
               "Accept" : "application/json",
               "Content-type" : "application/json"
            },
            success : function(JSON){
               var list = "";
               for (var i = 0; i < 3; i++) {
                  var community = JSON.list[i];
                  /* alert("communityNo : "+community.communityNo); */
                  list += '<article style="text-align : center;"><div style="display:inline-block;width : 300px; height : 300px; border-radius : 100%; background : url(\'resources/images/uploadImg/'+community.fileName+'\'); background-size : cover; box-shadow : 0px 15px 15px -4px rgba(229, 66, 93, 0.7);border : 3px solid white;">';
                  /* list += '<img src="resources/images/uploadImg/'+community.fileName+'" alt="title_img" />'; */
                  list += '</div>';
                  list += '<header><h3 style="color : white">'+community.title+'</h3></header>';
                  list += '<footer><a href="#" class="button" data-param="'+community.communityNo+'">보기</a></footer></article>';
               }
               
               $(".story-wrap").html($(".story-wrap").html()+list);
               
               init();
            }
         });
         
      }
      
      function init(){
         $("a[href='#' ]:contains('보기')").on("click", function(){
            if(userId == ""){
               $("#my-dialog,#dialog-background").toggle();
            }
            else{
               var communityNo = $(this).data("param")
               alert("comNo : "+communityNo);
               self.location="/date/getDateStory?communityNo="+communityNo   
            }
         });
      };
      
      $(".move_meeting").on("click", function() {
         self.location = "/meeting/listMeeting"
      });
      $(".move_place").on("click", function() {
         self.location = "/find/mainFind"
      });
      $(".move_chatting").on("click", function() {
         self.location = "/chatting/mainChatting"
      });
      $(".move_mbti").on("click", function() {
         if (userId == "") {
            $("#my-dialog,#dialog-background").toggle();
         }else{
            self.location = "/user/addTypeView/"+userId   
         }
      });      
   });
   
   (function(d, s, id){
       var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) {return;}
       js = d.createElement(s); js.id = id;
       js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
       fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'frogue-embed'));
   </script>

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR|Pacifico');

video{
   position : absolute;
   top : 0;
   left : 0;
   min-width : 100%;
   z-index : -1;
}

#linkmove{
   padding : 0 0 8em 0;
}

   #linkmove .flex div{
      border : 2px solid #ffbcc7;
      /* background : #ffbcc7; */
      border-radius : 25px;
      width : 23%;
      height : 17em;
      transition: 1s;
   }
   #linkmove .flex div:hover{
      box-shadow: 15px 15px 0px 0px #ffbcc7;
      transform: translate(-5%, -5%);
      cursor : pointer;
   }
   #linkmove .flex span img{
      margin-top : 50px;
   }
   #linkmove .flex h3{
      font-family: 'Nanum Myeongjo', serif;
      /* padding-top : 4em; */
   }
   #linkmove h2{
      font-family: 'Pacifico';
      text-shadow : 3px 3px #ff264a;
      
   }
   #linkmove .special{
      font-size : 0.2em;
   }

#communitymove{
   /* background : #ff8a2c; */
   background : #ffbcc7;
}
   #communitymove h3{
      color : #ff264a;
      font-weight : bold;
      font-family: 'Nanum Myeongjo', serif;
   }
   #communitymove p{
      color : #3e3e3e;
   }
   #communitymove h2{
      font-family: 'Pacifico';
      margin-top : 0;
      color : #ff264a;
      text-shadow : 3px 3px white;
   }
   #communitymove .special{
      font-size : 0.2em;
   }

.ment{
   text-align : center;
}
article{
   padding:2em;
}
   
   .secondSection p{
      font-family: 'Nanum Myeongjo', serif;
   }
   
   .story-wrap{
      width : 100%;
      overflow : hidden;
   }
      .story-wrap article{
         float : left;
      }
         
@media screen and (max-width:1280px){
   .ment{
      display : none;
   }
}         
@media screen and (max-width:1180px){
   #linkmove .flex div{
      width : 48%;
      margin-bottom : 40px;
   }
}
@media screen and (max-width:650px){
   #linkmove .flex div{
      width : 100%;
   }
}      
</style>

<body>
   <!-- header -->
   <jsp:include page="/layout/header.jsp" />
   <!-- //header -->

   <!-- contents /////////////////////////////////////////////////////////////////// -->
   
   <!-- 메인 이미지부분 start -->
   <section id="banner">
      <video autoplay loop>
         <source src="/resources/images/background/spring.mp4" type="video/mp4">
      </video>
      
      <div class="ment">
         <p>첫번째 만남은 우연일지라도<br> 두번째 만남은 흘러갈지도 남을지도 모르는 인연이다.</p>
      </div>
            
   </section>
   <!-- 메인 이미지부분 end -->
   
   <!-- 링크이동 start -->
   <section id="linkmove" class="wrapper align-center">
      
      <h2>BEST<span class="special">●</span></h2>
      
      <div class="inner">
      
         <div id="frogue-container" class="position-right-bottom"
               data-color="#555a9c"
               data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
               data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
               data-init-key="value"
               ></div>
         
         <div class="flex secondSection">
         
            <div class="move_meeting">
               <span><img src="/resources/icon/meeting_icon.png"></span>
               <h3>모임</h3>
               <p>재미있는 모임을 찾아보세요.</p>
            </div>
            <div class="move_mbti">
               <span><img src="/resources/icon/mbti_icon.png"></span>
               <h3>MBTI</h3>
               <p>자신의 성향을 알아보세요.</p>
            </div>
            <div class="move_place">
               <span><img src="/resources/icon/place_icon.png"></span>
               <h3>주변 찾기</h3>
               <p>동네 친구를 만들어 보아요.</p>
            </div>
            <div class="move_chatting">
               <span><img src="/resources/icon/chatting_icon.png"></span>
               <h3>채팅</h3>
               <p>이상형과 대화해 보세요.</p>
            </div>

         </div>
      </div>
   </section>
   <!-- 링크이동 end -->
   
   <!-- Community start -->
   <section id="communitymove" class="wrapper align-center">
      
      <h2 style="display:block;">Popular Stroy<span class="special">●</span></h2>
   
      <div class="inner">
      
         <div class="flex flex-3">
            
            <form>
               <input type="hidden" id="currentPage" name="currentPage" value="">
            </form>
            
            <div class="story-wrap"></div>
         </div>
      </div>
   </section>
   <!-- Community end -->
      
   <!-- //contents//////////////////////////////////////////////////////////////// -->
   
   <!-- footer -->
   <jsp:include page="/layout/footer.jsp" />
   <!-- //footer -->
   
</body>
</html>