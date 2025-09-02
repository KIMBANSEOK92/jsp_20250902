
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
	String id = request.getParameter("userId");
	String hobby[] = request.getParameterValues("hobby"); /* 여러개의 매소드를 가져오려면 getParameterValues를 써야한다.  */

	/*out.println(Arrays.String(hobby));*/
	for (int i = 0; i < hobby.length; i++) {
		out.println(hobby[i]);
	}
	%>







</body>
</html>