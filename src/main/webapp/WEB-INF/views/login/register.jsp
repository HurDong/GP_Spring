<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<form action="/register" method="post">
							<div class="mb-3">
								<label for="mid" class="form-label">아이디</label> <input
									type="text" class="form-control" id="mid" name="mid" required>
							</div>
							<div class="mb-3">
								<label for="mpwd" class="form-label">비밀번호</label> <input
									type="password" class="form-control" id="mpwd" name="mpwd"
									required>
							</div>
							<div class="mb-3">
								<label for="mname" class="form-label">이름</label> <input
									type="text" class="form-control" id="mname" name="mname"
									required>
							</div>
							<div class="mb-3">
								<label for="mbirth" class="form-label">생년월일</label> <input
									type="date" class="form-control" id="mbirth" name="mbirth"
									required>
							</div>
							<div class="mb-3">
								<label for="mtel" class="form-label">전화번호</label> <input
									type="text" class="form-control" id="mtel" name="mtel" required
									pattern="[0-9]{11}"	placeholder="'-'를 빼고 입력해주세요." maxlength="11">
							</div>

							<div class="d-grid gap-2">
								<button type="submit" class="btn btn-primary">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 부트스트랩 JS, Popper.js, jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
