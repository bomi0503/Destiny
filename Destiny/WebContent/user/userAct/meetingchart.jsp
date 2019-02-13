<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	
	
	
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->	

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="linkmove" class="wrapper align-center">
		<div class="inner">
		
			<h3>모임 차트 조회</h3>
			<form class="form-horizontal">
				<div class="row uniform">
					<div class="flex ">
				 		<div class="4u">
				 			
				 			<h4>모임 회원들의 상위 관심사 top5</h4>
				 			<canvas id="myChart" width="400" height="400"></canvas>
							<script>
							var ctx = document.getElementById("myChart").getContext('2d');
							var myChart = new Chart(ctx, {
							    type: 'pie',
							    data: {
							        labels: ["${fiveTOPInerest[0]}", "${fiveTOPInerest[1]}", "${fiveTOPInerest[2]}", "${fiveTOPInerest[3]}", "${fiveTOPInerest[4]}"],
							        datasets: [{
							            label: '# of Votes',
							            data: [${fiveTOP[0]}, ${fiveTOP[1]}, ${fiveTOP[2]}, ${fiveTOP[3]}, ${fiveTOP[4]}],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',
							                'rgba(54, 162, 235, 0.2)',
							                'rgba(255, 206, 86, 0.2)',
							                'rgba(75, 192, 192, 0.2)',
							                'rgba(153, 102, 255, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255,99,132,1)',
							                'rgba(54, 162, 235, 1)',
							                'rgba(255, 206, 86, 1)',
							                'rgba(75, 192, 192, 1)',
							                'rgba(153, 102, 255, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                    beginAtZero:true
							                }
							            }]
							        }
							    }
							});
							</script>
						</div>
						
						<div class="4u">	
							<h4>모임 회원들의 성비</h4>
				 			<canvas id="myChart2" width="400" height="400"></canvas>
							<script>
							var ctx = document.getElementById("myChart2").getContext('2d');
							var myChart = new Chart(ctx, {
							    type: 'doughnut',
							    data: {
							        labels: ["남성", "여성"],
							        datasets: [{
							            label: '# of Votes',
							            data: [${maleNum}, ${femaleNum}],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',
							                'rgba(54, 162, 235, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255,99,132,1)',
							                'rgba(54, 162, 235, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                    beginAtZero:true
							                }
							            }]
							        }
							    }
							});
							</script>
						</div>
							
						<div class="4u">
							<h4>모임 회원들의 연령대</h4>
				 			<canvas id="myChart3" width="400" height="400"></canvas>
							<script>
							var ctx = document.getElementById("myChart3").getContext('2d');
							var myChart = new Chart(ctx, {
							    type: 'bar',
							    data: {
							        labels: ["0~19", "20~39", "40~59", "60~79", "80~99"],
							        datasets: [{
							            label: '# of Votes',
							            data: [${firstGeneration}, ${secondGeneration}, ${thirdGeneration}, ${fourthGeneration}, ${fifthGeneration}],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.2)',
							                'rgba(54, 162, 235, 0.2)',
							                'rgba(255, 206, 86, 0.2)',
							                'rgba(75, 192, 192, 0.2)',
							                'rgba(153, 102, 255, 0.2)'
							            ],
							            borderColor: [
							                'rgba(255,99,132,1)',
							                'rgba(54, 162, 235, 1)',
							                'rgba(255, 206, 86, 1)',
							                'rgba(75, 192, 192, 1)',
							                'rgba(153, 102, 255, 1)'
							            ],
							            borderWidth: 1
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                    beginAtZero:false
							                }
							            }]
							        }
							    }
							});
							</script>
						
							
							
							
				 			
						</div>
					</div>
				</div>

			</form>
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
</body>
</html>