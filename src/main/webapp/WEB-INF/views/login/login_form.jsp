<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form action="/login" method="post">
		아이디 : <input type="text" name="mid"><br> 비밀번호 : <input
			type="password" name="mpwd"><br>
		<button type="submit">로 그 인</button>
		<button type="button" onclick="window.location.href='/register'">회원가입</button>
	</form>
	<c:if test="${not empty error}">
		<div style="color: red;">${error}</div>
	</c:if>
</body>
</html>