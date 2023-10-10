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

.table thead th, .table tbody td {
	text-align: center;
}

.container {
	margin-top: 50px
}
</style>
</head>
<body>
	<div id="nav-bar">
		<button id="meet-button">
			<a href="home" style="text-decoration: none; color: inherit;">🏠메인으로🏠</a>
		</button>
		<button id="login-button">
			<a href="login" style="text-decoration: none; color: inherit;">🔐로그인🔐</a>
		</button>
		<button id="mypage-button">
			<a href="mypage" style="text-decoration: none; color: inherit;">👥마이페이지👥</a>
		</button>
	</div>
	<div class="container">
		<div class="header">
			<h1 style="display: inline-block;">게시물 목록</h1>
			<a href="/createPost" class="btn btn-primary" style="float: right;">게시물
				작성</a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>게시물 번호</th>
					<th>게시물 제목</th>
					<th>위치</th>
					<th>평점</th>
					<th>작성일시</th>
					<th>자세히보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${posts}">
					<tr>
						<td>${post.pno}</td>
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