<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<!-- Custom styles for this template -->
<link href="../css/agency.min.css" rel="stylesheet">
<%@ include file="../module/head.jsp"%>
</head>
<%@ include file="../module/header.jsp"%>
<%@ include file="../module/carousel.jsp"%>


<body>
	<%@ include file="../module/middleNav.jsp"%>



	<!-- plan_code & list_code 추출 -->
	<c:set var="list_code" value="${list_code }" />
	<c:set var="plan_code" value="${plan_code }" />
	<%
		String plan_code = (String) pageContext.getAttribute("plan_code");
		String list_code = (String) pageContext.getAttribute("list_code");
	%>



	<!-- 교통정보 출력 -->
	<section class="bg-white" id="transOutput"
		style="padding-bottom: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">교통정보</h2>
					<h3 class="section-subheading text-muted">자신이 이용할 교통정보를 입력, 출력
						할 수 있습니다.</h3>
					<form action="detail.do?plan_code=<%=plan_code%>" method="post">
						<input type="submit" value="Day-List" class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>
	</section>

	<section class="bg-light"
		style="padding-top: 30px; padding-bottom: 30px;">
		<div class="container">
			<!-- 교통수단 이미지 선택  -->
			<div class="pills">

				<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"
					style="padding-left: 100px">

					<li class="nav-item"><a class="nav-link active"
						id="pills-home-tab" data-toggle="pill" href="#pills-home"
						role="tab" aria-controls="pills-home" aria-selected="true"><img
							name="trans1" src="../img/trans/t1.png" width="100" height="100"></a></li>

					<li class="nav-item"><a class="nav-link" id="pills2"
						data-toggle="pill" href="#pills-2" role="tab"
						aria-controls="pills-2" aria-selected="false"> <img
							name="trans2" src="../img/trans/t2.png" width="100" height="100"></a></li>

					<li class="nav-item"><a class="nav-link" id="pills3"
						data-toggle="pill" href="#pills-3" role="tab"
						aria-controls="pills-3" aria-selected="false"> <img
							name="trans3" src="../img/trans/t3.png" width="100" height="100"></a></li>

					<li class="nav-item"><a class="nav-link" id="pills4"
						data-toggle="pill" href="#pills-4" role="tab"
						aria-controls="pills-4" aria-selected="false"> <img
							name="trans4" src="../img/trans/t4.png" width="100" height="100"></a></li>

					<li class="nav-item"><a class="nav-link" id="pills5"
						data-toggle="pill" href="#pills-5" role="tab"
						aria-controls="pills-5" aria-selected="false"> <img
							name="trans5" src="../img/trans/t5.png" width="100" height="100"></a></li>

					<li class="nav-item"><a class="nav-link" id="pills6"
						data-toggle="pill" href="#pills-6" role="tab"
						aria-controls="pills-6" aria-selected="false"> <img
							name="trans6" src="../img/trans/t6.png" width="100" height="100"></a></li>

					<li class="nav-item"><a class="nav-link" id="pills7"
						data-toggle="pill" href="#pills-7" role="tab"
						aria-controls="pills-7" aria-selected="false"> <img
							name="trans7" src="../img/trans/t7.png" width="100" height="100"></a></li>

				</ul>
			</div>

			<!-- 교통수단 별 출력  -->
			<div class="tab-content" id="pills-tabContent">
				<!-- 비행기 -->
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
						<tbody>

							<!-- 반복 PART -->
							<c:forEach var="list" items="${list1 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>비행기</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>

									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<!-- 선박 -->
				<div class="tab-pane fade" id="pills-2" role="tabpanel"
					aria-labelledby="a">
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
						<tbody>
							<!-- 반복 PART -->
							<c:forEach var="list" items="${list2 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>선박</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>
									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 철도 -->
				<div class="tab-pane fade" id="pills-3" role="tabpanel"
					aria-labelledby="a">
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
						<tbody>
							<!-- 반복 PART -->
							<c:forEach var="list" items="${list3 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>철도</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>
									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 버스 -->
				<div class="tab-pane fade" id="pills-4" role="tabpanel"
					aria-labelledby="a">
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
						<tbody>
							<!-- 반복 PART -->
							<c:forEach var="list" items="${list4 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>버스</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>
									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 택시 -->
				<div class="tab-pane fade" id="pills-5" role="tabpanel"
					aria-labelledby="a">
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
						<tbody>
							<!-- 반복 PART -->
							<c:forEach var="list" items="${list5 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>택시</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>
									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 자전거 -->
				<div class="tab-pane fade" id="pills-6" role="tabpanel"
					aria-labelledby="a">
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
						<tbody>
							<!-- 반복 PART -->
							<c:forEach var="list" items="${list6 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>자전거</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>
									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- 도보 -->
				<div class="tab-pane fade" id="pills-7" role="tabpanel"
					aria-labelledby="a">
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
						<tbody>
							<!-- 반복 PART -->
							<c:forEach var="list" items="${list7 }" varStatus="i">
								<tr>

									<th scope="row">${i.index+1 }</th>
									<td>도보</td>
									<td>${list.trans_start_time }</td>
									<td>${list.trans_start_location }<br>
									<td>${list.trans_end_time }</td>
									<td>${list.trans_end_location }<br>
									<td>${list.trans_contents }<br></td>
									<!-- Trans_code 받아오기 -->
									<c:set var="trans_code" value="${list.trans_code }" />
									<%
										int trans_code = (int) pageContext.getAttribute("trans_code");
									%>

									<td><form
											action="deleteTransCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&trans_code=<%=trans_code%>"
											method="post">
											<input type="submit" value="X"
												class="btn btn-outline-danger btn-sm">
										</form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>




				<!--  반복끝 -->
			</div>
		</div>
	</section>
	<!-- 출력 종료 -->




	<!-- 교통 입력  -->
	<section class="bg-white" id="transInput"
		style="padding-top: 50px; padding-bottom: 0px">
		<div class="container">
			<form
				action="insertTrans.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
				method="post" id="transInput2">
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
					<div class="col-md" style="margin-left: 30px"
						onclick="button_click(1);">
						<input type="button" value="+" class="btn btn-outline-success"
							style="height: 39px; margin-top: 5px;" id="transbtn">
					</div>
				</div>
			</form>
		</div>

	</section>
	<!-- 입력종료  -->


	<script type="text/javascript">
		$("#transbtn").click(function() {
	
			if ($("#startTime").val() == "") {
				alert("출발시간 입력 오류");
				$("#startTime").focus();
			} else if ($("#startPlace").val() == "") {
				alert("출발지 입력 오류");
				$("#startPlace").focus();
			} else if ($("#endTime").val() == "") {
				alert("도착시간 입력 오류");
				$("#endTime").focus();
			} else if ($("#endPlace").val() == "") {
				alert("도착지 입력 오류");
				$("#endPlace").focus();
			} else if ($("#contents").val() == "") {
				alert("내용 입력 오류");
				$("#contents").focus();
			} else if ($("#transType").val() == "선택") {
				alert("교통타입 입력 오류");
				$("#transType").focus();
			} else {
				$("#transInput2").submit();
			}
		});
	</script>

	<!-- Custom scripts for this template -->
	<script src="../js/agency.min.js"></script>
	<%@ include file="../module/footer.jsp"%>

</body>
</html>