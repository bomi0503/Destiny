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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	<script>
		
		
			function fncGetList(currentPage) {
				$("#currentPage").val(currentPage)
				$("form").attr("method" , "GET").attr("action" , "/letter/sendLetterList").submit();
			}
			
			$(function() {
				$(".ct_list_pop td:nth-child(8n+7)").on("click" , function() {
					var letterNo = $(this).data("param");
					
					self.location = "/letter/getLetter?no="+letterNo+"&from=sendList";
					
				});
			});
			
			$(function() {
				 $( "button.btn.btn-primary" ).on("click" , function() {
					 $("form").attr("method" , "POST").attr("action" , "/letter/sendletter.jsp").submit();
				});
			});
	
	</script>
<!-- //All js -->
	
	
	<style>
		body {
            padding-top : 50px;
            background-color: #FDD9EC;
        }
	</style>

</head>

<body class="subpage">	
	
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		
			<h3>���� ������</h3>
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
			
			<div class="col-md-6 text-left">
			<p class="text-primary">��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</p>
			</div>

			<div class="box alt">
				<div class="row 50% uniform">
					
					<label for="senderId">���� ������ ${totalReceiveCount}</label>
					<span id="receiverId"></span>
					
					<table class="table table-hover table-striped" >
					<thead>
						<tr>
							<td class="ct_list_b" width="100">������ȣ</td>
							<td class="ct_line02"></td>
							<td class="ct_list_b" width="100">������</td>
							<td class="ct_line02"></td>
							<td class="ct_list_b" width="150">������</td>
							<td class="ct_line02"></td>
							<td class="ct_list_b" width="150">��������</td>
							<td class="ct_line02"></td>
						</tr>
					</thead>
					
					<tbody>
						<c:set var="i" value="0" />
						<c:forEach var="letter" items="${listSend}">
							<c:set var="i" value="${ i+1 }" />
			
							<tr class="ct_list_pop">
							<td align="left">${letter.letterNo}</td>
							<td></td>		
							<td align="left">${letter.receiverId}</td>
							<td></td>
							<td align="left">${letter.getLetterDate}</td>
							<td></td>
							<td align="left" data-param="${letter.letterNo}">${letter.letterTitle}</td>
							<td></td>
					
						</c:forEach>
					</tbody>
				</table>

					 <!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
	
					<ul class="actions small">					
						<li><a class="button special small" href="/letter/sendletter.jsp">�ۼ�</a></li>
						<li><a class="button special small" href="/letter/letterMain.jsp">��������</a></li>
					</ul>


				</div>
			</div>
			</form>
	
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<jsp:include page="/common/pageNavigator_new.jsp"/>
	

	
	
</body>
</html>