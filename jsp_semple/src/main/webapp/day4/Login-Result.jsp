<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="db.jsp" %>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String query = "SELECT * FROM TBL_USER "
					   + "WHERE USERID = '" + id + "' "
					   + "AND PASSWORD = '" + pwd + "' ";	
		ResultSet rs = stmt.executeQuery(query);
		if(rs.next()){
			out.println("로그인되셨습니다.");
			String loginId = rs.getString("USERID");
			String status = rs.getString("STATUS");
			
			session.setAttribute("sId", loginId); // session에 아이디 비밀번호 저장
			session.setAttribute("status", status);
			
			response.sendRedirect("Emp-list.jsp"); // 내가 이동할 페이지
			
		} else {
			out.println("다시확인해주세요.");
		}
				
	%>
</body>
</html>