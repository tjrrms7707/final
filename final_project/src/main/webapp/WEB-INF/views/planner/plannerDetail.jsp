<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- Custom styles for this template -->
<link href="/resources/css/agency.min.css" rel="stylesheet">
<%@ include file="../include/head.jsp"%>
</head>


<body id="page-top">
	<%@ include file="../include/header.jsp"%>
	<%@ include file="../include/carousel.jsp"%>

	<%@ include file="../include/middleNav.jsp"%>


	<!-- Portfolio Grid -->
	<section class="bg-white" id="portfolio"
		style="padding-bottom: 0px; padding-top: 100px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">상세일정</h2>
					<h3 class="section-subheading text-muted">Lorem ipsum dolor
						sit amet consectetur.</h3>
				</div>
			</div>
		</div>
	</section>
	<section class="bg-light" id="portfolio"
		style="padding-top: 50px; padding-bottom: 50px">
		<div class="container">
	
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">날짜</th>
						<th scope="col">도시</th>
						<th scope="col">교통</th>
						<th scope="col">일정</th>
						<th scope="col">숙소</th>
						<th scope="col">지출</th>
					</tr>
				</thead>
				
				<tbody>
					<!-- DB에서 Plan_code에 해당하는 정보 가져오기 -->
					
					<c:forEach var="list" items="${listDay}" varStatus="i">
						<tr>
							<th scope="row">${i.index+1 }</th>
							<td>${list}</td>
							<td>${plan.plan_city}</td>


							<!-- 교통Part -->
							<td>
								<form action="trans" method="post">
									<input type="hidden" value=${listPlan.get(i.index).list_code} name="list_code">
									<a>건</a> <br>
									<div style="padding-top: 10px">
										<input type="submit" value="교통관리"
											class="btn btn-outline-secondary btn-sm">
								</form>
							</td>

							<!-- 일정Part -->
							<td>
								<form action="day">
									<input type="hidden" value=${listPlan.get(i.index).list_code} name="list_code">
									<a>건</a> <br>
									<div style="padding-top: 10px">
										<input type="submit" value="일정관리"
											class="btn btn-outline-secondary btn-sm">
								</form>
							</td>

							<!-- 숙소Part -->
							<td>
								<form action="accom" method="post">
									<a></a> <br> <input type="hidden" value=${listPlan.get(i.index).list_code}
										name="list_code">
									<div style="padding-top: 10px">
										<input type="submit" value="숙소관리"
											class="btn btn-outline-secondary btn-sm">
								</form>
							</td>
							<!-- 지출Part -->
							<td>
								<form action="spend" method="post">
									<input type="hidden" value=${listPlan.get(i.index).list_code} name="list_code">
									<a>건</a> <br>
									<div style="padding-top: 10px">
										<input type="submit" value="지출관리"
											class="btn btn-outline-secondary btn-sm">
								</form>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

	</section>



	<!-- Custom scripts for this template -->
	<script src="/resources/js/agency.min.js"></script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>