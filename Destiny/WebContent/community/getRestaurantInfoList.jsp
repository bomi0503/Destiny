<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�츮���� �����</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script src="/resources/javascript/jquery.min.js"></script>
<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">



</head>



<script type="text/javascript">

var userId = "${me.userId}";
console.log("userId : "+userId);

/* function fncGetList(currentPage){
	$("#currentPage").val(currentPage)
	$("form").attr("method","POST").attr("action","/info/listRestaurantInfo").submit();
} */


$(function() {
	
	
	/* ���ѽ�ũ�� : start */
	var currentPage = 0;
	
	function fncNextList(searchCondition, searchKeyword){
		console.log("fncNextList�޼ҵ�δ� ����?")
		currentPage++;
		$.ajax({
			url : "/info/json/listRestaurantInfo",
			method : "post",
			async : false,
			dataType : "json",
			data : JSON.stringify({
				currentPage : currentPage,
				searchCondition : searchCondition,
				searchKeyword : searchKeyword
			}),
			headers : {
				"Accept" : "application/json",
				"Content-type" : "application/json"
			},
			success : function(JSON){
				var list = "";
				for ( var i in JSON.list) {
					var community = JSON.list[i];
					var title = community.title;
					console.log("writeDate : "+community.writeDate);
					list += '<div class="col-sm-6 col-md-4 giyong">';
					list += '<div class="thumbnail headline" data-param="'+community.communityNo+'">';
					list += '<div style="width:100%;height:300px;background:url(\'../resources/images/uploadImg/'+community.fileName+'\');background-size:cover;background-position : center center;"></div>';
					list += '<div class="caption">';
					if (title.length > 6) {
						title = title.substring(0,8)+"..."
						console.log(":: 6long : "+title);
						list += '<h3 class="tumTitle">'+title+'</h3>';
					} else {
						console.log(":: short : "+title);
						list += '<h3 class="tumTitle">'+title+'</h3>';
					}
					/* list += '<h3 class="tumTitle">'+community.title+'</h3>'; */
					list += '<p>'+community.writeDate+'</p>';
					list += '<ul class="infoFirst">';
					list += '<li>'+community.writerNickName+'</li>';
					list += '<li><span>��ȸ��</span> : '+community.views+'</li>';
					list += '</ul>';
					list += '<ul class="infoSecond">';
					if(community.userGrade == 'NEW'){
						list += '<li>�ű�ȸ��</li>';	
					}
					if(community.userGrade == 'NOR'){
						list += '<li>�Ϲ�ȸ��</li>';	
					}
					if(community.userGrade == 'VIP'){
						list += '<li>���ȸ��</li>';	
					}
					if(community.userGrade == 'ADM'){
						list += '<li>������</li>';	
					}
					list += '<li><span>������</span> : '+community.like+'</li>';
					list += '</ul></div></div></div>';
				}
				
				/* $(".rowList").html($(".rowList").html()+list); */
				
				$(".rowList").html($(".rowList").html()+list);
				/* $(".giyong").hide();
				$(".giyong").fadeIn(1000); */
				
				init();
			}
		});
	}
	
	/* ����� Ŭ�� : start */
	function init(){
		$(".thumbnail").on("click", function(){
			if(userId == ""){
				$("#my-dialog,#dialog-background").toggle();
			}
			else{
				var communityNo = $(this).data("param")
				self.location="/info/getRestaurantInfo?communityNo="+communityNo	
			}
		});
	};
	/* ����� Ŭ�� : end */
	
	$(function(){
		while ($(document).height()==$(window).height() && currentPage < $("input:hidden[name='maxPage']").val()) {
			fncNextList();
		}
	});
	
	$(window).scroll(function(){
		if (currentPage < $("input:hidden[name='maxPage']").val()) {
			if ($(window).scrollTop()==$(document).height()-$(window).height()) {
				var searchCondition = $('select[name=searchCondition]').val();
				var searchKeyword = $('#searchKeyword').val();
				fncNextList(searchCondition, searchKeyword);
			}
		}
	});
	/* ���ѽ�ũ�� : end */
	
	$("#searchKeyword").keypress(function(e) {
		if(e.which == 13) {
			$(this).blur();
			$(".button:contains('�˻�')").focus().trigger('click');
			return false;
		}
	});
	
	/* �˻� ��ư : start */
	$(".button:contains('�˻�')").on("click", function(){
		var searchCondition = $('select[name=searchCondition]').val();
		var searchKeyword = $('#searchKeyword').val();
		alert("searchCondition : "+searchCondition);
		alert("searchKeyword : "+searchKeyword);
		currentPage = 0;
		$(".rowList").empty();
		fncNextList(searchCondition, searchKeyword);
	});
	/* �˻� ��ư : end */
	
	/* �۾��� ��ư : start */
	$("button:contains('�۾���')").on("click", function() {
		if(userId == ""){
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			self.location = "/info/addRestaurantInfo"	
		}
	});
	/* �۾��� ��ư : end */
	
	/////////////�Ʒ��� ����Ʈ��////////////////////////////�Ʒ��� ����Ʈ��////////////////////////////�Ʒ��� ����Ʈ��///////////////
	
	/* ���� ���� : start*/
	/* $('.sort-control').change(function(){
		alert("���� ����!");
		var state = $('.sort-control option:selected').val();
		self.location="/info/listRestaurantInfo?searchSortingOption="+state+"&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"					
	}); */
	/* ���� ���� : end */
		
	/* �� ���� ���콺 ���� : start */
	/* $(".getRestaurantLink").on("mouseover",function(){
		$(".getRestaurantLink").css("cursor","pointer")
	}); */
	/* �� ���� ���콺 ���� : end */
	
	/* �� ���� Ŭ�� : start */
	/* $(".getRestaurantLink").on("click", function(){
		if(userId == ""){
			alert("�α��� �� �̿� �����մϴ�.");
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			var communityNo = $(this).data("param")
			self.location="/info/getRestaurantInfo?communityNo="+communityNo	
		}
	}); */
	/* �� ���� Ŭ�� : end */
		
	/* ��ȸ�� Ŭ�� : start */
	/* $("th:contains('��ȸ')").on("click", function(){
		self.location="/info/listRestaurantInfo?viewSort=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"
	}); */
	/* ��ȸ�� Ŭ�� : end */
	
	/* ������ Ŭ�� : start */
	/* $("th:contains('����')").on("click", function(){
		self.location="/info/listRestaurantInfo?likeSort=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"
	}); */
	/* ������ Ŭ�� : end */
	
	/* �۹�ȣ Ŭ�� : start */
	/* $("th:contains('�۹�ȣ')").on("click", function(){
		self.location="/info/listRestaurantInfo?noSort=1&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"
	}); */
	/* �۹�ȣ Ŭ�� : end */
	
});

</script>
<style>
	body{
		position : relative;
		font-family: 'Nanum Myeongjo', serif;
	}
	.container{
		font-weight : 700;
	}
	.tumTitle{
		font-weight : 700;
	}
	.button{
		font-size : 16px;
		font-weight : 700;
	}
	/* .topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/getRestaurantInfo07_background.jpg");
		background-repeat : no-repeat;
		background-position : center -400px;
		background-size : cover;
		width : 100%;
		height : 400px;
	} */
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/getRestaurantInfo_background.jpg");
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
	/* .topImg h1{
		position : absolute;
		line-height : 330px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
		font-family: 'Nanum Myeongjo', serif;
	} */
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
	h1 .slim{
		font-weight : lighter;
	}
	
	li{
		list-style-type : none;
	}
	
	/*  .container{
		overflow : hidden;
	} */
	
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
	
	.homeImg{
		margin-top : -2px;
	}
	
	.viewSort{
		cursor : pointer;
	}
	
	.likeSort{
		cursor : pointer;
	}
	
	.noSort{
		cursor : pointer;
	}
	
	.thumbnail{
		cursor : pointer;
		padding : 20px;
	}
	
	.tumTitle{
		text-align : center;
	}
	
	.infoFirst, .infoSecond{
		overflow : hidden;
		padding-left : 0;
	}
	
	.infoFirst li, .infoSecond li{
		float : left;
	}
	
	.infoFirst li:last-child, .infoSecond li:last-child{
		float : right;
	}
	
	.caption p{
		text-align : center;
	}
	form{
		/* padding-top : 5em; */
		content:"";
		display:block;
		clear:both;
	}
	.search-group{
		text-align : right;
		width : 800px;
		float : right;
	}
	select{
		width : 20%;
		font-family: 'Nanum Myeongjo', serif;
		font-weight : 700;
		float:left;
		margin-right : 1em;
		margin-top : 5px;
	}
	#searchKeyword{
		width : 50%;
		float:left;
		margin-top : 5px;
	}
	.filter{
		width : 50%;
		overflow : hidden;
		float : right;
	}
	.filter .searchCondition{
		width : 21%;
	}
	.filter button{
		float : right;
	}
	
	
	/* ���޴� �ȸ¾Ƽ� ���� ����^^ */
	.fa{
		line-height : 50px;
	}
</style>
	


<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->

    <!-- ���ι���̹��� : start -->
   	<div class="topImg">
		<h1>��������</h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<div class="container">
	
		<div class="wrap">
		
		<!-- ������ ���� �׺���̼� ��� : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>���丮</li>
			<li>></li>
			<li>��������</li>
		</ul>
		<!-- ������ ���� �׺���̼� ��� : end -->
		
		<form>
			<div class="filter">
			    <select class="searchCondition" name="searchCondition" >
					<option value="0"
						${ !empty search.searchCondition && search.searchCondition=="0" ? "selected" : ""}>�������� �˻�</option>
					<option value="1"
						${ !empty search.searchCondition && search.searchCondition=="1" ? "selected" : ""}>�ۼ��ڷ� �˻�</option>
				</select>
			    <label class="sr-only" for="searchKeyword">�˻���</label>
				<input type="text" id="searchKeyword" name="searchKeyword"  placeholder="�˻�� �Է����ּ���."
			    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }" autocomplete=off>
				<button type="button" class="button">�˻�</button>
				  
				<!-- PageNavigation ���� ������ ���� ������ �κ� -->
				<input type="hidden" id="currentPage" name="currentPage" value="">
				
			</div>
			
			<div class="form-group text-left">
				<button type="button" class="button">�۾���</button>
			</div>
			
		</form>
	
		<input type="hidden" name="maxPage" value="${resultPage.maxPage }">
		
		<%-- <div class="form-group">
			<select class="sort-control" name="searchCondition" >
				<option value="0"
					${ !empty search.searchSortingOption && search.searchSortingOption=="0" ? "selected" : ""}>�ֽ� �Խù� ��</option>
				<option value="1"
					${ !empty search.searchSortingOption && search.searchSortingOption=="1" ? "selected" : ""}>��ȸ�� ��</option>
				<option value="2"
					${ !empty search.searchSortingOption && search.searchSortingOption=="2" ? "selected" : ""}>������ ��</option>
				<option value="3"
					${ !empty search.searchSortingOption && search.searchSortingOption=="3" ? "selected" : ""}>���� �Խù� ��</option>
			</select>
		</div> --%>
		
		<!-- <div class="form-group text-left">
			<button type="button" class="button">�۾���</button>
		</div> -->
		
		<!-- ����� ����Ʈ : start -->
		<%-- <div class="row">
		<c:set var="i" value="0"/>
			<c:forEach var="community" items="${list}">
			<c:set var="i" value="${i+1}"/>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail" data-param="${ community.communityNo }">
					<img src="../resources/images/uploadImg/${community.fileName}" alt="��ǥ�̹���">
				    <div class="caption">
				    	<h3 class="tumTitle">${community.title}</h3>
				    	<p>${community.writeDate}</p>
				    	<ul class="infoFirst">
				    		<li>${community.writerNickName }</li>
				    		<li><span>��ȸ��</span> : ${community.views }</li>
				    	</ul>
				    	<ul class="infoSecond">
				    		<c:if test="${community.userGrade == 'NEW'}">
				    			<li>�ű�ȸ��</li>
				    		</c:if>
				    		<c:if test="${community.userGrade == 'NOR'}">
				    			<li>�Ϲ�ȸ��</li>
				    		</c:if>
				    		<c:if test="${community.userGrade == 'VIP'}">
				    			<li>���ȸ��</li>
				    		</c:if>
				    		<c:if test="${community.userGrade == 'ADM'}">
				    			<li>������</li>
				    		</c:if>
				    		<li><span>������</span> : ${community.like }</li>
				    	</ul>
				    </div>
				</div>
			</div>
		</c:forEach>
		</div> --%>
		
		<div class="rowList"></div>
		
		<!-- ����� ����Ʈ : end -->
		
		<!-- ���̺� ����Ʈ : start -->
		<%-- <table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th aligin="center" class="noSort">�۹�ȣ��</th>
					<th aligin="center">����</th>
					<th aligin="center">�ۼ���</th>
					<th aligin="center">�ۼ���</th>
					<th aligin="center" class="viewSort">��ȸ��</th>
					<th aligin="center" class="likeSort">������</th>
				</tr>
			</thead>
			
			<tbody>
				<c:set var="i" value="0"/>
				<c:forEach var="community" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<tr>
						<td>
							<span>${community.communityNo }</span>
						</td>
						<td>
							<span class="getRestaurantLink" data-param="${ community.communityNo }">${community.title }</span>
						</td>
						<td>
							<span>${community.writerNickName }</span>
						</td>
						<td>
							<span>${community.writeDate }</span>
						</td>
						<td>
							<span>${community.views }</span>
						</td>
						<td>
							<span>${community.like }</span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table> --%>
		<!-- ���̺� ����Ʈ : end -->
	</div>
	
	<!-- PageNavigation : start -->
	
	<!-- PageNavigation : end -->
	
	</div>

</body>
</html>