<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>로그인 폼</title>
</head>
<body>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<!-- 로고 추가 -->
						<div class="text-center mb-4">
							<a href="/home"> <img id="siteLogo"
								src="https://github.com/HurDong/img/blob/main/Where_to_kakao_logo.png?raw=true"
								alt="사이트 로고" class="mb-3" style="width: 100px;">
							</a>
						</div>
						<form action="/login" method="post">
							<div class="mb-3">
								<label for="mid" class="form-label">아이디</label> <input
									type="text" class="form-control" id="mid" name="mid">
							</div>
							<div class="mb-3">
								<label for="mpwd" class="form-label">비밀번호</label> <input
									type="password" class="form-control" id="mpwd" name="mpwd">
							</div>
							<div class="d-grid gap-2">
								<button type="submit" class="btn btn-primary">로그인</button>
								<button type="button" class="btn btn-secondary"
									onclick="window.location.href='/register'">회원가입</button>
							</div>
						</form>
					</div>
				</div>
				<c:if test="${not empty error}">
					<div class="alert alert-danger mt-3" role="alert">${error}</div>
				</c:if>
			</div>
		</div>
	</div>
	

	<!-- 부트스트랩 JS, Popper.js, jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
