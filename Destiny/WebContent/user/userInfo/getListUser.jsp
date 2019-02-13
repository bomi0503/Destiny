<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" href="/resources/css/main.css" >
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">

	<script>
		
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/user/listUser").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".searchBtn" ).on("click" , function() {
				fncGetList(1);
			});
			 
			 $("input[name='searchKeyword']").keypress(function(e) {
				if(e.which == 13) {
					$(this).blur();
					$('.searchBtn').focus().click();
				}
			});
		 });
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser/"+$(this).text().trim();
			});
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(6)" ).on("click" , function() {

				//var userId = $(this).next().val();
				var userId = $(this).data("param");
				
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								if($( "#"+userId+" #aa" ).html() != null){
									$('#'+userId).hide();
									$("#aa").remove();
									$("#bb").remove();
									$("#cc").remove();
									$("#dd").remove();
									return;
								}
								
								var images = "";
									$.each( JSONData.filelist, function(i, v){
										images = "<img src='/resources/images/userprofile/"+v+"' width='200px' height='200px'/>"
									});
									
								var displayValue ='<td class="userInfo" id="aa"  ></td>'
									+'<td colspan="2" class="userInfo" id="bb"  >'
									+ images
									+'</td>'
									+'<td class="userInfo" id="cc">'
									+'<h5>'
										+'���̵� : '+JSONData.user.userId+'<br/>'
										+'��  �� : '+JSONData.user.nickName+'<br/>'
										+'�̸��� : '+JSONData.user.email+'<br/>'
										+'��  �� : '+JSONData.user.userGrade+'<br/>'
										+'�� ��  : '+JSONData.user.birthday+'<br/>'
									+'</h5>'
									+'</td>'
									+'<td colspan="2" class="userInfo" id="dd">'
									+'<h5>'
										+'������ �ش� ȸ�������� �Ѿ�ϴ�.'
									+'</h5>'
									+'</td>';
								
									$("#aa").remove();
									$("#bb").remove();
									$("#cc").remove();
									$("#dd").remove();
								$( "#"+userId+"" ).html(displayValue);
								
								$('tr[id="'+userId+'"]').on("click", function(){
									self.location = "/user/getUser/"+userId;
								});
								
								$('.preview').hide();
								$('#'+userId).show();
							}
							
					});
				
					////////////////////////////////////////////////////////////////////////////////////////////
				
			});
			
		});	
	
	
	</script>
	<!-- //All js -->
	
	<style>
		.userInfo {vertical-align: middle; background-color: #F8E6E0; }
		body{
			position : relative;
		}
		.container{
			font-weight : 700;
		}
		.tumTitle{
			font-weight : 700;
		}
		.topImg{
			display : block;
			position : absolute;
			top : 0;
			background-image : url("/resources/images/background/userlistbg.png");
			background-repeat : no-repeat;
			background-position : center -500px;
			background-size : cover;
			width : 100%;
			height : 400px;
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
			line-height : 330px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
		}
		
		h1 .slim{
			font-family: 'Nanum Myeongjo', serif;
			font-weight : lighter;
		}
		.wrap{
			max-width:1440px;
			margin-top : 400px;
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
		
		.homeImg{
			margin-top : -2px;
		}
		.getUserLink{cursor:pointer;}
		.table-type01{width:100%;}
		.table-type01 thead tr th{position:relative; padding:13px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
		.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
		.table-type01 thead tr th:first-child:before{display:none;}
		.table-type01 tbody tr td{padding:13px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}
	</style>
	
</head>

<body>
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
		<!-- ���ι���̹��� : start -->
		<div class="topImg">
			<h1>ȸ��<span class="slim">����Ʈ</span></h1>
		</div>
		<!-- ���ι���̹��� : end -->
		
	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
		
			<!-- ������ ���� �׺���̼� ��� : start -->
			<ul class="smallNavi">
				<li class="homeImg"><img alt="home" src="/resources/images/background/home.jpg"></li>
				<li>></li>
				<li>����������</li>
				<li>></li>
				<li>ä�� ��ȸ</li>
			</ul>
			<!-- ������ ���� �׺���̼� ��� : end -->
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
				<!-- �˻� Start /////////////////////////////////////-->
				
				
				<div class="row uniform" style="margin-top:0;">
					<div class="2u 12u$(small)">
						<div class="select-wrapper">
							<select  name="searchSortingOption">
								<option value="">�˻�����</option>
								<option value="0" ${! empty search.searchSortingOption && search.searchSortingOption==0 ? "selected" : ""}>�⺻</option>
								<option value="1" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
								<option value="2" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(�� ������)</option>
								<option value="3" ${! empty search.searchSortingOption && search.searchSortingOption==1 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
								<option value="4" ${! empty search.searchSortingOption && search.searchSortingOption==2 ? "selected" : ""}>�⼮�ϼ� ������(��ü)</option>
							</select>
						</div>
					</div>
					
					<div class="2u 12u$(small)">
						<div class="select-wrapper">
							<select  name="searchCondition" >
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
								<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ���г���</option>
							</select>
						</div>
					</div>
					
					<div class="4u 12u$(small)">
							<label class="sr-only" for="searchKeyword">�˻���</label>
				    		<input type="text"  id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>
					
					<div class="2u 12u$(small)">
						<button type="button" class="searchBtn">�˻�</button>
					</div>
					
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
					
				</div>
				<!-- �˻� End /////////////////////////////////////-->
				
				<br/><br/>
				
				<%-- <div class="col-md-5">
			    	<p class="text-primary">
			    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
			    	</p>
			    </div> --%>
				
				<!-- Table List Start /////////////////////////////////////-->
				<div>
					<table class="table-type01">						
						<colgroup>
							<col style="width:5%;">
							<col style="width:15%;">
							<col style="width:15%;">
							<col style="width:30%;">
							<col style="width:20%;">
							<col style="width:15%;">
						</colgroup>
						
						<thead>
							<tr>
								<th>No</th>
								<th>ȸ��ID</th>
								<th>�г���</th>
								<th>�̸���</th>
								<th>ȸ�����</th>
								<th>��������</th>
							</tr>
						</thead>
						
						<tbody>
							<c:set var="i" value="0"/>
							<c:forEach var="user" items="${list}">
								<c:set var="i" value="${i+1}"/>
								
								<tr>
									<td>${i}</td>
									<td class="getUserLink" title="Click:ȸ�� ���� Ȯ��"> ${user.userId}</td>
									<td>${user.nickName}</td>
									<td>${user.email}</td>
									
									<!-- ȸ����� �߰� -->
									<c:if test="${user.userGrade=='NEW'}">
										<td> �ű�ȸ�� </td>
									</c:if>
									<c:if test="${user.userGrade=='NOR'}">
										<td> �Ϲ�ȸ�� </td>
									</c:if>
									<c:if test="${user.userGrade=='VIP'}">
										<td> ���ȸ�� </td>
									</c:if>
									<c:if test="${user.userGrade=='ADM'}">
										<td> ������ </td>
									</c:if>
									<c:if test="${user.userGrade=='BLK'}">
										<td> ������Ʈ </td>
									</c:if>
									<!-- ȸ����� �߰� -->
									
									<td data-param="${user.userId}"> ��������</td>
								</tr>
							
								<tr class="preview" id="${user.userId}" height="1" style="display:none;">
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</form>
		</div>
		
		<!-- pageNavigator -->
		<jsp:include page="/common/pageNavigator_new.jsp"/>	
		<!-- pageNavigator -->
		
	</div>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
</body>
</html>