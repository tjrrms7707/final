<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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


	<!-- 지출정보 출력 -->
	<section class="bg-white" id="transOutput"
		style="padding-bottom: 0px; padding-top: 100px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">지출정보</h2>
				<h3 class="section-subheading text-muted">자신이 지출한 정보를 입력, 출력 할
					수 있습니다.</h3>
					<form action="detail.do?plan_code=<%=plan_code%>" method="post">
                  <input type="submit" value="Day-List" class="btn btn-primary" style="margin-bottom:20px">
               </form>
			</div>
		</div>
	</div>
	</section>
	<section class="bg-light" style="padding-top: 50px; padding-bottom: 50px">
	<div class="container">
		<!-- 지출 이미지 선택  -->
		<div class="pills">

			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"
				style="padding-left: 200px">

				<li class="nav-item"><a class="nav-link active"
					id="pills-home-tab" data-toggle="pill" href="#pills-home"
					role="tab" aria-controls="pills-home" aria-selected="true"><img
						name="e1" src="../img/expense/e1.PNG" width="100" height="100"></a></li>

				<li class="nav-item"><a class="nav-link" id="pills2"
					data-toggle="pill" href="#pills-2" role="tab"
					aria-controls="pills-2" aria-selected="false"> <img name="e2"
						src="../img/expense/e2.PNG" width="100" height="100"></a></li>

				<li class="nav-item"><a class="nav-link" id="pills3"
					data-toggle="pill" href="#pills-3" role="tab"
					aria-controls="pills-3" aria-selected="false"> <img name="e3"
						src="../img/expense/e3.PNG" width="100" height="100"></a></li>

				<li class="nav-item"><a class="nav-link" id="pills4"
					data-toggle="pill" href="#pills-4" role="tab"
					aria-controls="pills-4" aria-selected="false"> <img name="e4"
						src="../img/expense/e4.PNG" width="100" height="100"></a></li>

				<li class="nav-item"><a class="nav-link" id="pills5"
					data-toggle="pill" href="#pills-5" role="tab"
					aria-controls="pills-5" aria-selected="false"> <img name="e5"
						src="../img/expense/e5.PNG" width="100" height="100"></a></li>

			</ul>
		</div>



		<!-- 지출 별 출력  -->
		<div class="tab-content" id="pills-tabContent" >
			<!-- 교통 -->
			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">지출타입</th>
							<th scope="col">내용</th>
							<th scope="col">가격</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>

						<!-- 반복 PART -->
						<c:forEach var="list" items="${list1 }" varStatus="i">
							<tr>
								<th scope="row">${i.index+1 }</th>
								<td>교통</td>
								<td>${list.spend_contents}</td>
								<td>${list.spend_price}<br>
								<td>
									<!-- Trans_code 받아오기 --> <c:set var="spend_code"
										value="${list.spend_code }" /> <%
 	int spend_code = (int) pageContext.getAttribute("spend_code");
 %>

									<form
										action="deleteSpendCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&spend_code=<%=spend_code%>"
										method="post">
										<input type="submit" value="X"
											class="btn btn-outline-danger btn-sm">
									</form>
								</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

			<!-- 숙소 -->
			<div class="tab-pane fade" id="pills-2" role="tabpanel"
				aria-labelledby="a">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">지출타입</th>
							<th scope="col">내용</th>
							<th scope="col">가격</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>

						<!-- 반복 PART -->
						<c:forEach var="list" items="${list2 }" varStatus="i">
							<tr>
								<th scope="row">${i.index+1 }</th>
								<td>숙소</td>
								<td>${list.spend_contents}</td>
								<td>${list.spend_price}<br>
								<td>
									<!-- Trans_code 받아오기 --> <c:set var="spend_code"
										value="${list.spend_code }" /> <%
 	int spend_code = (int) pageContext.getAttribute("spend_code");
 %>

									<form
										action="deleteSpendCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&spend_code=<%=spend_code%>"
										method="post">
										<input type="submit" value="X"
											class="btn btn-outline-danger btn-sm">
									</form>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<!-- 식비 -->
			<div class="tab-pane fade" id="pills-3" role="tabpanel"
				aria-labelledby="a">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">지출타입</th>
							<th scope="col">내용</th>
							<th scope="col">가격</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>

						<!-- 반복 PART -->
						<c:forEach var="list" items="${list3 }" varStatus="i">
							<tr>
								<th scope="row">${i.index+1 }</th>
								<td>식비</td>
								<td>${list.spend_contents}</td>
								<td>${list.spend_price}<br>
								<td>
									<!-- Trans_code 받아오기 --> <c:set var="spend_code"
										value="${list.spend_code }" /> <%
 	int spend_code = (int) pageContext.getAttribute("spend_code");
 %>

									<form
										action="deleteSpendCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&spend_code=<%=spend_code%>"
										method="post">
										<input type="submit" value="X"
											class="btn btn-outline-danger btn-sm">
									</form>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<!-- 쇼핑 -->
			<div class="tab-pane fade" id="pills-4" role="tabpanel"
				aria-labelledby="a">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">지출타입</th>
							<th scope="col">내용</th>
							<th scope="col">가격</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>

						<!-- 반복 PART -->
						<c:forEach var="list" items="${list4 }" varStatus="i">
							<tr>
								<th scope="row">${i.index+1 }</th>
								<td>쇼핑</td>
								<td>${list.spend_contents}</td>
								<td>${list.spend_price}<br>
								<td>
									<!-- Trans_code 받아오기 --> <c:set var="spend_code"
										value="${list.spend_code }" /> <%
 	int spend_code = (int) pageContext.getAttribute("spend_code");
 %>

									<form
										action="deleteSpendCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&spend_code=<%=spend_code%>"
										method="post">
										<input type="submit" value="X"
											class="btn btn-outline-danger btn-sm">
									</form>
								</td>
							</tr>
                     ${list }
                     </c:forEach>

					</tbody>
				</table>
			</div>
			<!-- 기타 -->
			<div class="tab-pane fade" id="pills-5" role="tabpanel"
				aria-labelledby="a">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">지출타입</th>
							<th scope="col">내용</th>
							<th scope="col">가격</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>

						<!-- 반복 PART -->
						<c:forEach var="list" items="${list5 }" varStatus="i">
							<tr>
								<th scope="row">${i.index+1 }</th>
								<td>기타</td>
								<td>${list.spend_contents}</td>
								<td>${list.spend_price}<br>
								<td>
									<!-- Trans_code 받아오기 --> <c:set var="spend_code"
										value="${list.spend_code }" /> <%
 	int spend_code = (int) pageContext.getAttribute("spend_code");
 %>

									<form
										action="deleteSpendCode.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>&spend_code=<%=spend_code%>"
										method="post">
										<input type="submit" value="X"
											class="btn btn-outline-danger btn-sm">
									</form>
								</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>

		</div>
	</div>
	</section>
	<!-- 출력 종료 -->





	<!-- 교통 입력  -->
	<section class="bg-white" id="transInput" style="padding-top: 50px; padding-bottom: 50px" >
	<div class="container">
		<form
			action="insertSpend.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
			method="post" id="expenseInput">
			<div class="form-row">
				<!-- 선택  -->
				<div class="col-auto my-1">
					<select class="custom-select mr-sm-1" id="expenseType"
						name="spend_type">
						<option selected>선택</option>
						<option value="1">교통</option>
						<option value="2">숙소</option>
						<option value="3">식비</option>
						<option value="4">쇼핑</option>
						<option value="5">기타</option>
					</select>
				</div>
				<!-- 내용  -->
				<div class="form-group col-md-8">
					<input type="text" class="form-control" id="expenseContent"
						placeholder="TGV 2C 좌석" style="margin-top: 4px;"
						name="spend_contents">
				</div>
				<!-- 가격  -->
				<div class="form-group col-md-2">
					<input type="text" class="form-control" id="expensePrice"
						placeholder="150Euro" style="margin-top: 4px;" name="spend_price">
				</div>

				<!-- 추가버튼  -->
				<div class="col-md" style="margin-left: 30px">
					<input type="button" value="+" class="btn btn-outline-success"
						id="addbtn" style="height: 39px; margin-top: 5px;">
				</div>
			</div>
		</form>
	</div>

	</section>
	<!-- 입력종료  -->




	<!-- Custom scripts for this template -->
	<script src="../js/agency.min.js"></script>

	<script type="text/javascript">
		$("#addbtn").click(function() {

			if ($("#expensePrice").val() == "") {
				alert("가격 입력 오류");
				$("#expensePrice").focus();

			} else if ($("#expenseType").val() == "선택") {
				alert("지출타입 입력 오류");
				$("#expenseType").focus();
			} else if ($("#expenseContent").val() == "") {
				alert("내용 입력 오류");
				$("#expenseContent").focus();
			} else{
	            $("#expenseInput").submit();
	         }
		});
	</script>
	<%@ include file="../module/footer.jsp"%>

</body>

</html>