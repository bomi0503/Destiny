<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	
	<footer id="footer">
	
		<script>
			$(function(){
				$("#proposeButton").on("click", function(){
					
					var propose = $("input[name='propose']").val();
					swal({title:"���ǻ����� �����Ǿ����ϴ�.",icon:"success"});
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
				<label for="propose" style="font-size:120%; color:white; text-align:center;">���ǻ���</label>
					<input style="font-size:80%; color:black; width:100%;" type="text" id="propose" name="propose" placeholder="���ǻ����� �Է����ּ���."></input><br/>
					
					<ul class="actions small" style="width:100%">
						<li><a id="proposeButton" class="button special small" href="#" >send for Admin</a></li>	
					</ul>
					
				<div class="copy">
					&copy; Poeticalopers.
				</div>
			</div>
			
		</div>
	</footer>