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

<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">


	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c&libraries=services"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	

	
	
	<!-- Bootstrap core CSS -->

    
   <!-- �ɷ��� �Ϸ� -->

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	<link rel="stylesheet" href="/resources/css/main.css" > <!-- �쿬���� -->	
	
	 <style>
	 body {
	 	background-color: #fff;
	 	
	 }
	 
	 #one{
	 	padding: 0;
	 }
	 
	 #lol{
	 	/* margin-top: 350px; */
	 }
	 /* ��Ʈ ���� ���� */
	 .titleName{
	 	font-family: 'Gamja Flower', cursive;
	 	font-size: 50px;
	 }
	 .meetingCenter{
	 	color: #fd5d7c;
	 	margin-bottom: -15px;
	 	font-size: 20px;
	 }
	 
	/*  ���ι�׶��� */
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
	/* .topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/meetingbg.jpg");
		background-repeat : no-repeat;
		background-position : center -400px;
		background-size : cover;
		width : 100%;
		height : 400px;
	} */
	.topImg{
		max-width : 100%;
		height : 400px;
		background-image : url("/resources/images/background/meetingbg.jpg");
		background-position : center center;
		background-size : cover;
		background-repeat : no-repeat;
	}
	.topImg::before{
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
	h1 .slim{font-weight : lighter;}
	
	.smallNavi{
		overflow : hidden;
		float : right;
	}
	
	.smallNavi li{
		float : left;
	}
	.updateForm{
		padding : 25em 0 10em 0;
	}
	
	
	 /*  ���ι�׶��� ��! */
	 
	 
	 
	/* ������ �̵������ */
	/* @media screen and (max-width:1280px){
		.ment{
			display : none;
		}
	} */	
	</style>
	
	
	<script>
	$(function(){
		getLocation();
		var startNo = 1
		
		$(function(){
			 $(window).scroll(function(){

                var window = $(this);

                var scrollTop = window.scrollTop();

                var windowHeight = window.height();

                var documentHeight = $(document).height();

                // scrollbar�� thumb�� �ٴ� �� 30px���� ���� �ϸ� ����Ʈ�� �����´�.
                
                //console.log("��ť��Ʈ���� = "+documentHeight);
                //console.log("��ũ��ž + ������ ���� + 200 = "+scrollTop + windowHeight);

                if( scrollTop + windowHeight + 150 > documentHeight ){

							fetchList();
                }

       	})
       	
       	function fetchList(){
				 
				 startNo +=${resultPage.getCurrentPage()}

				 //console.log(startNo);
				 //fncGetProductList(startNo);
 
       		  $.ajax({

                    url:"/meetingRest/listMeeting?startNo="+startNo,

            
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							console.log(JSONData.list);
							
							var list="";
							for(i in JSONData.list){
								var meeting = JSONData.list[i];
								//console.log(product.fileName);
								list+="<article class='feature left'>";
								list+="<div class='image' style='display: flex; height: 400px;'><img src='/resources/images/meeting/"+meeting.titleImg+"'class='col-xs-12 col-sm-12 col-md-12' /></div>";
								list+="<div class='content'>";
							    list+="<p class='meetingCenter'><span class='glyphicon glyphicon-record'></span>&nbsp;"+meeting.meetingCenter+"<p>";
								list+="<h2 class='titleName'>"+meeting.meetingName+"</h2>";
								list+="<p>�������� <span class='meetingCenter'>"+meeting.meetingCrewLimit+"</span>��      ��ȸ��<span class='meetingCenter'> "+meeting.meetingViews+"</span>ȸ</p>";
								list+="<p>���ӳ�¥:"+meeting.meetingDate+"&nbsp; &nbsp;<span class='glyphicon glyphicon-map-marker'></span>"+meeting.meetingLocation+"</p>";
								list+="<ul class='actions'>";
								list+="<li>";
								list+="<a href='#' id='reMore' data-param='"+meeting.meetingNo+"' class='button'>More</a>";
								list+="</li>";
								list+="</ul>";
								list+="</div>";
								list+="</article>";
							}
							$( "#appendPoint" ).append(list);
						 
						}
				});	
	       		  
	       	} //fetchList�� //������� ���ѽ�ũ��
		});
		
		function getLocation() {
			//alert("�����̼� ����");
		  if (navigator.geolocation) { // GPS�� �����ϸ�
		    navigator.geolocation.getCurrentPosition(function(position) {
		      //alert(position.coords.latitude + ' ' + position.coords.longitude);
		      findaddress(position.coords.latitude, position.coords.longitude);
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS�� �������� �ʽ��ϴ�');
		  }
		}
		//getLocation();
		
		// �������� ������ �ּҷ� ��ȯ
		function findaddress(locationY,locationX){
			// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
			var geocoder = new daum.maps.services.Geocoder();
		    // ��ǥ�� ������ �ּ� ������ ��û�մϴ�
		    var address = geocoder.coord2RegionCode(locationX, locationY, searchAddrFromCoords);  
		}

		function searchAddrFromCoords(result, status) {
			if (status === daum.maps.services.Status.OK) {
				//console.log(result[0].region_2depth_name);
				var address = result[0].region_2depth_name;
				$.ajax({

                    url:"/meetingRest/nearMeeting?address="+address,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							//console.log(JSONData.bestList);
							
							var list="";
							for(i in JSONData.bestList){
								var meeting = JSONData.bestList[i];
								//list+="<section id='linkmove' class='wrapper align-center'>";
								//list+="<div class='inner'>";
								//list+="<div id='frogue-container' class='position-right-bottom'data-color='#555a9c'data-chatbot='b9ca3ac0-61fd-496b-831f-3906f84fbb90'data-user='b9ca3ac0-61fd-496b-831f-3906f84fbb90'data-init-key='value'></div>";
								//list+="<div class='flex secondSection'>";
								list+="<div class='move_meeting'>";
								list+="<span><img style='width: 350px; height: 350px;' src='/resources/images/meeting/"+meeting.titleImg+"'></span>";
								list+="<p>"+meeting.meetingCenter+"</p>";
								list+="<h3>"+meeting.meetingName+"</h3>";
								list+="</div>";
								//list+="</div>";
								//list+="</div>";
								//list+="</section>";
							}
							$( ".secondSection" ).empty().append(list);
						 
						}
				});	
			}
		}
		
		// �� �ֺ� ���� ã�� ��ŸƮ
		$( "#nearMeeting" ).on("click", function() {
			getLocation();
		});
		
		// �����ϱ� ������ �̺�Ʈ ó��
		$( "#addMeeting" ).on("click", function() {
			console.log("${empty sessionScope.me}");
			
			if('${sessionScope.me.userGrade }' !='NEW' && ${!empty sessionScope.me.userId}){
				//alert("����");
				self.location="/meeting/addMeeting"
			}else if('${empty sessionScope.me}'=='true'){
				if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
					$("#my-dialog,#dialog-background").toggle();
					//self.location="/user/login";
				 }else{   //���
				     return;
				 }
			}else if('${sessionScope.me.userGrade }'=='NEW'){
				alert("${sessionScope.me.nickName}���� �쿬����Դϴ�.\n�ο��̻� ȸ������ ���� �ϴ��մϴ�.");
			}else{
				alert("�̿� �Ұ��մϴ�.");
			}
		});
		
		//more�������� �̺�Ʈ ó��
		$("a[href='#' ]:contains('More')").on("click", function() {
			var meetingNo = $(this).data("param");
			//console.log("����Խ��ϱ�??");
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		});
		
		$(document).on("click","#reMore",function(){
			var meetingNo = $(this).data("param");
			//console.log("������");
			//console.log($(this).data("param"));
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		});
		
		//�ñ��� ������ �ִ� �� 
		$( "#centerLocation" ).on("change" , function() {
			//var idx = $(".brand_ids").index(this);
			var city=$(this).val();
			console.log(city);
			
			$.ajax( 
					{
						url : "/user/json/getLocationList/"+city,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							
							var list="";
							list+="<select  id='centering' name='meetingCenter' class='form-control'>";
							list+="<option>��/��/�� ����</option>";
							for(i in JSONData.list){
								var town = JSONData.list[i].townName;
								
								list+="<option id='centerMeeting' name='searchCondition' data-param='$(this).value' value='"+town+"'>"+town+"</option>";
						}
							$( "#location" ).empty().append(list);
						}
				});
		});
		
		//�˻��� �̺�Ʈ ó��
		$( "#plzsearch" ).on("click" , function() {
   		 var meetingCenter=$("#centering").val();
   		 var seconCenter=$("#sconcentering").val();
   		 var interest=$("#interest").val();
   		 console.log(meetingCenter);
   		 console.log(interest);
   		 console.log(seconCenter);
   		 if(interest=='���ɻ�'){
   			 $("#interest").val("");
   		 }
   		 if(meetingCenter=="" || seconCenter==""){
   			 //alert("�����ο��� �����Ͽ� �ּ���.");
   			 meetingCenter="�ƴ�";
   		 }
   		$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting/"+meetingCenter).submit();
		 });
		
	});
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->

	
		<div class="topImg">
			<h1>�츮����<span class="slim">����</span></h1>
		</div>
		
	 <!-- ����Ʈ��ǰ ���̺� -->
         <%--    <table>

            	  <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${bestList}">
				  <c:set var="i" value="${ i+1 }" />
				  </c:forEach>

			<div id="myCarousel" class="carousel slide " data-ride="carousel">
			      <!-- Indicators -->
				 <div class="carousel-inner" role="listbox">
			        <div class="item active col-xs-12 col-sm-12" align="center">
			          <img  class="first-slide" src="/resources/images/meeting/${bestList[0].titleImg}" style="width:auto; height: 400px;" alt="First slide"><!-- ù��° ���� -->
					
			        </div>
			        <div class="item col-xs-12 col-sm-12" align="center">
			          <img class="second-slide" src="/resources/images/meeting/${bestList[1].titleImg}" style="width:auto; height: 400px;" alt="Second slide"><!-- �ι�° ���� -->

			        </div>
			        <div class="item col-xs-12 col-sm-12" align="center">
			          <img class="third-slide" src="/resources/images/meeting/${bestList[2].titleImg}" style="width:auto; height: 400px;" alt="Third slide"><!-- ����° ���� -->
			        </div>
			      </div> 
			      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			      </a>
			      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			      </a> 
			   </div>
            </table> --%>
            
            <!-- /.carousel -->
            <!-- ����Ʈ��ǰ ���̺� ���� -->
            	<section id="main" class="wrapper">	
            			 <!-- ����!! -->
		<%-- <div class="col-xs-11 col-md-10 col-centered">
					  <c:set var="i" value="0" />
					  <c:forEach var="meet" items="${bestList}">
					  <c:set var="i" value="${ i+1 }" />
					  </c:forEach>
					  
			<div id="carousel" class="carousel slide" data-ride="carousel" data-type="multi" data-interval="2500">
				<div class="carousel-inner">
					<div class="item active">
						<div class="carousel-col">
							<!-- <div class="block red img-responsive"></div> -->
							<img class="block" src="/resources/images/meeting/action.jpg" style="width:150px; height: 230px;" alt="First slide">
						</div>
					</div>
					
					<div class="item">
						<div class="carousel-col">
							<!-- <div class="block red img-responsive"></div> -->
							<img class="block" src="/resources/images/meeting/${bestList[1].titleImg}" style="width:150px; height: 230px;" alt="First slide">
							
						</div>
					</div>
					
					<div class="item">
						<div class="carousel-col">
							<!-- <div class="block red img-responsive"></div> -->
							<img class="block" src="/resources/images/meeting/action.jpg"" style="width:150px; height: 230px;" alt="First slide">
						</div>
					</div> --%>
					<!-- 
					<div class="item">
						<div class="carousel-col">
							<div class="block green img-responsive"></div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-col">
							<div class="block blue img-responsive"></div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-col">
							<div class="block yellow img-responsive"></div>
						</div>
					</div>
					 
				</div>-->

				<!-- Controls -->
				<!-- <div class="left carousel-control">
					<a href="#carousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
				</div>
				<div class="right carousel-control">
					<a href="#carousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div> 

		</div>-->

	<!-- ��!! -->		
            

		<div  class="landing">
		<div style="width:98%; margin-left:10px;">

        <form>
            <br/>
            <!-- �˻�â ���� -->
            <div style="margin-bottom: 30px;" id="lol" align="center" border="7" height="34px" bordercolor="#326ada" class="row col-xs-12 col-sm-12 col-md-12">

            		<div class="col-xs-12 col-sm-12 col-md-4">
	            		<input name="searchKeyword"  
	            		type="text" placeholder="�˻�� �Է�" style="width: 100%"/>
            		</div>
            		<div class='search col-xs-12 col-sm-12 col-md-2'>
						<select id="centerLocation" class="form-control">
				 		<option>�߽�����-����</option>
				 		<option value="����">����</option>
		                <option value="���">���</option>
		                <option value="��õ">��õ</option>
		                <option value="�λ�">�λ�</option>
		                <option value="�뱸">�뱸</option>
		                <option value="����">����</option>
		                <option value="����">����</option>
		                <option value="���">���</option>
		                <option value="����">����</option>
		                <option value="����">����</option>
		                <option value="�泲">�泲</option>
		                <option value="���">���</option>
		                <option value="����">����</option>
		                <option value="����">����</option>
		                <option value="�泲">�泲</option>
		                <option value="���">���</option>
		                <option value="����">����</option>
				 	</select>
            		</div>
            		<div id="location" class='search col-xs-12 col-sm-12 col-md-2'>
						<input readonly="readonly" id="sconcentering" type="text" class="form-control" style="width: 100%"> 
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2">
            			<select id="interest" name="searchSortingOption" class="form-control">
					 		<option >���ɻ�</option>
					 		<c:forEach var="Meeting" items="${interlist}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2"><input type='button' id="plzsearch" class='sch_smit search-btn' value="ã��"></div>
			</div>
		</form>	 
			 <!-- �˻�â ���� -->
			 
			 <!-- ��ũ�̵� start -->
		<%-- <c:if test="${!empty sessionScope.me=='true'}"> --%>
			<section id="linkmove" class="wrapper align-center">
				
				<!-- <h2>���ֺ� ��õ����</h2> -->
				
				<div class="inner">
				
					<div id="frogue-container" class="position-right-bottom"
					      data-color="#555a9c"
					      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
					      data-init-key="value"
					      ></div>
					
					<div class="flex secondSection">

					</div>
				</div>
			</section>
		<%-- </c:if> --%>
			<!-- ��ũ�̵� end -->
			 
			 <!-- ����Ʈ ���� -->
                <div>
	              	<section style="align-content:center; " id="one" class="wrapper style1">
						<div id="appendPoint" class="inner" style="text-align: center;">
						<div align="right" class="addMeeting">
						 	<input type="button" id="addMeeting" value="�����ϱ�">
						 	<!-- <input type="button" id="nearMeeting" value="�� �ֺ� ����"> -->
						 </div>
							<c:set var="i" value="0" />
						 	<c:forEach var="meeting" items="${list}">
						 	<c:set var="i" value="${ i+1 }" />
						 	<hr/>
						 	
							<article class="feature left">
								<div class="image" style="display: flex; height: 400px;"><img src="/resources/images/meeting/${meeting.titleImg}" class="col-xs-12 col-sm-12 col-md-12" alt="" /></div>
								<div class="content">
									<p class="meetingCenter"><span class="glyphicon glyphicon-record"></span>&nbsp;${meeting.meetingCenter}<p>
									<h2 class="titleName">${meeting.meetingName}</h2>
									<p>��������  <span class="meetingCenter">${meeting.meetingCrewLimit}</span>��      ��ȸ�� <span class="meetingCenter">${meeting.meetingViews}</span>ȸ</p>
									<p></p>
									<p>���ӳ�¥:${meeting.meetingDate}&nbsp; &nbsp;<span class="glyphicon glyphicon-map-marker"></span>${meeting.meetingLocation}</p>
									<ul class="actions">
										<li>
											<a href="#" data-param="${meeting.meetingNo}" class="button">More</a>
										</li>
									</ul>
								</div>
							</article>
							
							</c:forEach>
							 
						</div>
					</section>
            	</div>   
       		<!-- ����Ʈ ���� -->
    </div>
	
		
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	            
	
</body>
</html>