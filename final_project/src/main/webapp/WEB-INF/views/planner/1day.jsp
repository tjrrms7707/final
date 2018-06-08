<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>


<!-- Custom styles for this template -->
<link href="/resources/css/agency.min.css" rel="stylesheet">
<link href="resources/css/1day.css" rel="stylesheet">
<%@ include file="../include/head.jsp" %>
</head>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/carousel.jsp" %>
<body>

	<%@ include file="../include/middleNav.jsp"%>

	<input type="hidden" value="${list_code }" id="code">


	<section class="bg-white" id="transOutput"
		style="padding-bottom: 0px; padding-top: 50px;">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">일정관리</h2>
				<h3 class="section-subheading text-muted">상세일정을 작성, 편집할 수 있습니다.</h3>
				<form action="plannerDetail" method="get">
                  <input type="hidden" value="${plan_code }" name="plan_code" class="btn btn-primary">
                  <input type="submit" value="Day-List" class="btn btn-primary">
               </form>
			</div>
		</div>
	</section>

	<section class="bg-light" style="padding-top: 50px; padding-bottom: 50px" >
		<div class="container">
			<div id="accordion" role="tablist">
				<div class="card">
					<div class="card-header" role="tab" id="headingOne">
						<h5 class="mb-0">
							<a data-toggle="collapse" href="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne"> 일정 입력 </a>
						</h5>
					</div>
					<!-- 입력  -->
					<div id="collapseOne" class="collapse" role="tabpanel"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
							<div class="row">

								<form style="width: 650px; height: 300px; margin-right: 30px"
									action="insert_Day" id="insertDay">
									<!-- 시간  -->
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputTime" class="col-form-label">시간</label> 
											<input type="time" class="form-control" id="day_time"
												name="day_time" >
										</div>

										<!-- 제목  -->
										<div class="form-group col-md-6">
											<label for="inputsub" class="col-form-label">제목</label> <input
												type="text" class="form-control" id="day_title"
												name="day_title" placeholder="오르세 미술관">
										</div>
									</div>
									<!-- 1행 끝  -->

									<!-- 내용  -->
									<div class="form-group">
										<label for="inputText">상세내용</label>
										<textarea class="form-control" style="height: 174px"
											id="day_contents" rows="3"
											placeholder="Van Gogh, The Starry Night " name="day_contents"></textarea>
									</div>
								</form>

								<!-- 지도  -->
								<input id="pac-input" class="controls" type="text"
									placeholder="Search Box">
								<div class="col" id="map" style="max-height: 300px"></div>
							</div>
							<!-- 버튼  -->
							<div class="row">
								<button type="button" id="button1"
									class="btn btn-outline-success"
									style="margin-right: 30px; margin-left: 530px;">+</button>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>






	<!-- 출력 -->
	<section class="bg-white" style="padding-top: 50px; padding-bottom: 0px">
		<div class="container">
			<div class="row">
				<table class="table table-hover;" style="text-align:center">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">시간</th>
							<th scope="col" style="width:300px">제목</th>
							<th scope="col" style="padding-left: 0px">상세내용</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody id="tbody">

				<%-- 		<c:forEach var="list" items="${listDay }" varStatus="i">

							<!-- plan_code & list_code 추출 -->
							<c:set var="day_code" value="${list.day_code }" />
							<%
								int day_code = (int) pageContext.getAttribute("day_code");
							%>
							<!-- 반복 PART -->
							<tr>
								<!-- 번호 -->
								<th scope="row" style="width: 54px;">${i.index+1 }</th>
								<!-- 시간 -->
								<td style="width: 64px;">${list.day_time }</td>
								<!-- 제목 -->
								<td id="outsubject" style="width: 200px;">${list.day_title }<br>
									<!-- 내용 -->
								<td><div id="outputAccord" data-children=".item">
										<div class="item">
											<a data-toggle="collapse" data-parent="#exampleAccordion"
												href="#<%=day_code%>" aria-expanded="true"
												aria-controls="<%=day_code%>"> 자세히 보기 </a>
											<div id="<%=day_code%>" class="collapse" role="tabpanel">
												<p class="mb-3">${list.day_contents }</p>
											</div>
										</div>
									</div></td>
								<td style="width: 59px;">
									<form
										action="deleteDay.do?day_code=<%=day_code%>&plan_code=<%=plan_code%>&list_code=<%=list_code%>"
										method="post">
										<input type="submit" id="button2"
											class="btn btn-outline-danger btn-sm"
											onclick="button2_click(2);" value="X">
									</form>
								</td>

							</tr> 
						</c:forEach>--%>

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

	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCALwb30V-kdqWWgZimc5bFCQ9M6MDrP4&libraries=places&callback=initAutocomplete"
		async defer></script>
	<script src="/resources/js/planner/1day.js"></script>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>