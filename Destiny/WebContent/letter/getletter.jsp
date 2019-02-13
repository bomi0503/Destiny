<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 //$("form").attr("method" , "POST").attr("action" , "/user/sendLetter").submit();
			 var sender = $("input[id='sender']").val();
			 
			 self.location = "/letter/sendLetterView/"+sender;
		});
	});
	
	
	</script>
	
</head>


<body>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
   		<h1 class="bg-primary text-center">������ȸ</h1>
   	
   		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		    <label for="receiverId" class="col-sm-offset-1 col-sm-3 control-label">������ID</label>
		    <div class="col-sm-4">
		        ${letter.receiverId}
		    </div> 
		 </div>
		 
		 <div class="form-group">
		    <label for="receiverId" class="col-sm-offset-1 col-sm-3 control-label">�߽���ID</label>
		    <div class="col-sm-4">
		        ${letter.senderId}
		        <input type="hidden" id="sender" value="${letter.senderId}">
		    </div> 
		 </div>
		 
		 <div class="form-group">
		    <label for="letterTitle" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4">
		        ${letter.letterTitle}
		      <span id="letterTitle"></span>
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      ${letter.letterDetail}
		    </div>
		 </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     <c:if test="${me.userId eq letter.receiverId}">	
		     	 <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
		     </c:if>
		     <c:if test="${from eq 'getList'}">
			  <a class="btn btn-primary btn" href="/letter/getLetterList" role="button">��&nbsp;��</a>
			  </c:if>
			  <c:if test="${from eq 'sendList'}">
			   <a class="btn btn-primary btn" href="/letter/sendLetterList" role="button">��&nbsp;��</a>
			  </c:if>
		    </div>
		  </div>

	   </form>
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
		  
	
</body>
</html>

