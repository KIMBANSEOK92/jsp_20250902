<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1.선언문 -->
	<!-- 자바문법으로 변수나 메소드 선언 -->
	<%!// 선언문
	String name = "홍길동"; // 전역변수
	int sum(int x, int y) {
		return x + y;
	}%>
	<!-- 표현식 -->
	<!-- 선언문이나 스클립틀릿에서 선언된 값(변수 혹은 메소드)를 출력  -->
	<!-- 메소드는 리턴타입이 있는 메소드가 호출 가능 -->
	<div style="color: blue;"><%=name%></div>
	<h2><%= sum(1, 5)%></h2>

	<!-- 스크립틀릿 -->
	<!-- 자바의 실행문을 그대로 표현(자바 문법들 사용 가능) -->
	<!-- 변수 선언은 가능하나, 지역변수 -->
	<!-- 메소드는 선언 불가(호출은 가능) -->
	<%
		System.out.println(name + "입니다."); // 콘솔창에서 출력이됨
		out.println("<h1>" + name + "입니다.</h1>"); // 브라우저에 출력이됨
		
		for(int i=1; i<=10; i++){
			out.print(i + " ");
		}
		
	%>

</body>

</html>