<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String plan_code = request.getParameter("plan_code");
%>
<!-- Custom styles for this template -->
<link href="../css/agency.min.css" rel="stylesheet">
<%@ include file="../module/head.jsp" %>
</head>

<%@ include file="../module/header.jsp" %>
<%@ include file="../module/carousel.jsp" %>
<body id="page-top">


	<%@ include file="../module/middleNav.jsp"%>


	<!-- Portfolio Grid -->
	<section class="bg-white" id="portfolio"
		style="
    padding-bottom: 0px;
    padding-top: 100px;
">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">상세일정</h2>
				<h3 class="section-subheading text-muted">Lorem ipsum dolor sit
					amet consectetur.</h3>
			</div>
		</div>
	</div>
	</section>
	<section class="bg-light" id="portfolio" style="padding-top: 50px; padding-bottom: 50px">
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
				<c:forEach var="list" items="${listPlan}" varStatus="i">
					<c:set var="list_code" value="${list.list_code }"></c:set>

					<%
						int list_code = (int) pageContext.getAttribute("list_code");
					%>
					<tr>
						<th scope="row">${list.list_code}</th>
						<td>${dayList.get(i.index) }</td>
						<td>${plan.plan_city}</td>


						<!-- 교통Part -->
						<td>
							<form
								action="trans.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
								method="post">
								<a>${TransInfo.get(i.index) }건</a> <br>
								<div style="padding-top: 10px">
									<input type="submit" value="교통관리"
										class="btn btn-outline-secondary btn-sm">
							</form>
						</td>

						<!-- 일정Part -->
						<td>
							<form
								action="day.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
								method="post">
								<a>${dayInfo.get(i.index) }건</a> <br>
								<div style="padding-top: 10px">
									<input type="submit" value="일정관리"
										class="btn btn-outline-secondary btn-sm">
							</form>
						</td>

						<!-- 숙소Part -->
						<td>
							<form
								action="accom.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
								method="post">
								<a>${accomInfo.get(i.index) }</a> <br>
								<div style="padding-top: 10px">
									<input type="submit" value="숙소관리"
										class="btn btn-outline-secondary btn-sm">
							</form>
						</td>
						<!-- 지출Part -->
						<td>
							<form
								action="spend.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
								method="post">
								<a>${SpendInfo.get(i.index) }건</a> <br>
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

	<%@ include file="../module/footer.jsp"%>

	<!-- Custom scripts for this template -->
	<script src="../js/agency.min.js"></script>
</body>
</html>