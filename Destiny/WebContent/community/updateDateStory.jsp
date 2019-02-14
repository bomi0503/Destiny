<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>


<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >

<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			$("#loading").hide();
		});
		
		$(document).ready(function(){
			
			$("#summernote").summernote({ //summernote를 사용하기 위한 선언
				placeholder : '내용을 입력해주세요.',
				height : 400,
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor, welEditable){
						data = new FormData();
						data.append("file", files[0]);
						
						var $note = $(this);
						$.ajax({
							data : data,
							type : "POST",
							url : '/date/json/imgUpload',
							cache : false,
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(url){
								console.log("url : "+url)
								while(true){
									var re = doesFileExist(url);
									console.log("re : "+re)
									if(re){
										$note.summernote('insertImage', url);
										break;
									}
								}
							}
						});
					}	
				}
			});
		});
		
		function doesFileExist(urlToFile){
			var xhr = new XMLHttpRequest();
			xhr.open('HEAD', urlToFile, false);
			xhr.send();
			
			if (xhr.status == "404") {
				return false;
			} else {
				return true;
			}
		}
		
		$("#save").on("click",function(){
			fncUpdatecommunity();
		});
		
		function fncUpdatecommunity() {
					
			var name = $("input[name=title]").val();
			var detail = $("textarea[name=detail]").val();
	
			if (name == null || name.length < 1) {
				alert("제목을 입력해주세요.");
				return false;
			}
			if (detail == null || detail.length < 1) {
				alert("내용을 입력해주세요.");
				return false;
			}
			
			$("form").attr("method","POST").attr("action","/date/updateDateStory?communityNo=${community.communityNo}").submit();
		}
		
	});
</script>
<style>
	#loading {
		 width: 100%;  
		 height: 100%;  
		 top: 0px;
		 left: 0px;
		 position: fixed;  
		 display: block;  
		 opacity: 0.7;  
		 background-color: #fff;  
		 z-index: 99;  
		 text-align: center; 
	} 
	  
	#loading-image {  
		 position: absolute;  
		 top: 50%;  
		 left: 50%; 
		 z-index: 100; 
	}
	.representImg{
		margin-top : 1em;
		width : 25%;
		height : 20em;
		padding : 1em;
		text-align : center;
		border : 1px solid #a9a9a9;
		border-radius : 5px;
	}
	.representImg img{
		width : 80%;
	}
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/dateStoryBackground.jpg");
		background-position : center center;
		background-size : cover;
		background-repeat : no-repeat;
	}
	.topImg::after{
		content : "";
		background : rgba(0, 0, 0, 0.2);
		position : absolute;
		top : 0;
		left : 0;
		width : 100%;
		height : 400px;
	}
	.topImg h1{
		position : absolute;
		width : 100%;
		margin : 0;
		padding : 0;
		font-family: 'Nanum Myeongjo', serif;
		font-size : 60px;
		text-align : center;
		height : 400px;
		line-height : 450px;
		color : white;
		z-index : 99;
		
	}
	h1 .slim{font-weight : lighter;}
	
	.smallNavi{
		overflow : hidden;
		float : right;
	}
	
	.smallNavi li{
		float : left;
	}
	.updateForm{
		padding : 60px 0 10em 0;
	}
	
	
	/* 빵메뉴 안맞아서 따로 만듬^^ */
	.fa{
		line-height : 50px;
	}
</style>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="topImg">
		<h1>만남후기</h1>
	</div>
	
	<div class="container">
		
		<!-- <ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>스토리</li>
			<li>></li>
			<li>만남후기</li>
		</ul> -->
		
		<div class="updateForm">
		
			<form enctype="multipart/form-data">
				
				<!-- 수정페이지에서 업데이트 컨트롤러로 보내는 데이터 : start -->
				<input type="hidden" name="writerId" value="${ community.writerId }">
				<input type="hidden" name="category" value="${ community.category }">
				<input type="hidden" name="userGrade" value="${ community.userGrade }">
				<input type="hidden" name="writerNickName" value="${ community.writerNickName }">
				<input type="hidden" name="views" value="${ community.views }">
				<input type="hidden" name="like" value="${ community.like }">
				<input type="hidden" name="importRank" value="${ community.importRank }">
				<input type="hidden" name="viewCondition" value="${ community.viewCondition }">
				<!-- 수정페이지에서 업데이트 컨트롤러로 보내는 데이터 : end -->
				
				<div class="form-group">
				
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" value="${ community.title }">
					
				</div>
				
				<div class="form-group">
				
					<label for="title">대표이미지</label>
					<input type="file" name="uploadFile" class="form-control">
					<div class="representImg">
						<img src="/resources/images/uploadImg/${community.fileName }">
					</div>
					
				</div>
			
				<div class="form-group">
				
					<textarea id="summernote" name="detail">${ community.detail }</textarea>
					
				</div>
				
				<div class="form-group text-center">
				
					<button type="button" class="" id="save">확인</button>
					
				</div>
				
			
			</form>
				
		</div>
	
	</div>
	
	<div id="loading">
		<img id="loading-image" src="../resources/images/loading.gif" alt="loading">
	</div>
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
</body>
</html>