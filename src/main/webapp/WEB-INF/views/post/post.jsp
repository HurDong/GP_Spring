<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

#nav-bar {
	display: flex;
	justify-content: space-around;
	background-color: #ffcd36;
	height: 50px;
	line-height: 50px;
}

#nav-bar button {
	flex: 1;
	margin: 0;
	border-right: 1px solid #000;
	text-align: center;
}

#nav-bar button:last-child {
	border-right: none;
}

button {
	background-color: #ffcd36;
	border: none;
	border-radius: 3px;
	color: #302A24;
	cursor: pointer;
	font-size: 16px;
	margin-top: 10px;
	padding: 10px 20px;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #302A24;
	color: #fff;
}

button:focus {
	outline: none;
}
</style>
</head>
<body>
	<div id="nav-bar">
		<button id="meet-button">❓어디서 만나❓</button>
		<button id="reset-button">✨마커 초기화✨</button>
		<button id="search-restaurants">🔍맛집 검색🔍</button>
		<button id="login-button">
			<a href="login" style="text-decoration: none; color: inherit;">🔐로그인🔐</a>
		</button>
		<button id="community-button">
			<a href="community" style="text-decoration: none; color: inherit;">👥커뮤니티👥</a>
		</button>
	</div>
	<div class="container">
		<h1>Post List</h1>
		<table class="table">
			<thead>
				<tr>
					<th>Title</th>
					<th>Location</th>
					<th>Rating</th>
					<th>Date</th>
					<th>Details</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${posts}">
					<tr>
						<td>${post.ptitle}</td>
						<td>${post.plocation}</td>
						<td>${post.prating}</td>
						<td>${post.pregdate}</td>
						<td><a href="/post/${post.pno}">View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>