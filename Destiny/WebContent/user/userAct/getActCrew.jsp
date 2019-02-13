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
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getOpenMeetingList").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		
		
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body >	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<h3>ȸ�� ���� ȸ�� ��� ��ȸ</h3><br/><br/>
			<h4>���� �� : ${contextMeeting.meetingName}</h4>
			<img src="/resources/images/meeting/${contextMeeting.titleImg}" width="1050" height="300"/><br/><br/>
			<!-- table ���� �˻� Start /////////////////////////////////////-->
			<div class="row">
			
				<div class="col-md-6 text-left">
					<p class="text-primary">
						<!--  ��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������-->
					</p>
				</div>
				
				<div class="col-md-6 text-right">
					<form class="form-inline" name="detailForm">
					
					</form>
				</div>
				
			</div>
			<!-- table ���� �˻� Start /////////////////////////////////////-->

			<!--  table Start /////////////////////////////////////-->
			  <table class="table table-hover table-striped" >
			  
				<thead>
				  <tr>
					<th align="center">�г���</th>
					<th align="left">������ �̹���</th>
					<th align="left">�������</th>
					<th align="left">����</th>
					<th align="left">���� ���</th>
				  </tr>
				</thead>
			   
				<tbody>
				
				  <c:set var="i" value="0" />
				  <c:forEach var="user" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
					  <td align="center">${ user.nickName }</td>
					  <td align="left"><img src="/resources/images/userprofile/${user.profile}" width="170" height="170"/></td>
					  <td align="left">${user.birthday}</td>
					  <td align="left"><c:if test="${user.gender eq 'M'}">����</c:if>
					  				   <c:if test="${user.gender eq 'W'}">����</c:if></td>
					  <td align="left">
						<c:if test="${user.userGrade=='NEW'}">�ű�ȸ��</c:if>
				  		<c:if test="${user.userGrade=='NOR'}">�Ϲ�ȸ��</c:if>
				  		<c:if test="${user.userGrade=='VIP'}">���ȸ��</c:if>
				  		<c:if test="${user.userGrade=='ADM'}">������</c:if>
				  		<c:if test="${user.userGrade=='BLK'}">������Ʈ</c:if>
					  </td>
					</tr>
				  </c:forEach>
				
				</tbody>
			  
			  </table>
			  <!--  table End /////////////////////////////////////-->




		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>