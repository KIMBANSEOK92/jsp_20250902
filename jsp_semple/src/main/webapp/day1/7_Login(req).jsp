<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- form태그의 action을 실행하게 되면(submit)  -->
		<!-- 내부에 있는 input박스의 값들을 파라미터로 보낸다. -->
		<!-- 이때, name속성이 key, 입력받은 값이 value -->	
		
		<!-- method속성(전송방식)은 생략이 가능. default는 get -->
		<!-- get 전송방식은 url(주소)에 값을 담아서 보낸다. 보안에 취약하다. -->
		<!-- 사용자 개인정보나 패스워드 등을 전송할 때 사용하면 안된다. -->
		<!-- 간단한 정보를 보낼 때 주로 사용 -->
		
		<!-- post 전송방식은 get이랑 반대(데이터를 숨겨서 보낸다.) -->
		
		<!-- 실습할때는 데이터 확인을 위해 주로 get으로 진행하겠습니다. -->
	<form action="8_LoginRestult.jsp" method="post">
		<div>
			<label>아이디 : <input type="text" name="userId"></label>
		</div>
		
		<div>
			<label>패스워드 : <input type="password" name="pwd"></label> <!-- name은 결국 key값 좌표를 의미한다.  -->
		</div>
		
		<div>
			<input type="submit" value="이동"> <!-- form태그의 action에 있는 페이지로 이동 -->
		</div>
	</form>
</body>
</html>