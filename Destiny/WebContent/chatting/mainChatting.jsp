<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
<!-- All CSS Insert -->

<!-- //All CSS Insert -->

<!-- All js -->
   <!--  ���ø� ����ϱ� ���� �ʿ��� js -->
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
         alert("�α��� �� �̿� �����մϴ�.");
         $("#my-dialog,#dialog-background").toggle();
      }else if (userGrade=='BLK') {
    	  alert("�Ϲ�ȸ�� �̻���� �̿� �����մϴ�.");
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
                  //alert("����");
                  
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
      //////////////�α��� ��� �۵� ���ɽ�
       if (userId=="") {
         alert("�α��� �� �̿� �����մϴ�.");
         $("#my-dialog,#dialog-background").toggle();
      }else {
         if (userGrade=='NEW' || userGrade=='BLK') {
            alert("�Ϲ�ȸ�� �̻���� �̿� �����մϴ�.");
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
                     //alert("����");
                     
                     popWin = window.open("/chatting/getPerfectMatching.jsp","popWin", " width=800, height=950, scrollbars=1");
                     
                                    },//success
                     error: function () {
                        alert("error");
                     },
                     complete: function () {                
                       //alert("complete");
                     }
                  
               });//ajax ��
            }//type Ȯ��
         }//gradeȮ��
         
      } 
      
   }
   
   
   $(function() {
      $( "#telepathy" ).on("click" , function() {
          //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         getTelepathyTest();
      });
      $( "#perfect" ).on("click" , function() {
          //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         
   
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
<!-- ���ι���̹��� : start -->
   	<div class="topImg">
		<h1>�쿬�� �ο�</h1>
	</div>
	<!-- ���ι���̹��� : end -->
	<div class="container">
        <ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>ä��</li>
			
		</ul>
          <!-- Community start -->
         <section id="three" class="wrapper align-center">
         <!-- ������ ���� �׺���̼� ��� : start -->
		
		<!-- ������ ���� �׺���̼� ��� : end -->
            <div class="inner">
               <div class="flex flex-2">
                  <article>
                     <div class="image fit" >
             
                      <img src="/resources/images/chatting/random.jpg" style=" height: auto;" alt="Pic 01">
                      </div>
                      <header>
                        <h3>����ä��</h3>
                      </header>
                        <p>�̼��� ����ä�� ����� �����մϴ�.</p>
                       
                     <footer>
                        <a href="#" class="button" role="button" id="telepathy">�����ϱ�</a>
                     </footer>
                  </article>
                  
                  
                  <article>
                     <div  class="image fit" >
             
                      <img src="/resources/images/chatting/perfect.jpg" style="  height: auto;" alt="Pic 01">
                       </div>
                       <header>
                       	<h3>�̻���ä��</h3>
                       </header>
                        <p>���������� �̿��� ����ä�� ����� �����մϴ�.</p>
                
                     <footer>
                        <a href="#" class="button" role="button" id="perfect">�����ϱ�</a>
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