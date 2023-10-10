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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14b45607c24e81b779e6418cf489de08&libraries=services"></script>
</head>
<body>
	<div id="nav-bar">
		<button id="home-button">
			<a href="/home" style="text-decoration: none; color: inherit;">🏠메인으로🏠</a>
		</button>
		<button id="login-button">
			<a href="/login" style="text-decoration: none; color: inherit;">🔐로그인🔐</a>
		</button>
		<button id="post-button">
			<a href="/post" style="text-decoration: none; color: inherit;">👥커뮤니티👥</a>
		</button>
	</div>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">${post.ptitle}</h5>
				<p class="card-text">위 치 : ${post.plocation}</p>
				<p class="card-text">평 점: ${post.prating}</p>
				<p class="card-text">작 성 일 시 : ${post.pregdate}</p>

				<p class="card-text" style="border-bottom: none;">
					내 용 :<br />${post.pcontent}

				</p>
				<div>
					<div id="map" style="width: 100%; height: 440px;"></div>
				</div>
			</div>
		</div>
		<a href="/post" class="btn btn-primary back-to-list">목 록 으 로 돌 아 가
			기</a>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level : 3 // 지도의 확대 레벨
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('${post.plocation}', function(result, status) {

        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
				map : map,
				position : coords,
			});  
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    });    
</script>

</body>
</html>