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

   var communityNo = ${community.communityNo}; //�Խñ� ��ȣ 
   
   $(function() {
      $(".commentInput").keypress(function(e) {
         if(e.which == 13) {
            $(this).blur();
            $('#save').focus().trigger('click');
            return false;
         }
      });
      
      $('#save').on("click",function(){ //��� ��� ��ư Ŭ���� 
         console.log("communityNo : "+communityNo);
          //var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm�� ������ ������
          
          replyInsert(); //Insert �Լ�ȣ��(�Ʒ�)
      });
   });
    
   //��� ��� : start
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
   //��� ��� : end
    
   //��� ��� : start
   function replyInsert(){
      
       $.ajax({
           url : '/comment/rest/addComment/'+communityNo,
           type : 'post',
           data : JSON.stringify({
                    commentWriterId : $('#loginUserId').val(), //�ϵ��ڵ� ����
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
                   replyList(); //��� �ۼ� �� ��� ��� reload
               }
           }
       });
   }
   //��� ��� : end
   
   //���� ���
   function reReplyText(targetNo, commentWriterId){
       $.ajax({
           url : '/comment/rest/addReComment/'+targetNo,
           type : 'post',
           data : JSON.stringify({
                    targetNo : targetNo,
                    commentWriterId : $('#loginUserId').val(), //�ϵ��ڵ� ����
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
                   replyList(); //��� �ۼ� �� ��� ��� reload
               }
           }
       });
   }
   
   //��� ���� - ��� ���� ����� input ������ ���� 
   function replyUpdate(commentNo, commentDetail, commentWriterId, targetNo, profile){
      
      var a ='';
      a += '<div style="padding : 20px;overflow:hidden;">';
      a += '<input style="float:left;width:88%;" type="text" name="content_'+commentNo+'" value="'+commentDetail+'" autocomplete=off/>';
      a += '<span><button style="float:right;" type="button" onclick="replyUpdateProc('+commentNo+');">����</button> </span>';
      a += '</div>';
      $('.replyContent[name='+commentNo+']').html(a);
      
      var b = '';
      b += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
      b += '<a style="background:url(\'/resources/icon/return.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyUpdateCancel('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\');"></a></div>';
      $('.replyInfo'+commentNo+'').html(b);
   }
   
   //��� ���� ��� : start
   function replyUpdateCancel(commentNo, commentDetail, commentWriterId, targetNo, profile){
      var a = '';
         a += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
          a += '<a style="background:url(\'/resources/icon/edit.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyUpdate('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\')"></a>';
          a += '<a style="background:url(\'/resources/icon/delete.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="replyDelete('+commentNo+')"></a>';
          /* �����̸� ���� ��� ���� �� ��� �ޱⰡ ���� �Ǹ� �ȵ� */
          /* ��۹�ȣ == Ÿ�ٹ�ȣ ����
          ��۹�ȣ != Ÿ�ٹ�ȣ ����ȵ� */
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
   //��� ���� ��� : end
   
   //���� �ۼ� ��� : start
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
   //���� �ۼ� ��� : end
   
   //���� �ޱ� - ��� ���� ��¿� input �� �߰�
   function reReplyInsert(commentNo, commentDetail, commentWriterId, targetNo, profile){
      var a ='';
       a += '<div style="overflow:hidden;">';
       a += '<input style="width:85%;float:left;" type="text" class="coCoInput" id="commentDetail" name="commentDetail" autocomplete="off"/>';
       /* onclick="reReplyText('+commentNo+',\''+commentWriterId+'\');" */
       a += '<span><button style="float:right" id="coComentIn" type="button" onclick="reReplyText('+commentNo+',\''+commentWriterId+'\');">��۵��</button> </span>';
       a += '</div>';
       
         // $('.replyContent'+cno).html(a);
       $('.replyContent[name='+commentNo+']').append(a);
       
       var b = '';
      b += '<div class="replyInfo'+commentNo+'" style="position:relative;"><div class="userProfileImgWrap" style="background : url(\'/resources/images/userprofile/'+profile+'\'); background-size : cover;"></div><span class="commenterId" style="position:absolute;top:20px;left:90px;">'+commentWriterId+'</span><div class="con" style="position:absolute;top:0;right:0;">';
       b += '<a style="background:url(\'/resources/icon/return.png\');background-size:cover;display:inline-block;width:25px;height:25px;margin-right:10px;" onclick="reReplyUpdateCancel('+commentNo+',\''+commentDetail+'\', \''+commentWriterId+'\','+targetNo+',\''+profile+'\');"></a></div>';
      $('.replyInfo'+commentNo+'').html(b);
       
   }
    
   //��� ����
   function replyUpdateProc(commentNo){
       var updateContent = $('[name=content_'+commentNo+']').val();
       
       $.ajax({
           url : '/comment/rest/updateComment',
           type : 'post',
           data : {'commentDetail' : updateContent, 'commentNo' : commentNo},
           success : function(data){
               if(data == 1) replyList(); //��� ������ ��� ��� 
           }
       });
   }
    
   //��� ���� 
   function replyDelete(commentNo){
       $.ajax({
           url : '/comment/rest/deleteComment/'+commentNo,
           type : 'get',
           success : function(data){
               if(data == 1) replyList(); //��� ������ ��� ��� 
           }
       });
   }
   
   $(document).ready(function(){
       replyList(); //������ �ε��� ��� ��� ��� 
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
         <input type="text" class="commentInput" name="commentDetail" placeholder="����� �Է����ּ���" autocomplete=off>
         <button type="button" class="commentSave" id="save">���</button>
         <input type="hidden" id="loginUserId" name="userId" value="${ me.userId }">
         <input type="hidden" id="nickName" name="nickName" value="${ me.nickName }">
      </div>
      
        <div class="replyList"></div>
           
   </form>
   </div>
      
   

</body>
</html>