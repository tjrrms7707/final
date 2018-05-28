	getAllList();
		function getAllList(){
			$.getJSON("/plannerJson",function(data) {
						var input = 
								"<div class='col-md-4 col-sm-6 portfolio-item' >"
								+"<a class='portfolio-link' href='#portfolioModal6'  data-toggle='modal'>"
								+"<div class='portfolio-hover'>"
								+"<div class='portfolio-hover-content'>"
								+"<i class='fa fa-plus fa-3x'></i>"
								+"</div>"
								+"</div>"
								+ "<img class='img-fluid'src='/resources/img/portfolio/06-thumbnail.jpg' alt=''>"
								+ "</a><div class='portfolio-caption'>"
								+ "<h4>여행을 계획하세요</h4>"
								+"<p class='text-muted'>###</p>"
								+"<p class='text-muted'>###</p>"
								+ "</div>" 
								+ "</div>";
						var str = "";
						$(data).each(function() {
											str += "<div class='col-md-4 col-sm-6 portfolio-item'>"
													+ "<a class='portfolio-link' " 
													+"href='plannerDetail?plan_code="+this.plan_code+"'>"
													+ "<div class='portfolio-hover'></div>"
													+ "<img class='img-fluid'src='/resources/img/portfolio/02-thumbnail.jpg' alt=''>"
													+ "</a><div class='portfolio-caption'>"
													+ "<h4>"
													+ this.plan_name
													+ "</h4>"
													+ "<h5>"
													+ this.plan_city
													+ "</h5>"
													+ "<p class='text-muted'>"
													+ this.start_date
													+ "~"
													+ this.end_date
													+ "</p>"
													+ "</div>"
													+ "</div>";
										});
						$('#planList').html(input+str);
					});
		}

		$("#plannerButton").click(function() {
			if ($("#start_date").val() > $("#end_date").val()) {
				alert("날짜 입력 오류");
				$("#end_date").focus();
			} else {
				if ($("#start_date").val() == "") {
					alert("시작일 입력 오류");
					$("#start_date").focus();
				} else if ($("#endDate6").val() == "") {
					alert("종료일 입력 오류");
					$("#end_date").focus();
				} else if ($("#plan_name").val() == "") {
					alert("플랜 제목 입력 오류");
					$("#plan_name").focus();
				} else if ($("#plan_city").val() == "") {
					alert("도시 입력 오류");
					$("#plan_city").focus();
				} else {
					var start_date = $("#start_date").val();
					console.log(start_date);
					var end_date = $("#end_date").val();
					var plan_city = $("#plan_city").val();
					var plan_name = $("#plan_name").val();
					$.ajax({
						type : 'post',
						url : '/planner',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							member_id : 'kosta180',
							start_date : start_date,
							end_date : end_date,
							plan_city : plan_city,
							plan_name : plan_name
						}),
						success : function(result) {
							if (result == "SUCCESS") {
								getAllList();
							
							}
						}
					})
					$("#portfolioModal6").modal("hide");
				}
			}
		});
		
		$('#portfolioModal6').on('hidden.bs.modal', function (e) {
			  $(this).find('form')[0].reset()
			});