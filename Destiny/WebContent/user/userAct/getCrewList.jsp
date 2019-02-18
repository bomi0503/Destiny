<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우리들의 연결고리</title>

	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/main.css" >
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	<script>
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "GET").attr("action" , "/act/getMeetingAct/${contextMeeting.meetingNo}").submit();
		}
		
		//============= 모임 가입 수락/거절  Event  처리=============
		 $(function() {
			 
			//$('.message').hide();
			 
			//==>가입 수락
			$(".applyOK").on("click", function(){
				var meetingNo = $(this).data("param");
				var meetingMasterId = $(this).data("param1");
				
				if("${reason}"!= ""){
					alert('${reason}');
					return;
					//$('.message').show();
				}else{
					alert("가입을 수락하시겠습니까?");
					self.location = "/act/judgmentApply/yes/"+meetingNo+"/"+meetingMasterId;
				}
				
			});
			
			//==> 가입 거절
			$(".applyNO").on("click", function(){
				var meetingNo = $(this).data("param");
				var meetingMasterId = $(this).data("param1");
				
				alert("가입을 거절하시겠습니까?");
				self.location = "/act/judgmentApply/no/"+meetingNo+"/"+meetingMasterId;
			});
			
			$('.getMeetingLink').on("click", function(){
				self.location ="/meeting/getMeeting?meetingNo="+$(this).data("param");
			});
			 
		});	
		
	</script>
	<!-- //All js -->
	
	<style>
		/* .container{
			font-weight : 700;
		} */
		button{padding: 0 2em; height:40px;}
		.getMeetingLink{cursor:pointer;}
		.close {width: 35px; height: 30px; text-shadow: 0 1px 0 #ffdfe5;}
		.meetingTable{margin-top:5em;}
		input[type="text"].form-control{border: solid 2px #fff;color: #666; }
		.form-control[readonly]{background-color: #f9acac3b;}
		/* table sytle 추가 */
		table{border-collapse:collapse; table-layout:fixed; margin-top:20px; }
		.table-type01{width:100%;}
		.table-type01 thead tr th{position:relative; padding:10px 5px; vertical-align:middle; text-align:center; border-top:2px solid #000; font-size:16px; font-weight:600;}
		.table-type01 thead tr th:before{content:''; position:absolute; top:50%; left:0; width:1px; height:20px; background:#DDD; transform:translateY(-50%);}
		.table-type01 thead tr th:first-child:before{display:none;}
		.table-type01 tbody tr td{padding:10px 5px; vertical-align:middle; text-align:center; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr td:nth-child(3){padding:10px 20px; vertical-align:middle; text-align:left; border-bottom:1px solid #DDD; font-size:14px;}
		.table-type01 tbody tr:first-child td{border-top:1px solid #DDD;}
		/* table sytle 추가 */
		
		
	
	</style>
	

</head>

<body>	
	<!-- contents -->
	<div class="container">
	
		<div class="wrap">
			
			<hr/>
			
			<div>
				<!-- 모임이름넣기 -->
			</div>
			
			<hr/>
				
			<div class="message">
				<c:if test="${reason != '' }">
					<h4>모집 인원이 마감되었습니다.</h4>
					<br/><br/>
				</c:if>
			</div>
			
			
			<!-- 테이블 리스트 : start -->
			<table class="table-type01">
	            <colgroup>
	                <col style="width:10%">
	                <col style="width:20%">
	                <col style="width:15%">
	                <col style="width:15%">
	                <col style="width:15%">
	                <col style="width:25%">
	            </colgroup>
	            <thead>
	                <tr>
	                    <th>No</th>
	                    <th>프로필</th>
	                    <th>닉네임</th>
	                    <th>성별</th>
	                    <th>생년월일</th>
	                    <th>소개글</th>
	                    <!-- <th>수락 / 거절</th> -->
	                </tr>
	            </thead>
	    
	            <tbody>
	            
		            <c:if test="${listAPL[0] == null}">
	            		<tr>
	            			<td colspan="7"> 모임 신청자가 없습니다. </td>
	            		</tr>
	           		</c:if>
	            		
	            	<c:set var="i" value="0" />
	            	<c:forEach var="meeting" items="${listAPL}">
	            		<c:set var="i" value="${ i+1 }" />
	            		<tr>
	            			<td>${ meeting.meetingCrewNo }</td>
	            			<td>
	            				<img src="/resources/images/userprofile/${meeting.masterProfileImg}" width="100px" height="100px"/>
	            			</td>
	            			<td data-param="${meeting.meetingMasterId}">${meeting.crewNickName}</td>
	            			<td>
	            				<c:if test="${listAPLUser[i-1].gender eq 'M'}">남성</c:if>
	            				<c:if test="${listAPLUser[i-1].gender eq 'W'}">여성</c:if>
	            			</td>
	            			<td>${listAPLUser[i-1].birthday}</td>
	            			<td>
	            				<%-- <a href="#exampleModal" data-toggle="modal" >${meeting.interviewTitle}</a> --%>
	            				<button type="button" data-toggle="modal" data-target="#exampleModal">가입인사</button>
								
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="exampleModalLabel">모임 가입 신청 </h4>
								      </div>
								      
								      <div class="modal-body">
								      <%-- 	<c:set var="i" value="0" />
							         	<c:forEach var="meeting" items="${listAPL}">
							         		<c:set var="i" value="${ i+1 }" /> --%>
								      
									          <div class="form-group">
									            <label for="recipient-name" class="control-label title">가입인사</label>
									            <input type="text" class="form-control" value="${meeting.interviewTitle}" readonly="readonly"></input>
									          </div>
									          <div class="form-group">
									            <label for="message-text" class="control-label interview">인사내용</label>
									            <textarea class="form-control" readonly="readonly">${meeting.interview}</textarea>
									          </div>
								          
								          <%-- </c:forEach> --%>
								      </div>
								      
								      <div class="modal-footer">
								        <button type="button" class="button" data-dismiss="modal">취소</button>
								        <button type="button" class="button applyNO" id="applyNO" data-param="${meetingNo}" data-param1="${meeting.meetingMasterId}">거절</button>
								        <button type="button" class="button special applyOK" id="applyOK" data-param="${meetingNo}" data-param1="${meeting.meetingMasterId}">수락</button>
								        <!-- <button type="button" class="button special">확인</button> -->
								      </div>
								    </div>
								  </div>
								</div>
								<!-- Modal -->
								
								
	            			</td>
	            			<%-- <td>
								<button type="button" class="applyOK" id="applyOK" data-param="${meetingNo}" data-param1="${meeting.meetingMasterId}">수락</button>
								<button type="button" class="applyNO" id="applyNO" data-param="${meetingNo}" data-param1="${meeting.meetingMasterId}">거절</button>
	            			</td> --%>
	            		</tr>
	            		
	            	</c:forEach>
	            	
	            </tbody>
        	</table>
			<!-- 테이블 리스트 : end -->
			
		</div>
	</div>
	<!-- //contents -->

	
	
</body>
</html>