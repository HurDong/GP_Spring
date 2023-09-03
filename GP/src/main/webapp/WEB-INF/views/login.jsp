<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body>
	<h1>Login Page</h1>
	<form action="/perform_login" method="post">
		<label for="id">ID:</label> <input type="text" id="id" name="id"
			required><br> <label for="password">Password:</label> <input
			type="password" id="password" name="password" required><br>

		<input type="submit" value="Login">
	</form>
</body>
</html>
