<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
		<button id="logout-button">
			<a href="logout" style="text-decoration: none; color: inherit;">🔐로그아웃🔐</a>
		</button>
		<button id="post-button">
			<a href="post" style="text-decoration: none; color: inherit;">👥커뮤니티👥</a>
		</button>
	</div>
	<!-- 기존의 회원 정보 표시 부분 -->
<div class="container">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">회원 정보</h5>
				<p class="card-text">아이디: ${member.mid}</p>
				<p class="card-text">이름: ${member.mname}</p>
				<p class="card-text">생일: <fmt:formatDate value="${member.mbirth}" pattern="yyyy-MM-dd" /></p>
				<p class="card-text">전화번호: ${member.mtel}</p>
				<p class="card-text">내 위치: ${member.roadAddress}</p>
				<!-- 위치가 null일 경우 위치 등록하기 버튼을 보여줌 -->
				<input type="button" onclick="sample4_execDaumPostcode()" value="위치 등록하기">
			</div>
		</div>
		<a href="/home" class="btn btn-primary back-to-list">메인으로 돌아가기</a>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- jQuery 추가 -->
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							 var postcodeElement = document.getElementById('sample4_postcode');
					         var roadAddrElement = document.getElementById('sample4_roadAddress');
					         var jibunAddrElement = document.getElementById('sample4_jibunAddress');
					            
					         if(postcodeElement && roadAddrElement && jibunAddrElement) {
						         postcodeElement.value = data.zonecode;
						         roadAddrElement.value = data.roadAddress;
						         jibunAddrElement.value = data.jibunAddress;
					         }
							// 서버에 주소 정보를 전송	
							$.ajax({
								url : '/updateLocation', // 서버의 주소 업데이트 엔드포인트
								type : 'POST',
								data : {
									'postcode' : data.zonecode,  // 이 부분을 수정
							        'roadAddress' : data.roadAddress,
							        'jibunAddress' : data.jibunAddress
								},
								success : function(response) {
									// 서버에서 성공적으로 응답을 받았을 때의 처리
									alert('위치가 성공적으로 업데이트되었습니다.');
									window.location.reload(); 
								},
								error : function(error) {
									// 에러가 발생했을 때의 처리
									alert('위치 업데이트에 실패했습니다.');
								}
							});
						}
					}).open();
		}
	</script>


</body>
</html>