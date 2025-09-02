<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="login" action="Join_Result.jsp">
		<%!String id = "test92";
			int pwd = 12345678 ;
	
		%>


		<div>
			<label>아이디 : <input type="test" name="userId"></label>
		</div>

		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>
		
		<div>
			<label>비밀번호확인 : <input type="passwordCheck" name="pwd"></label>
		</div>
		
		<div>
			<label>휴대폰번호 : <input type="phonNumber" name="Number"></label>
		</div>
		
		<div>
			<label>성별 : <input type="reger" name="resert"></label>
		</div>

		<div>
			취미: <label><input type="checkbox" name="hobby" value="운동">운동</label>
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
		</div>

		<div>
			<input type="submit" value="가입"> <input type="button"
				value="로그인" onclick="fnCheck()"> <input type="button"
				value="회원가입">
		</div>
	</form>
</body>
</html>
<script>
	function fnCheck() {
		let login = document.login;
		if (login.userId.value.length == 0) {
			alert("아이디를 입력해주세요.");
			login.userId.focus();
			return;
		}
		if (login.pwd.value.length == 0) {
			alert("비밀번호를 확인해주세요.");
			login.pwd.focus();
			return;
		}
		login.submit();
	}
</script>