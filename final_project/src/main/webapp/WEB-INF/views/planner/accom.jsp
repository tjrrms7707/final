<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<!-- Custom styles for this template -->
<link href="/resources/css/agency.min.css" rel="stylesheet">
<link href="/resources/css/1day.css" rel="stylesheet">
<%@ include file="../include/head.jsp" %>
</head>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/carousel.jsp" %>
<body>
	<%@ include file="../include/middleNav.jsp"%>

	<!-- plan_code & list_code 추출 -->
	<c:set var="list_code" value="${list_code }" />
	<c:set var="plan_code" value="${plan_code }" />
	<%
		String plan_code = (String) pageContext.getAttribute("plan_code");
		String list_code = (String) pageContext.getAttribute("list_code");
	%>



	<section class="bg-white" id="transOutput"
		style="padding-bottom: 0px; padding-top: 100px;">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">숙소관리</h2>
				<h3 class="section-subheading text-muted">숙소정보를 작성, 편집할 수 있습니다.</h3>
				<form action="plannerDetail?plan_code=<%=plan_code%>" method="post">
                  <input type="submit" value="Day-List" class="btn btn-primary">
               </form>
			</div>
		</div>
	</section>
	<section class="bg-light" style="padding-top: 50px; padding-bottom: 50px">
		<div class="container">
			<div id="accordion" role="tablist">
				<div class="card">
					<div class="card-header" role="tab" id="headingOne">
						<h5 class="mb-0">
							<a data-toggle="collapse" href="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne"> 숙소 입력 </a>
						</h5>
					</div>
					<!-- 입력  -->
					<div id="collapseOne" class="collapse" role="tabpanel"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
							<div class="row">

								<form style="width: 650px; height: 390px; margin-right: 30px"
									id="accom"
									action="insertAccom.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
									method="post">

									<!--1행 시작  -->
									<div class="form-row">

										<!-- 숙소타입 -->
										<div class="col-3">
											<label for="accomType" class="col-form-label">숙소타입</label> <select
												class="custom-select" id="acoomType" name="accom_type">
												<option selected>선택</option>
												<option value="호텔">호텔</option>
												<option value="호스텔">호스텔</option>
												<option value="모텔">모텔</option>
												<option value="아파트먼트">아파트먼트</option>
												<option value="펜션">펜션</option>
												<option value="비앤비">비앤비</option>
												<option value="기타">기타</option>
											</select>
										</div>
										<!-- 숙소명  -->
										<div class="form-group col-md-9">
											<label for="accomName" class="col-form-label">숙소명</label> <input
												type="text" class="form-control" id="accomName"
												name="accom_name" placeholder="Hilton Palace Paris">
										</div>

									</div>
									<!-- 1행 끝  -->

									<!-- 2행 시작 -->
									<div class="form-row">
										<!-- 체크인 -->
										<div class="form-group col-md-4">
											<label class="col-form-label" style="padding-right: 30px">Check-in
											</label> <input name="accom_check_in" id="startDate6" type="date">
										</div>
										<div class="form-group col-md-4">

											<label class="col-form-label" style="padding-right: 30px">Check-out
											</label> <input name="accom_check_out" id="endDate6" type="date">
										</div>
									</div>
									<!-- 2행 끝  -->

									<!-- 내용  -->
									<div class="form-group">
										<label for="Textarea1">상세내용</label>
										<textarea class="form-control" style="height: 174px"
											id="Textarea1" rows="3" name="accom_contents"
											placeholder="Van Gogh, The Starry Night "></textarea>
									</div>
									<!-- 주소  -->

								</form>

								<!-- 지도  -->
								<input id="pac-input" class="controls" type="text"
									placeholder="Search Box">
								<div class="col" id="map" style="max-height: 380px"></div>
							</div>

						</div>
						<!-- 버튼  -->
						<div class="row">
							<button type="button" class="btn btn-outline-success"
								id="submitbtn"
								style="margin-right: 30px; margin-left: 530px; margin-bottom: 10px">+</button>

						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- 출력 -->
	<section class="bg-white" style="padding-top: 50px; padding-bottom: 50px">
		<div class="container">
			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col" style="width: 44px">#</th>
							<th scope="col" style="width: 94px">숙소타입</th>
							<th scope="col" style="width: 164px">숙소명</th>
							<th scope="col" style="width: 164px">체크인</th>
							<th scope="col" style="width: 164px">체크아웃</th>
							<th scope="col">상세내용</th>
							<th scope="col" style="width: 57px">삭제</th>
						</tr>
					</thead>
					<tbody>

						<!-- 반복 PART -->
						<tr>
							<c:if test="${accom ne null}">
								<th scope="row">1</th>
								<td>${accom.accom_type }</td>
								<td>${accom.accom_name }</td>
								<td>${accom.accom_check_in }</td>
								<td>${accom.accom_check_out }</td>
								<td><div id="outputAccord" data-children=".item">
										<div class="item">
											<a data-toggle="collapse" data-parent="#exampleAccordion"
												href="#exampleAccordion1" aria-expanded="true"
												aria-controls="exampleAccordion1"> 자세히 보기 </a>
											<div id="exampleAccordion1" class="collapse" role="tabpanel">
												<p class="mb-3">${accom.accom_contents }</p>
											</div>
										</div>
									</div></td>
								<td>
									<form
										action="deleteAccom.do?plan_code=<%=plan_code%>&list_code=<%=list_code%>"
										method="post">
										<!-- 삭제버튼 -->
										<input type="submit" class="btn btn-outline-danger btn-sm"
											value="X">
									</form>
								</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</section>





	<!-- Custom scripts for this template -->
	<script src="/resources/js/agency.min.js"></script>

	<!-- Google Map  -->
	<script>
		function initAutocomplete() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 37.579872,
					lng : 126.977030
				},
				zoom : 9,
				mapTypeId : 'roadmap'
			});

			// Create the search box and link it to the UI element.
			var input = document.getElementById('pac-input');
			var searchBox = new google.maps.places.SearchBox(input);
			map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

			// Bias the SearchBox results towards current map's viewport.
			map.addListener('bounds_changed', function() {
				searchBox.setBounds(map.getBounds());
			});

			var markers = [];
			// Listen for the event fired when the user selects a prediction and retrieve
			// more details for that place.
			searchBox.addListener('places_changed', function() {
				var places = searchBox.getPlaces();

				if (places.length == 0) {
					return;
				}

				// Clear out the old markers.
				markers.forEach(function(marker) {
					marker.setMap(null);
				});
				markers = [];

				// For each place, get the icon, name and location.
				var bounds = new google.maps.LatLngBounds();
				places.forEach(function(place) {
					if (!place.geometry) {
						console.log("Returned place contains no geometry");
						return;
					}
					var icon = {
						url : place.icon,
						size : new google.maps.Size(71, 71),
						origin : new google.maps.Point(0, 0),
						anchor : new google.maps.Point(17, 34),
						scaledSize : new google.maps.Size(25, 25)
					};

					// Create a marker for each place.
					markers.push(new google.maps.Marker({
						map : map,
						icon : icon,
						title : place.name,
						position : place.geometry.location
					}));

					if (place.geometry.viewport) {
						// Only geocodes have viewport.
						bounds.union(place.geometry.viewport);
					} else {
						bounds.extend(place.geometry.location);
					}
				});
				map.fitBounds(bounds);
			});
		}

		$("#submitbtn").click(function() {
	         if ($("#startDate6").val() > $("#endDate6").val()) {
	            alert("날짜 입력 오류");
	            $("#endDate6").focus();
	         } else {
	            if ($("#startDate6").val() == "") {
	               alert("시작일 입력 오류");
	               $("#startDate6").focus();
	            } else if ($("#endDate6").val() == "") {
	               alert("종료일 입력 오류");
	               $("#endDate6").focus();
	            }

	            else if ($("#accomName").val() == "") {
	               alert("숙소명 입력 오류");
	               $("#accomName").focus();
	            } else if ($("#acoomType").val() == "선택") {
	               alert("숙소타입 입력 오류");
	               $("#acoomType").focus();
	            }
	            else{
	               $("#accomInput").submit();
	            }
	         }
	      });
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCALwb30V-kdqWWgZimc5bFCQ9M6MDrP4&libraries=places&callback=initAutocomplete"
		async defer></script>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>