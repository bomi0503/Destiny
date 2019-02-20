<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">
   .replyAreaCoComment{
      margin-left : 100px;
   }
   a:hover{
      cursor : pointer;
   }
   .userProfileImgWrap{
   	display : inline-block;
   	width : 70px;
   	height : 70px;
   	border-radius : 50px;
   }
   .replyContent p{
   	padding : 20px;
   }
</style>
<script type="text/javascript">

   var communityNo = ${community.communityNo}; //게시글 번호 
   
   $(function() {
      $(".commentInput").keypress(function(e) {
         if(e.which == 13) {
            $(this).blur();
            $('#save').focus().trigger('click');
            return false;
         }
      });
      
      $('#save').on("click",function(){ //댓글 등록 버튼 클릭시 
         console.log("communityNo : "+communityNo);
          //var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm의 내용을 가져옴
          
          replyInsert(); //Insert 함수호출(아래)
      });
   });
    
   //댓글 목록 : start
   function replyList(){
       $.ajax({
           url : '/comment/rest/getCommentList/'+communityNo,
           type : 'get',
          // data : {'postNo':postNo},
           success : function(JSONData){
                var a =''; 
                $.each(JSONData, function(i){
                  var list = JSONData[i];
                  if(list.commentNo != list.targetNo){
                     a += '<div class="replyAreaCoComment" style="border-bottom:1px solid darkgray; margin-bottom: 15px;padding:20px 0;">';
                  }else{
                     a += '<div class="replyArea'+list.commentNo+'" style="border-bottom:1px solid darkgray;padding:20px 0;">';
                  }
                   
                   a += '<div class="replyInfo'+list.commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+list.profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+list.commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
                   if($('#loginUserId').val() == list.commentWriterId){
                      a += '<a style="background:url(\'/resources/icon/edit.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyUpdate('+list.commentNo+',\''+list.commentDetail+'\', \''+list.commentWriterId+'\','+list.targetNo+',\''+list.profile+'\')"></a>';
                      a += '<a style="background:url(\'/resources/icon/delete.png\');background-size:cover;display:inline-block;width:25px;height:25px;" onclick="replyDelete('+list.commentNo+')"></a>';
                   }
                   if (list.commentNo == list.targetNo) {
                      a += '<a style="background:url(\'/resources/icon/comment.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-left:10px;" onclick="reReplyInsert('+list.commentNo+',\''+list.commentDetail+'\', \''+list.commentWriterId+'\','+list.targetNo+',\''+list.profile+'\')"></a></div></div>';
               }else{
                  a += '</div></div>';
               }
                   a += '<div class="replyContent"  name="'+list.commentNo+'"> <p style="padding-left:90px;">'+list.commentDetail+'</p>';
                   a += '</div></div>';
               });
               
               $(".commentInput").val('');
               
               $(".replyList").html(a); 
           }
       });
   }
   //댓글 목록 : end
    
   //댓글 등록 : start
   function replyInsert(){
      
       $.ajax({
           url : '/comment/rest/addComment/'+communityNo,
           type : 'post',
           data : JSON.stringify({
                    commentWriterId : $('#loginUserId').val(), //하드코딩 수정
                    commentComuNo : communityNo,
                    commentDetail : $('[name=commentDetail]').val()
                    }),
           dataType:"json",
          headers:{
                      "Accept":"application/json",
                      "Content-Type": "application/json"
                   },
           success : function(data){
               if(data == 1) {
                   replyList(); //댓글 작성 후 댓글 목록 reload
               }
           }
       });
   }
   //댓글 등록 : end
   
   //대댓글 등록
   function reReplyText(targetNo, commentWriterId){
       $.ajax({
           url : '/comment/rest/addReComment/'+targetNo,
           type : 'post',
           data : JSON.stringify({
                    targetNo : targetNo,
                    commentWriterId : $('#loginUserId').val(), //하드코딩 수정
                    commentComuNo : communityNo,
                    commentDetail : $('#commentDetail').val()
                    }),
            dataType:"json",
              headers:{
                          "Accept":"application/json",
                          "Content-Type": "application/json"
                       },
           success : function(data){
               if(data == 1) {
                   replyList(); //댓글 작성 후 댓글 목록 reload
               }
           }
       });
   }
   
   //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
   function replyUpdate(commentNo, commentDetail, commentWriterId, targetNo, profile){
      
      var a ='';
      a += '<div style="padding : 20px;overflow:hidden;">';
      a += '<input style="float:left;width:88%;" type="text" name="content_'+commentNo+'" value="'+commentDetail+'" autocomplete=off/>';
      a += '<span><button style="float:right;" type="button" onclick="replyUpdateProc('+commentNo+');">수정</button> </span>';
      a += '</div>';
      $('.replyContent[name='+commentNo+']').html(a);
      
      var b = '';
      b += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
      b += '<a style="background:url(\'/resources/icon/return.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyUpdateCancel('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\');"></a></div>';
      $('.replyInfo'+commentNo+'').html(b);
   }
   
   //댓글 수정 취소 : start
   function replyUpdateCancel(commentNo, commentDetail, commentWriterId, targetNo, profile){
      var a = '';
         a += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
          a += '<a style="background:url(\'/resources/icon/edit.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyUpdate('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\')"></a>';
          a += '<a style="background:url(\'/resources/icon/delete.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyDelete('+commentNo+')"></a>';
          /* 대댓글이면 수정 취소 했을 때 답글 달기가 노출 되면 안됨 */
          /* 댓글번호 == 타겟번호 노출
          댓글번호 != 타겟번호 노출안됨 */
          if (commentNo == targetNo) {
             a += '<a style="background:url(\'/resources/icon/comment.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="reReplyInsert('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\')"></a></div>';   
      }else{
         a += '</div>';
      }
          $('.replyInfo'+commentNo+'').html(a);
      
      var b ='';
         b += '<p style="padding-left:90px;">'+commentDetail+'</p>';
         $('.replyContent[name='+commentNo+']').html(b);
   }
   //댓글 수정 취소 : end
   
   //대댓글 작성 취소 : start
   function reReplyUpdateCancel(commentNo, commentDetail, commentWriterId, targetNo, profile){
      var a = '';
         a += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
         if($('#loginUserId').val() == commentWriterId){
           a += '<a style="background:url(\'/resources/icon/edit.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyUpdate('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\')"></a>';
           a += '<a style="background:url(\'/resources/icon/delete.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyDelete('+commentNo+')"></a>';
        }
          a += '<a style="background:url(\'/resources/icon/comment.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="reReplyInsert('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\')"></a></div>';
          $('.replyInfo'+commentNo+'').html(a);
      
         $('.replyContent[name='+commentNo+'] > div').empty();
   }
   //대댓글 작성 취소 : end
   
   //대댓글 달기 - 댓글 내용 출력에 input 폼 추가
   function reReplyInsert(commentNo, commentDetail, commentWriterId, targetNo, profile){
      var a ='';
       a += '<div style="overflow:hidden;">';
       a += '<input style="width:85%;float:left;" type="text" class="coCoInput" id="commentDetail" name="commentDetail" autocomplete="off"/>';
       /* onclick="reReplyText('+commentNo+',\''+commentWriterId+'\');" */
       a += '<span><button style="float:right" id="coComentIn" type="button" onclick="reReplyText('+commentNo+',\''+commentWriterId+'\');">답글등록</button> </span>';
       a += '</div>';
       
         // $('.replyContent'+cno).html(a);
       $('.replyContent[name='+commentNo+']').append(a);
       
       var b = '';
      b += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
       b += '<a style="background:url(\'/resources/icon/return.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="reReplyUpdateCancel('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\');"></a></div>';
      $('.replyInfo'+commentNo+'').html(b);
       
   }
    
   //댓글 수정
   function replyUpdateProc(commentNo){
       var updateContent = $('[name=content_'+commentNo+']').val();
       
       $.ajax({
           url : '/comment/rest/updateComment',
           type : 'post',
           data : {'commentDetail' : updateContent, 'commentNo' : commentNo},
           success : function(data){
               if(data == 1) replyList(); //댓글 수정후 목록 출력 
           }
       });
   }
    
   //댓글 삭제 
   function replyDelete(commentNo){
       $.ajax({
           url : '/comment/rest/deleteComment/'+commentNo,
           type : 'get',
           success : function(data){
               if(data == 1) replyList(); //댓글 삭제후 목록 출력 
           }
       });
   }
   
   $(document).ready(function(){
       replyList(); //페이지 로딩시 댓글 목록 출력 
   });
   
</script>

<style>
   .commentWrap{
      margin-top : 40px;
      padding : 20px;
      /* background-color : #fffced; */
      border : 1px solid #ffc6cf;
      
   }
   
   .commentForm{
      overflow : hidden;
      width : 100%;
      padding-bottom : 1em;
   }
   
      .commentForm .commentInput{
         width : 88%;
         float : left;
      }
   
      .commentForm .commentSave{
         float : right;
      }
</style>

</head>
<body>
   
   <div class="commentWrap">
      
   <form>
      
      <div class="commentForm">
         <input type="text" class="commentInput" name="commentDetail" placeholder="댓글을 입력해주세요" autocomplete=off>
         <button type="button" class="commentSave" id="save">등록</button>
         <input type="hidden" id="loginUserId" name="userId" value="${ me.userId }">
         <input type="hidden" id="nickName" name="nickName" value="${ me.nickName }">
      </div>
      
        <div class="replyList"></div>
           
   </form>
   </div>
      
   

</body>
</html>