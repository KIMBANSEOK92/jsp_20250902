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
		margin: 50px auto;
	}
	table, tr, td, th {
		border : 1px solid black;
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
 		margin-bottom: 20px ;
 	}
 	a {
 		text-decoration: none;
		
 	}
 	.page a{
 		text-decoration: none;
 		color: black;
 		padding: 5px;
 		text-align: center;
 	}
 	.page .active {
 		font-weight: bold;
 		color: red;
 	}
 	

</style>
</head>
<body>
	<%@ include file="../db.jsp" %>
<div id="container">
	<div id="search">
		검색어 : <input type="text" id="keyword">
				 <button onclick="fnSearch()">검색</button>
	</div>
	<div>
		<select id="number" onchange="fnNumber(this.value)"> 
			<%
				int arr[] = {3,5,7,10,15,20};
				for(int i=0; i<arr.length; i++){
			%>
				<option value="<%= arr[i] %>"><%= arr[i] + "개씩" %></option>					
			<%		
				}
			%>
		</select>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>
			<% 
			String orderKind = request.getParameter("orderKind");
			if(orderKind == null){
			%>
				<a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수</a>
			<% 
			} else if(orderKind.equals("DESC")){
			%>
				<a href="javascript:;" onclick="fnList('CNT', 'ASC')">조회수🔻</a>
			<%	
			} else {
			%>
				<a href="javascript:;" onclick="fnList('CNT', 'DESC')">조회수🔺</a>
			<% 
			}
			
			%>
					
			</th>
			<th>작성일</th>
		</tr>
	
	<%
			ResultSet rs = null;
			String keyword = request.getParameter("keyword");	
	
			String keywordQuery = "";
			if(keyword != null){
			keywordQuery = "WHERE TITLE LIKE '%" + keyword + "%'";
			
			}
		
	 	String column = request.getParameter("column");
	 	/* String orderKind = request.getParameter("orderKind");*/
		String orderQuery = "";
		if(column != null){
			orderQuery = "ORDER BY " + column + " " + orderKind;
		} 
		/* 페이징 변수 */
		int pageSize = 5; // 한페이지에 몇개씩 보여줄지 
		int currentPage = 1;
		
		if(request.getParameter("size") != null) {
			pageSize = Integer.parseInt(request.getParameter("size"));
		}
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		}
		/* 현재 페이지 위치에 따라서 가져올 값을 정하기 위해 offset 구하기 */
		int offset = (currentPage - 1 ) * pageSize;
		
		
		String cntQuery = "SELECT COUNT(*) TOTAL FROM TBL_BOARD";
		ResultSet rsCnt = stmt.executeQuery(cntQuery);
		rsCnt.next();
		
		int total = rsCnt.getInt("TOTAL");
		
		int pageList = (int) Math.ceil((double) total / pageSize);
		
		String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY.MM.DD') CTIME FROM TBL_BOARD B " + keywordQuery + orderQuery
									+ " OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROW ONLY" ;
						
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
	%>
		<tr>
			<td> <%= rs.getString("BOARDNO") %></td>
			<td> 
				 <a href="Board_View.jsp?boardNo=<%= rs.getString("BOARDNO") %>"><%= rs.getString("TITLE") %></a>
				 <a href="javascript;" onclick="fnBoard"> </a>
			</td>
			<td> <%= rs.getString("USERID") %></td>
			<td><%= rs.getString("CNT") %></td>
			<td> <%= rs.getString("CTIME") %></td>
		</tr>
	<% 		
		}
		
	%>
		
	</table>
	<div class="page">
		<%
			for(int i=1; i<=pageList; i++){
				if(i == currentPage){
					 out.println("<a href='?page=" + i + "&size="+ pageSize +"' class='active'>" + i + "</a>");
				} else {
				    out.println("<a href='?page=" + i + "&size="+ pageSize +"'>" + i + "</a>");
				}
			}
		%>
	</div>
	<div>
		<a href="Board-Add.jsp">
			<input type="button" value="글쓰기">
		</a>
	</div>
</div>
		
</body>
</html>
<script>
	function fnBoard(boardNo) {
		location.href = "Board_View.jsp?boardNo="+boardNo;
		
	}
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href = "Board_List.jsp?keyword="+keyword;
		
	}
	function fnList(column, orderKind) {
		location.href ="?column="+column+"&orderKind="+orderKind;
	}
	function fnNumber(number) {
		location.href ="?size="+number;
	}

</script>