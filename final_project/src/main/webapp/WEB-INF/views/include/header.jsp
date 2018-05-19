<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<nav class="navbar navbar-expand-sm bg-white">
		<!-- Brand/logo -->
		<a class="navbar-brand" href="main.do" id="top-logo"> <img
			src="resources/img/main/logo.PNG" alt="logo" style="width: 130px">
		</a>
		<!-- Links -->
		<ul class="navbar-nav" id="top-link-top">
			<li class="nav-item" id="top-link">
				<p class="text-primary text-right">
					<a class="nav-link" href="boardRegistForm.do">With Us 만들기</a>
				</p>
			</li>
			<li class="nav-item" id="top-link">
				<p class="text-primary">
					<%
						if (session.getAttribute("id") == null) {
					%>
					<a class="nav-link" href="#" data-toggle="modal"
						data-target="#loginModal">로그인</a>
					<%
						} else {
					%>
					<a class="nav-link" href="#" data-toggle="modal"
						data-target="#loginModal">로그아웃</a>
					<%
						}
					%>

				</p>
			</li>
			<%
				if (session.getAttribute("id") == null) {
			%>
			<li class="nav-item" id="top-link">
				<p class="text-primary">
					<a class="nav-link" href="sign.jsp">가입하기</a>
				</p>
			</li>
			<%
				} else {
			%>
			<li class="nav-item" id="top-link">
				<p class="text-primary">
					<a class="nav-link" href="myProfile.do">내정보</a>
				</p>
			</li>
			<%
				}
			%>

		</ul>
	</nav>


	


	<!-- Login try Modal -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header" style="background-color: #007bff">
					<%
						if (session.getAttribute("id") == null) {
					%>
					<h4 class="mb-0 text-white">Login to your account</h4>
					<%
						} else {
					%>
					<h4 class="mb-0 text-white">Logout to your account</h4>
					<%
						}
					%>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="card rounded-0 border-primary">
						<div class="card-body ">

							<!-- Login 전  -->
							<%
								if (session.getAttribute("id") == null) {
							%>
							<form class="form" role="form" autocomplete="off" id="formLogin"
								method="POST" action=login/logincheck.jsp>
								<!-- ID입력 -->
								<div class="form-group">
									<label for="input_id">Username</label> <input type="text"
										class="form-control form-control-lg rounded-0" name="input_id"
										required="">
									<div class="invalid-feedback">ID를 입력해주세요.</div>
								</div>

								<!-- PW입력 -->
								<div class="form-group">
									<label>Password</label> <input type="password"
										class="form-control form-control-lg rounded-0" required=""
										autocomplete="new-password" name="input_pw">
									<div class="invalid-feedback">암호를 입력해주세요.</div>
								</div>

								<button class="btn btn-primary btn-sm float-right" id="btnLogin">Login</button>
							</form>

							<!-- Login 후  -->
							<%
								} else {
							%>
							<!-- ID -->
							<div class="form-group">
								<h2>
									Welcome back,
									<%=session.getAttribute("id") + "님"%></h2>
							</div>
							<form action="login/logout.jsp" method="post">
								<button class="btn btn-primary btn-sm float-right"
									id="btnLogout">Logout</button>
							</form>
							<%
								}
							%>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Login JS  -->
	<script type="text/javascript">
		$("#btnLogin").click(function(event) {
	
			//Fetch form to apply custom Bootstrap validation
			var form = $("#formLogin")
	
			if (form[0].checkValidity() === false) {
				event.preventDefault()
				event.stopPropagation()
			}
	
			form.addClass('was-validated');
		});
	</script>

</header>