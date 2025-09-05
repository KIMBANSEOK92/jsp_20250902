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
		String empNo = request.getParameter("empNo");
		String empName = request.getParameter("empName");
		String sal = request.getParameter("sal");
		String deptNo = request.getParameter("deptNo");
		
		String query = "INSERT INTO EMP(EMPNO, ENAME, SAL, DEPTNO) VALUES("
					+ "'" + empNo + "', "
					+ "'" + empName + "', "
					+ "'" + sal + "', "
					+ "'" + deptNo + "' "
					+ ")";
		int result = 0;
		try{	
			result = stmt.executeUpdate(query);
				/* out.println("추가되셨습니다.");	*/
				out.println("<input id='result' value='T' hidden>");
		}catch(SQLException e){
				out.println("<input id='result' value='F' hidden>");
		}
 	 %>
</body>
</html>
<script>
	
	let result = document.querySelector("#result").value;
	if(result == 'T'){
		alert("추가되었습니다");	
		location.href="Emp-list.jsp";
	} else {
		alert("오류가 발생하셨습니다.");	
	}
</script>