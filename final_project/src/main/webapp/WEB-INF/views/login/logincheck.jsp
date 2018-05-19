<%-- <%@page import="kosta.withus.service.WithUsService"%> --%>
<%-- <%@page import="sun.print.resources.serviceui"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 체크 페이지</h1>

	<%
		try {
			// 드라이버 로딩
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);

			// 관리자 Login
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			String id = "kosta180";
			String pw = "1234";

			// 연결
			Connection conn = DriverManager.getConnection(url, id, pw);

			
			// Login Modal input에 입력한 값들을 변수에 담는다
			String user_id = request.getParameter("input_id");
			String user_pw = request.getParameter("input_pw");

			Statement st = conn.createStatement();
			// 내가 입력한 id와 pw 값이 DB안에 있는지 확인한다
			String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID='" + user_id + "' AND MEMBER_PASS='" + user_pw + "'";
			st.executeUpdate(sql);
			ResultSet rs = st.executeQuery(sql);

			// isLogin 은 로그인 확인 유무를 위한 변수
			Boolean isLogin = false;
			while (rs.next()) {
				// rs.next가 true 라면 = 정보가 있다
				isLogin = true;
			}

			// DB에 내가 적은 정보가 있다면
			if (isLogin) {
				// 지금 로그인할 id와 pw를 session에 저장하고
				WithUsService service = WithUsService.getInstance();
          		String member_code = service.selectMemberCodeService(user_id);
				
          		session.setAttribute("member_code", member_code);
				session.setAttribute("id", user_id);
				session.setAttribute("pw", user_pw);
				// 첫 페이지로 돌려보낸다
				response.sendRedirect("../main.do");
			} else {
				// DB에 내가적은 정보가 없다면 경고창을 띄워준다
	%>
	<script>
		alert("로그인 실패");
		history.go(-1);
	</script>
	<%
		}

		} catch (Exception e) {
			out.println("DB 연동 실패");
		}
	%>
</body>
</html>