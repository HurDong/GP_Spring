<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
	<div id="member-info">
		<h1>회원 정보</h1>
		<p>아이디: ${member.mid}</p>
		<p>이름: ${member.mname}</p>
		<p>생일: ${member.mbirth}</p>
		<p>전화번호: ${member.mtel}</p>
		<p>내 위치: ${member.mpos}</p>
		<!-- 위치가 null일 경우 위치 등록하기 버튼을 보여줌 -->
		<c:if test="${member.mpos == null}">
			<input type="button" onclick="sample4_execDaumPostcode()"
				value="위치 등록하기">
		</c:if>
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