<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
		#dialog-background {
		    display: none;
		    position: fixed;
		    top: 0; left: 0;
		    width: 100%; height: 100%;
		    background: rgba(0,0,0,.3);
		    z-index: 10;
		}
		#my-dialog {
		    display: none;
		    position: fixed;
		    left: calc( 50% - 160px ); top: calc( 50% - 70px );
		    width: 320px; height: 250px; 
		    background: #fff;
		    z-index: 11;
		    padding: 10px;
		}
        
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		$(function(){
			$("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
				$("#my-dialog,#dialog-background").toggle();
			});
		});
	
		
		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#loginButton").on("click" , function() {
				var id=$("input[name='userId']").val();
				var pw=$("input[name='password']").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		//============= ȸ�� ã��===================
		
		$( function() { 
			$("#findButton").on("click" , function() {
				var userId = $("input[name='getUserId']").val();
				alert(userId);
				self.location = "/user/getUser/"+userId;
			});
		});
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  <!-- ToolBar End /////////////////////////////////////-->

	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
	   	 	
		
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			
	 	 	<div class="col-md-6">
	 	 		
	 	 		
		 	 	<button id="btn-open-dialog">â ����</button>

				<div id="my-dialog">
				   <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button id="loginButton" type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					    </div>
					  </div>
			
					</form>
				    <button id="btn-close-dialog">â �ݱ�</button>
				</div>
				<div id="dialog-background"></div>
						 	 	
				
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>