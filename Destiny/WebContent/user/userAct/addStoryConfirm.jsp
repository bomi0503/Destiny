<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("input[value='Ȯ��']").on("click", function(){
			self.location = "/act/getWriteCommunityList/"+"${me.userId}";
		});
	});
</script>
</head>
<body>

	 <!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/toolBar.jsp" />
	 <!-- ToolBar End /////////////////////////////////////-->
    
	<h1>addRestaurantInfoConfirm.jsp</h1>
	<table width="100%">
			<tr>
				<td>����</td>
				<td>${community.title }</td>
			</tr>
			<tr>
				<td>����</td>
				<td>${community.detail }</td>
			</tr>
			<tr>
				<td><input type="button"  value="Ȯ��"></td>
				<td><input type="button"  id="" value="����"></td>
			</tr>
		</table>
</body>
</html>