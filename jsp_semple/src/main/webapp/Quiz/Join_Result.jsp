
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userId = request.getParameter("userId");
	String password = request.getParameter("pwd");
	String name = request.getParameter("userName");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	%>
	
	<div>
		아이디 :
		<%=userId%></div>
	<div>
		비밀번호 :
		<%=password%></div>
	<div>
		이름 :
		<%=name%></div>
	<div>
		번호 :
		<%=phone%></div>
	<div>
		성별 :
		<%=gender%></div>
</body>
</html>