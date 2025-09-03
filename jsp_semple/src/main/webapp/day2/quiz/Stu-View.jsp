<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
		whdth : 700px;
		margin: 20px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse: collapse;
		padding: 5px 10px;
		
	}
	th {
		background-color : #ccc;
		width: 100px;
	}
	td {
	  width:500px;
	}
	.contents {
		height: 300px;
	}
</style>
</head>
<body>
	<%@ include file="db.jsp" %>
<div id="contesnts">	
	<% 
		ResultSet rs = null;
	 	String stuNo = request.getParameter("stuNo");
	 	String query = "SELECT * FROM STUDENT "
	 				   + "WHERE STU_NO = " + stuNo;
	 	rs = stmt.executeQuery(query);
	 	if(rs.next()){
	 %>		
 
		<form name="student" action="Stu_Remove.jsp">
		<input name="stuNo" value="<%= rs.getString("STU_NO")%>" hidden>
	 	<table>
	 	  <tr>
	 	  	<th>학번</th>
	 	  	<td><%= rs.getString("STU_NO") %></td>
	 	  </tr>
	 	  
	 	  <tr>
	 	  	<th>이름</th>
	 	  	<td><%= rs.getString("STU_NAME") %></td>
	 	  </tr>
	 	  
	 	  <tr>
	 	  	<th>학과</th>
	 	  	<td><%= rs.getString("STU_DEPT") %></td>
	 	  </tr>
	 	  
	 	  <tr>
	 	  	<th>평균점수</th>
	 	  	<td class="grade"><%= rs.getString("STU_GRADE") %></td>
	 	  </tr>
	 	
	 	</table>
	 	<div>
	 		<!-- <input type="submit" value="삭제">  -->
	 		<input type="button" value="삭제" onclick="fnRemove()">
	 	</div>
	 	</form>	 
	 <%
	 	} else {
	 		out.println("게시글 조회에 실패했습니다.");
	 	}
	 %>
	
	</table>	
	</div>	
</body>

</html>
<script>
	function fnRemove() {
		let student = document.student;
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		student.submit();
	}
</script>
