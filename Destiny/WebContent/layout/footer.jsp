<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	
	<footer id="footer">
	
		<script>
			$(function(){
				$("#proposeButton").on("click", function(){
					
					var propose = $("input[name='propose']").val();
					swal({title:"문의사항이 접수되었습니다.",icon:"success"});
					$("#propose").val("");
					
					$.ajax({
						url : "/act/json/inquiry/"+propose,
						method : "GET",
						datatype : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							
						}
					});
				});
			});
		</script>
		
		
		<div class="inner">
			
			<div class="foot">
				<label for="propose" style="font-size:120%; color:white; text-align:center;">문의사항</label>
					<input style="font-size:80%; color:black; width:100%;" type="text" id="propose" name="propose" placeholder="문의사항을 입력해주세요."></input><br/>
					
					<ul class="actions small">
						<li><a id="proposeButton" class="button special small" href="#" >send for Admin</a></li>	
					</ul>
					
				<div class="copyright">
					&copy; Poeticalopers.<!--  Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>. -->
				</div>
			</div>
			
		</div>
	</footer>
	
	
	<%-- <div id="navPanel">
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Home</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Meeting</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Chatting</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Place</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">RestaurantInfo</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">LoveAdvice</a>
		<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Notice</a>
		<c:if test="${me.userGrade == 'ADM'}">
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Complain</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">UserList</a>
		</c:if>
		<c:if test="${me == null}">
			<a href="#" id="btn-open-dialog" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">login</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">join</a>
		</c:if>
		<c:if test="${me != null}">
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">MyPage</a>
			<a href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">logout</a>
		</c:if>
		<a href="#navPanel" class="close" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></a>
	</div>
	<div class="nav_bg"></div> --%>