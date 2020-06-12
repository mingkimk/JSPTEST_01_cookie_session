<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Cookie c = new Cookie("id","");
	c.setMaxAge(0);
	response.addCookie(c);
	response.sendRedirect("login_ok.jsp");
	%>

</body>
</html>