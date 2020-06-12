<%@ page import="java.util.Enumeration" %>
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
	String nowid = (String)session.getAttribute("id"); //세션의 영역에서 아이디를 가져와라  (브라우저에 있는 세션에서  아이디를 가져와라)
	
	if(nowid==null){
		response.sendRedirect("login_form_session.jsp");
	}else{
	
		out.print(nowid+"님 어솨~");
		out.print("<br> <a href='login_session_del.jsp'> 세션삭제 </a><br>");
	}	
	// 모든 세션 가져오기
	Enumeration names = session.getAttributeNames();
	while(names.hasMoreElements()){
		String name=names.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println(name+" : "+value+"<br");
	}
	//세션 정보
	%>
	<%
		String id_str = session.getId();
		long lasttime = session.getLastAccessedTime();
		long createdtime = session.getCreationTime();
		long time_used = (lasttime - createdtime) / 60000;
		int inactive = session.getMaxInactiveInterval() / 60;
		boolean b_new = session.isNew();
	%>
	<hr>
	[1] 세션 ID는 [
	<%=session.getId()%>] 입니다.
	<br>
	<hr>
	[2] 당신이 웹 사이트에 머문 시간은
	<%=time_used%>
	분입니다.
	<br>
	<hr>
	[3] 세션의 유효 시간은
	<%=inactive%>
	분입니다.
	<br>
	<hr>
	[4] 세션이 새로 만들어졌나요?
	<br>
	<%
		if (b_new)
			out.print(" 예! 새로운 세션을 만들었습니다.");
		else
			out.print(" 아니오! 새로운 세션을 만들지 않았습니다.");
	%>

</body>
</html>