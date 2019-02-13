<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�츮���� �����</title>


<!-- ���� : http://getbootstrap.com/css/   -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script src="/resources/javascript/skel.min.js"></script>
<script src="/resources/javascript/util.js"></script>
<script src="/resources/javascript/main.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

<script type="text/javascript">

var userId = "${me.userId}";
console.log("userId : "+userId);

var userGrade = "${me.userGrade}";
console.log("grade : "+userGrade);

function fncGetList(currentPage){
	$("#currentPage").val(currentPage)
	$("form").attr("method","POST").attr("action","/notice/listNotice").submit();
}


$(function() {
	
	$("#searchKeyword").keypress(function(e) {
		if(e.which == 13) {
			$(this).blur();
			$(".button:contains('�˻�')").focus().trigger('click');
			return false;
		}
	});
	
	/* �˻� ��ư : start */
	$(".button:contains('�˻�')").on("click", function(){
		fncGetList(1);
	});
	/* �˻� ��ư : end */
	
	if (userGrade == "ADM") {
		$("button:contains('�۾���')").show();
		/* �۾��� ��ư : start */
		$("button:contains('�۾���')").on("click", function() {
			if(userId == ""){
				$("#my-dialog,#dialog-background").toggle();
			}
			else{
				self.location = "/notice/addNotice"	
			}
		});
		/* �۾��� ��ư : end */
	}else{
		$("button:contains('�۾���')").hide();
	}
	
	
	
	/////////////�Ʒ��� ����Ʈ��////////////////////////////�Ʒ��� ����Ʈ��////////////////////////////�Ʒ��� ����Ʈ��///////////////
	
	/* ���� ���� : start*/
	$('.sort-control').on('change',function(){
		alert("���� ����!");
		var searchSortingOption = $('.sort-control option:selected').val();
		alert("searchSortingOption : "+searchSortingOption);
		fncGetList(1);					
	});
	/* ���� ���� : end */
		
	/* �� ���� ���콺 ���� : start */
	$(".getRestaurantLink").on("mouseover",function(){
		$(".getRestaurantLink").css("cursor","pointer")
	});
	/* �� ���� ���콺 ���� : end */
	
	/* �� ���� Ŭ�� : start */
	$(".getRestaurantLink").on("click", function(){
		if(userId == ""){
			$("#my-dialog,#dialog-background").toggle();
		}
		else{
			var communityNo = $(this).data("param")
			self.location="/notice/getNotice?communityNo="+communityNo	
		}
	});
	/* �� ���� Ŭ�� : end */
	
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
		background-image : url("/resources/images/background/notice02_background.jpg");
		background-repeat : no-repeat;
		background-position : center -500px;
		background-size : cover;
		width : 100%;
		height : 400px;
	} */
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/noticeBackground.jpg");
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
		width : 63%;
		text-align : right;
		content:"";
		display:block;
		clear:both;
		float : right;
	}
	select{
		width : 9em;
		font-family: 'Nanum Myeongjo', serif;
		font-weight : 700;
		margin-right : 1em;
		margin-top : 5px;
		float : left;
	}
	#searchKeyword{
		width : 50%;
		float:left;
		margin-top : 5px;
	}
	.filter{
		width : 100%;
		overflow : hidden;
		float : right;
		margin-bottom : 50px;
	}
	.filter .searchWrap{
		overflow : hidden;
		width : 50%;
		float : right;
	}
	.filter .searchCondition{
		width : 21%;
	}
	.filter button{
		float : right;
	}
	.filter .searchSortingOption{
		overflow : hidden;
		float : left;
		width : 160px;
	}
	
	
	/* ���޴� �ȸ¾Ƽ� ���� ����^^ */
	.fa{
		line-height : 50px;
	}
</style>
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/header.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
  	
  	
    
    <!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>����<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	<div class="container">
	
		<div class="wrap">
		
		<!-- ������ ���� �׺���̼� ��� : start -->
		<ul class="smallNavi">
			<li class="homeImg"><img alt="home" src="../resources/images/background/home.jpg"></li>
			<li>></li>
			<li>��������</li>
		</ul>
		<!-- ������ ���� �׺���̼� ��� : end -->
		
		<form>
			<div class="filter">
			
				<select class="sort-control searchSortingOption" name="searchSortingOption" >
					<option value="0"
						${ !empty search.searchSortingOption && search.searchSortingOption=="0" ? "selected" : ""}>�ֽ� �Խù� ��</option>
					<option value="1"
						${ !empty search.searchSortingOption && search.searchSortingOption=="1" ? "selected" : ""}>��ȸ�� ��</option>
					<option value="2"
						${ !empty search.searchSortingOption && search.searchSortingOption=="2" ? "selected" : ""}>�߿䵵 ��</option>
					<option value="3"
						${ !empty search.searchSortingOption && search.searchSortingOption=="3" ? "selected" : ""}>���� �Խù� ��</option>
				</select>
				
				<div class="searchWrap">
				
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
				
				</div>
			    
				
			</div>
			
			<div class="form-group text-left">
				<button type="button" class="button">�۾���</button>
			</div>
			
			<input type="hidden" id="currentPage" name="currentPage" value="">
				
		</form>
		
		<!-- PageNavigation ���� ������ ���� ������ �κ� -->
		
		
		<%-- <input type="hidden" name="maxPage" value="${resultPage.maxPage }"> --%>
		
		<!-- ���̺� ����Ʈ : start -->
		<table class="table table-hover table-striped">
		
			<thead>
				<tr>
					<th aligin="center">�۹�ȣ</th>
					<th aligin="center">����</th>
					<th aligin="center">�ۼ���</th>
					<th aligin="center">�ۼ���</th>
					<th aligin="center">��ȸ</th>
					<th aligin="center">�߿䵵</th>
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
							<span>������</span>
						</td>
						<td>
							<span>${community.writeDate }</span>
						</td>
						<td>
							<span>${community.views }</span>
						</td>
						<td>
							<c:if test="${community.importRank == 'Y'}">
								<span>�ʵ�</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
		<!-- ���̺� ����Ʈ : end -->
	</div>
	
	<!-- PageNavigation : start -->
	<jsp:include page="/common/pageNavigator_new.jsp" />
	<!-- PageNavigation : end -->
	
	</div>
<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->

</body>
</html>