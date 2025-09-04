<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container {
	whdth: 700px;
	margin: 50px auto;
}

table, tr, td, th {
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
	padding: 5px 10px;
}

th {
	background: #eee;
}

tr:nth-child(odd) {
	background: #ccc;
}

#search {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="db.jsp" %>
<div id="container">
	<div id="search">
		검색어 : <input type="text" id="keyword">
				 <button onclick="fnSearch()">검색</button>
	</div>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>키</th>
		</tr>

	<%
			ResultSet rs = null;
			String keyword = request.getParameter("keyword");	
	
			String keywordQuery = "";
			if(keyword != null){
				keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%'";
			}
	
			String query = "SELECT * FROM STUDENT ";
						 
			rs = stmt.executeQuery(query);
	
			while(rs.next()){
	%>
		<tr>
			<td> <%= rs.getString("STU_NO") %></td>
			<td> 
				 <a href="Stu-View.jsp?stuNo=<%= rs.getString("STU_NO") %>"><%= rs.getString("STU_NAME") %></a>
				 <a href="javascript;" onclick="fnBoard"> </a>
			</td>
			<td> <%= rs.getString("STU_DEPT") %></td>
			<td> <%= rs.getString("STU_HEIGHT") %></td>
		</tr>
		
	<% 		
		}
		
	%>		
	</table>
</div>
	
</body>
</html>
<script>
	function fnBoard(stuNo) {
		location.href = "Stu-View.jsp?stuNo="+stuNo;
		
	}
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href = "Stu-List.jsp?keyword="+keyword;
		
	}

</script>