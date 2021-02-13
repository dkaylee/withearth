<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial=scale=1.0">
<title>텀블러 인증</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

<style>


/* 모달 창 */

#maodel_btnx{
all: unset;
	background-color: #5385c1;
	color: white;
	padding: 15px 25px;
	border-radius: 6px;
	cursor: pointer;

}
#modal_btn {
	text-align: center;
	margin: 0 auto;
}

button {
	all: unset;
	background-color: #5385c1;
	color: white;
	padding: 50px 150px;
	border-radius: 6px;
	cursor: pointer;
	margin:50px 10px;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.md_overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
}

.md_content {
	width: 40%;
	position: relative;
	padding: 50px 100px;
	background-color: white;
	text-align: center;
	border-radius: 6px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.20), 0 6px 6px
		rgba(0, 0, 0, 0.20);
}

h1 {
	margin: 0;
	padding: 5px;
}

.hidden {
	display: none;
}

.modal_text {
	padding: 50px;
}
</style>


</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>




	<section id="main" class="wrapper">


		<div id="modal_btn">
			<button id="open">텀블러 인증하기</button>
			<button id="open" onclick="location.href='/tumbler/tumlist'">텀블러 이용내역</button>
		</div>

		<div class="modal hidden">
			<div class="md_overlay"></div>
			<div class="md_content">
				<h1>포인트 적립</h1>
				<div class="modal_text">QR코드를 스캔해주세요!</div>

				<button id=maodel_btnx>X</button>
			</div>
		</div>
		
		<hr>
		
		<h1> 이용 가능한 매장</h1>
		
		






		
	</section>





	<div id="map" style="width: 350px; height: 350px; float:right; margin-right= 100px;"></div>
	<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
	<script>
		$(function() {
			// Geolocation API에 액세스할 수 있는지를 확인
			if (navigator.geolocation) {
				//위치 정보를 얻기
				navigator.geolocation.getCurrentPosition(function(pos) {
					$('#latitude').html(pos.coords.latitude); // 위도
					$('#longitude').html(pos.coords.longitude); // 경도
				});
			} else {
				alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
			}
		});
	</script>
</head>

<!-- <ul>
	<li>위도:<span id="latitude"></span></li>
	<li>경도:<span id="longitude"></span></li>
</ul> -->


<div id="map" style="width: 100%; height: 350px;"></div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a0e7ca127ec3e8873006a2df2202abf"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [ {
			content : '<div>스타벅스 시청점</div>',
			latlng : new kakao.maps.LatLng(37.567381, 126.977859)
		} ];

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		/* 아래와 같이도 할 수 있습니다 */
		/*
		 for (var i = 0; i < positions.length; i ++) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map: map, // 마커를 표시할 지도
		 position: positions[i].latlng // 마커의 위치
		 });

		 // 마커에 표시할 인포윈도우를 생성합니다 
		 var infowindow = new kakao.maps.InfoWindow({
		 content: positions[i].content // 인포윈도우에 표시할 내용
		 });

		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
		 // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		 kakao.maps.event.addListener(marker, 'mouseover', function() {
		 infowindow.open(map, marker);
		 });

		 // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		 infowindow.close();
		 });
		 })(marker, infowindow);
		 }
		 */
	
				//필요한 엘리먼트들을 선택한다.
				const openButton = document.getElementById("open");
				const modal = document.querySelector(".modal");
				const overlay = modal.querySelector(".md_overlay");
				const closeButton = modal.querySelector("button");
				//동작함수
				const openModal = () => {
					modal.classList.remove("hidden");
				}
				const closeModal = () => {
					modal.classList.add("hidden");
				}
				//클릭 이벤트
				openButton.addEventListener("click", openModal);
				closeButton.addEventListener("click", closeModal);
				

</script>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>