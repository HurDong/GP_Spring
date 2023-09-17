<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 상세보기</title>
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

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 50px;
}

.card {
	width: 100%; /* 카드의 너비를 조절합니다 */
	margin: 20px;
	border: none;
	border-radius: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-body {
	padding: 50px;
}

.card-title {
	font-size: 40px;
	margin-bottom: 40px;
	border-bottom: 1px solid #eee;
}

.card-text {
	font-size: 16px;
	color: #555;
	border-bottom: 1px solid #eee; /* 선으로 구분 */
	padding-bottom: 10px; /* 텍스트와 선 사이의 간격 */
	margin-bottom: 10px; /* 선과 다음 텍스트 사이의 간격 */
}

.back-to-list {
	display: inline-block;
	margin: 20px;
	font-size: 16px;
	width: 70%; /* 버튼의 너비를 카드와 비슷하게 조절 */
	text-align: center;
	color: #000; /* 글자 색상을 흰색으로 변경 */
	background-color: #ffcd36;
	border: 1px solid #ffcd36; /* 테두리 색상을 노란색으로 변경 */
}

.back-to-list:hover {
	color: #fff;
	background-color: #000; /* 호버 시 배경색을 약간 어둡게 변경 */
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
		<button id="community-button">
			<a href="community" style="text-decoration: none; color: inherit;">👥커뮤니티👥</a>
		</button>
	</div>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">${post.ptitle}</h5>
				<p class="card-text">위 치 : ${post.plocation}</p>
				<p class="card-text">평 점: ${post.prating}</p>
				<p class="card-text">작 성 일 시 : ${post.pregdate}</p>
				<%
				String content = null;
				Object postObject = request.getAttribute("post");
				if (postObject instanceof com.example.demo.entity.Post) {
					com.example.demo.entity.Post postEntity = (com.example.demo.entity.Post) postObject;
					if (postEntity.getPcontent() != null) {
						content = postEntity.getPcontent().replace("\n", "<br/>");
					}
				}
				%>
				<p class="card-text" style="border-bottom: none;">
					내 용 :<br />
					<%=content%>
				</p>

			</div>
		</div>
		<a href="/post" class="btn btn-primary back-to-list">목 록 으 로 돌 아 가 기</a>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>