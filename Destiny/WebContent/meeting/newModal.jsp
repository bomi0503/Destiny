<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
   @import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR|Pacifico');
   
   .modal-join .avatar-forJoin img {
       width: 100%;
       margin-top: 5px;
   }
   
   .modal-join .avatar-forJoin {
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
   #my-dialog-forJoin {
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
   .modal-join {      
      color: #636363;
      width: 350px;
   }
   .modal-join .modal-content-forJoin {
      padding: 20px;
      border-radius: 5px;
      border: none;
      background-color: #fff;
   }
   .modal-join .modal-header2-froJoin {
      border-bottom: none;   
        position: relative;
        justify-content: center;
   }
   
   .modal-join h4 {
      text-align: center;
      font-size: 26px;
      margin: 30px 0 ;
   }
   .modal-join .form-control:focus {
      /* border-color: #70c5c0; */
   }
   .modal-join .form-control, .modal-join .btn3 {
      min-height: 40px;
      border-radius: 3px; 
   }
   .modal-join .close {
        position: absolute;
      top: -5px;
      right: -5px;
   }   
   .modal-join .modal-footer {
      background: #ecf0f1; /* #ecf0f1; */
      border-color: #dee4e7; /* #dee4e7 */
      text-align: center;
        justify-content: center;
      margin: 0 -20px -20px;
      border-radius: 5px;
      font-size: 13px;
   }
   .modal-join .modal-footer a {
      color: #999;
   }      
   .modal-join .avatar-forJoin {
      position: absolute;
      margin: 0 auto;
      left: 0;
      right: 0;
      top: -80px;
      width: 95px;
      height: 95px;
      border-radius: 50%;
      z-index: 9;
      /* background: #60c7c1; */
      padding: 15px;
      box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
      overflow: hidden;
   }
   .modal-join .avatar-forJoin img {
      width: 134%;
      height: 100px;
      position: absolute;
      top: -5px;
      left: -16px;
   }
   .modal-join.modal-dialog {
      margin-top: 80px;
   }
    .modal-join .btn3 {
        color: #fff;
        border-radius: 4px;
      /* background: #60c7c1; */
      text-decoration: none;
      transition: all 0.4s;
        line-height: normal;
        border: none;
    }

   .modal-join .btn3:hover, .modal-join .btn3:focus {
      /* background: #45aba6; */
      outline: none;
   }

</style>
<script type="text/javascript">
//////////============= 기능 연결 부 =============   
   $( function() {

   }); 
   </script>
<body>
   <div id="myModal-forJoin" >
      <div id="my-dialog-forJoin">
         <div class="modal-join">
            <div class="modal-content-forJoin">
               <div class="modal-header2-froJoin " style="height:50px">
                  <div class="avatar-forJoin">
                     <img src="/resources/images/userprofile/${sessionScope.me.profile}"  alt="Avatar">
                  </div>            
                  <div class="form-group col-sm-12 col-md-12" align="center">
        			<h4>${sessionScope.me.nickName}</h4>
        		  </div>
               </div>
               <div class="modal-body-forJoin">
                  <form id="dialog2form">
                     <div class="form-group" class="form-horizontal">
                        <input id="interviewTitle" type="text" class="" name="" placeholder="제목을 입력해주세요" >
                     </div>
                     <div class="form-group">
                        <textarea id="interview" class="" name="" placeholder="가입인사를 작성해주세요"></textarea>
                     </div>
                     <div class="form-group" align="center">
                        <button id="meetingJoin" type="submit" class="btn3">가입하기</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>      
      </div>   
      
      <div id="background"></div>
</body>