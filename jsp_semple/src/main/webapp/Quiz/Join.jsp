<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="join" action="Join_Result.jsp" method="get">

		<div>
			<label>아이디 : <input type="text" name="id"></label>
		</div>

		<div>
			<label>비밀번호 : <input type="password" name="pwd"></label>
		</div>

		<div>
			<label>비밀번호확인 : <input type="password" name="pwd2"></label>
		</div>

		<div>
			<label>이름 : <input type="name" name="userName"></label>
		</div>

		<div>
			핸드폰 : <label> <select name="phone">
					<option value="010">010</option>
					<option value="016">016</option>
					<option value="011">011</option>
					<option value="070">070</option>
			</select>
			</label>
		</div>

		<div>
			성별 : <label> <input type="radio" name="gender" value="M"
				checked>남
			</label> <label> <input type="radio" name="gender" value="F">여
			</label>
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
				value="로그인" onclick="fnCheck()">
		</div>
	</form>
</body>
</html>
<script>
	function fnCheck() {
		let join = document.join;
		if (join.id.value.length < 6) {
			alert("아이디는 최소 6글자입니다.");
			join.id.focus();
			return;
		}
		if (join.pwd.value.length < 8) {
			alert("비밀번호는 8글자 이상이어야 합니다.")
			join.pwd.focus();
			return;
		}
	}
	let pwdRule = flag.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
	if (!pwdRule.test(join.pwd.value)) {
		alert("비밀번호는 특수문자가 포함되어야합니다.");
		join.pwd.focus();
		return;
	}
	if (join.userName.value.length == 0) {
		alert("이름을 입력해주세요.");
		join.userName.focus();
		return;
	}
	join.submit();}
</script>