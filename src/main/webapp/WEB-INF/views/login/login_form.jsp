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
		ID: <input type="text" name="id"><br> Password: <input
			type="password" name="pwd"><br>
		<button type="submit">Login</button>
	</form>
	<c:if test="${not empty error}">
		<div style="color: red;">${error}</div>
	</c:if>
</body>
</html>