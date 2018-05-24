<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Custom styles for this template -->
<link href="/resources/css/agency.min.css" rel="stylesheet">
<%@ include file="../include/head.jsp"%>
</head>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/carousel.jsp"%>

<body>
	<%@ include file="../include/middleNav.jsp"%>

	<!-- Portfolio Grid -->
	<section class="bg-white" style="padding-bottom: 5px; padding-top:50px">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">planner</h2>
					<h3 class="section-subheading text-muted">Planner로 자신의 여행을
						계획하세요.</h3>
				</div>
			</div>
		</div>
	</section>
	<section class="bg-light" id="portfolio"
		style="padding-top: 50px; padding-bottom: 50px;">
		<div class="container">
			<div class="row" id="planList">
				<!-- 플래너추가 폼 -->
				<!-- 	<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link" data-toggle="modal"
						href="#portfolioModal6">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid"
						src="/resources/img/portfolio/06-thumbnail.jpg" alt="">
					</a>
					<div class="portfolio-caption">
						<h4>여행을 계획하세요</h4>
						<p class="text-muted">###</p>
						<p class="text-muted">###</p>
					</div>
				</div>
 -->
				<!-- DB에 있는 플래너 출력 폼 -->
				<%-- 	<c:forEach var="plan" items="${list }">
					<c:set var="plan_code" value="${plan.plan_code }"></c:set>
					<%
						int str = (int) pageContext.getAttribute("plan_code");
					%>
					<div class="col-md-4 col-sm-6 portfolio-item">
						<a class="portfolio-link" href="detail.do?plan_code=<%=str%>">
							<div class="portfolio-hover"></div> <img class="img-fluid"
							src="/resources/img/portfolio/02-thumbnail.jpg" alt="">
						</a>
						<div class="portfolio-caption">
							<h4>${plan.plan_name }</h4>
							<h5>${plan.plan_city }</h5>
							<p class="text-muted">${plan.start_date }~${plan.end_date }</p>
						</div>
					</div>
				</c:forEach> --%>

			</div>
		</div>
	</section>



	<!-- Planner Modals -->
	<%-- 	<%
		String member_code = (String) session.getAttribute("member_code");
		if (member_code != null) {
	%>
 --%>
	<!-- 추가모달  -->
	<div class="portfolio-modal modal fade" id="portfolioModal6"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>
				<div class="container">

					<div class="row">
						<div class="col-lg-8 mx-auto">
							<div class="modal-body">
								<!-- Project Details Go Here -->
								<h2 class="text-uppercase">Make Planner</h2>
								<p class="item-intro text-muted">Lorem ipsum dolor sit amet
									consectetur.</p>
								<!-- Form 입력 란 -->
								<div>
									<form name="modalInput" id="modalInput" action="planner"
										method="POST">
										<div class="form-row" style="width: 650px; margin-left: 40px">
											<!-- 시작일 -->
											<div class="form-group col-md-6">
												<label class="col-form-label" style="padding-right: 30px">시작일
												</label> <input name="start_date" id="start_date" type="date">

											</div>
											<!-- 종료일 -->
											<div class="form-group col-md-6">
												<label class="col-form-label" style="padding-right: 30px">종료일
												</label> <input name="end_date" id="end_date" type="date">

											</div>
										</div>
										<!-- Plan Name -->
										<div class="form-group">
											<label>Plan Name</label> <input name="plan_name" type="text"
												class="form-control" id="plan_name"
												placeholder="Itinerary to Paris">
										</div>

										<!-- City -->
										<div class="form-group">
											<label>City</label> <input name="plan_city" type="text"
												class="form-control" id="plan_city" placeholder="Paris">
										</div>
										<button class="btn btn-primary" type="button" id="plannerButton">시작하기!</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 	<%
		} else {
	%>
	<script type="text/javascript">
	
	
	//	alert("로그인하세요.")
	</script>

	<%
		}
	%>
 --%>

	<!-- Custom scripts for this template -->
	<script src="/resources/js/agency.min.js"></script>
	<script src="/resources/js/planner.js"></script>
	<%@ include file="../include/footer.jsp"%>


</body>
</html>
