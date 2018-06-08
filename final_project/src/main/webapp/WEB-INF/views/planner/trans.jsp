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





	<!-- 교통정보 출력 -->
	<section class="bg-white" id="transOutput"
		style="padding-bottom: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">교통정보</h2>
					<h3 class="section-subheading text-muted">자신이 이용할 교통정보를 입력, 출력
						할 수 있습니다.</h3>
					<form action="plannerDetail" method="get">
						<input type="hidden" value="${plan_code }" name="plan_code"
							class="btn btn-primary"> <input type="submit"
							value="Day-List" class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>
	</section>

	<section class="bg-light"
		style="padding-top: 30px; padding-bottom: 30px;">
		<div class="container">


			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">교통수단</th>
							<th scope="col">출발시간</th>
							<th scope="col">출발지</th>
							<th scope="col">도착시간</th>
							<th scope="col">도착지</th>
							<th scope="col">내용</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!-- 출력 종료 -->




	<!-- 교통 입력  -->
	<section class="bg-white" id="transInput"
		style="padding-top: 50px; padding-bottom: 0px">
		<div class="container">
			<form method="post" id="transInput2">
				<div class="form-row">
					<!-- 선택  -->
					<div class="col-auto my-1">
						<select class="custom-select mr-sm-1" id="transType" name="type">
							<option selected>선택</option>
							<option value="1">비행기</option>
							<option value="2">선박</option>
							<option value="3">철도</option>
							<option value="4">버스</option>
							<option value="5">택시</option>
							<option value="6">자전거</option>
							<option value="7">도보</option>
						</select>
					</div>
					<!-- 출발시간  -->
					<div class="form-group col-md-2">
						<input type="text" class="form-control" id="startTime"
							name="startTime" placeholder="출발시간" style="margin-top: 4px;">
					</div>
					<!-- 출발지  -->
					<div class="form-group col-md-2">
						<input type="text" class="form-control" id="startPlace"
							name="startPlace" placeholder="출발지" style="margin-top: 4px;">
					</div>
					<!-- 도착시간  -->
					<div class="form-group col-md-2">
						<input type="text" class="form-control" id="endTime"
							name="endTime" placeholder="도착시간" style="margin-top: 4px;">
					</div>
					<!-- 도착지  -->
					<div class="form-group col-md-2" style="margin-top: 4px;">
						<input type="text" class="form-control" id="endPlace"
							name="endPlace" placeholder="도착지">
					</div>
					<!-- 상세내용  -->
					<div class="form-group col-md-2" style="margin-top: 4px;">
						<input type="text" class="form-control" id="contents"
							name="contents" placeholder="상세내용">
					</div>
					<!-- 추가버튼  -->
					<div class="col-md" style="margin-left: 30px">
						<input type="button" value="+" class="btn btn-outline-success"
							style="height: 39px; margin-top: 5px;" id="transbtn">
					</div>
				</div>
				<input type="hidden" id="code" value="${list_code }">
			</form>
		</div>

	</section>
	<!-- 입력종료  -->



	<!-- Custom scripts for this template -->
	<script src="/resources/js/planner/trans.js"></script>
	<script src="/resources/js/agency.min.js"></script>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>