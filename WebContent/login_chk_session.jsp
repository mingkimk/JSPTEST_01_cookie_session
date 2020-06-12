<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String uid = "system";
	String pass = "11111111";
	String sql1 = "select * from member1 where id=?";
	String sql2 = "select * from member1 where id=? and pwd=?";
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("iid");
		String pwd = request.getParameter("ipwd");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, uid, pass);
			pstmt = conn.prepareStatement(sql1);
			//(4 단계) 바인딩 변수를 채운다.
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {  // id가 있다면
				pstmt = conn.prepareStatement(sql2);
				//(4 단계) 바인딩 변수를 채운다.
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					session.setAttribute("id", id);
					session.setAttribute("name", rs.getString("name"));
					response.sendRedirect("login_ok_session.jsp");
					
				}else{
	%>
				<script type="text/javascript">
					alert("비번틀림");
					history.go(-1);
				</script>
	<%
				}
	
			}else{
	%>
				<script type="text/javascript">
				alert("id없음");
				history.go(-1);
				</script>
	<%		}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} //finally의 끝
	%>
</body>
</html>