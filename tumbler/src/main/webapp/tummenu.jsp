<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>텀블러 메뉴</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">

		<%
			String id = request.getParameter("id");
		%>

			<div class="wrap">
  		<a href="#" class="button">텀블러 인증하기</a>
  		<a href="#" class="button2">텀블러 인증 조회</a>
	</div>







			
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<div id="map" style="width: 20%; height: 20px;"></div>
	<p>
		<em>지도를 움직여 주세요!</em>
	</p>
	<p id="result"></p>

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

		// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'dragend', function() {

			// 지도 중심좌표를 얻어옵니다 
			var latlng = map.getCenter();

			var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';

			var resultDiv = document.getElementById('result');
			resultDiv.innerHTML = message;

		});
	</script>


</body>
</html>