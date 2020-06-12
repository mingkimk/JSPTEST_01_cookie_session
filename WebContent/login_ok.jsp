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
	
	Cookie[] cookies = request.getCookies();
	for(Cookie k : cookies){
		out.print(k.getName()+" : "+k.getValue()+"<br>");
		pageContext.setAttribute(k.getName(), k.getValue());
	}
	
	String nowid = (String)pageContext.getAttribute("id");
	String nowuser = (String)pageContext.getAttribute("name");
	
	if(nowid==null){
		response.sendRedirect("login_form.jsp");
	}else{
		out.print(nowuser+"("+nowid+")님 어솨~");
		out.print("<br> <a href='login_cookie_del.jsp'> 쿠키삭제 </a>");
	}

%>
</body>
</html>