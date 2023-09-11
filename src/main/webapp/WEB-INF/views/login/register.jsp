<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/register" method="post">
    아이디: <input type="text" name="mid" required><br>
    비밀번호: <input type="password" name="mpwd" required><br>
    이름: <input type="text" name="mname" required><br>
    생년월일: <input type="date" name="mbirth" required><br>
    성별: 
    <input type="radio" id="male" name="mgender" value="0">
    <label for="male">남자</label>
    <input type="radio" id="female" name="mgender" value="1">
    <label for="female">여자</label><br>
    전화번호: <input type="text" name="mtel" required><br>
    <button type="submit">회원가입</button>
</form>
	
</body>
</html>