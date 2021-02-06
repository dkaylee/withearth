<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>큐알 적립 후 텀블러 인증 후 리스트 내역</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
</head>
<body class="subpage">
Fs
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">

   
		<div>

			<h1>${uid}님100포인트 적립되었습니다.</h1>

		</div>
	

		<div class="head_orderlist">
			<!-- Table -->
			<h3>텀블러 인증 내역 </h3>

			<h4>님 </h4>
			<div class="table-wrapper">
				<table>
					<thead>
					
						<tr>
							<th>NO</th>
							<th>적립일자</th>
							<th>이용 매장</th>
							<th>적립포인트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>{tumbler.idx}</td>
							<td>{tumbler.tum_date}</td>
							<td>{cafe.cafe_name}</td>
							<td>100p</td>
						</tr>

					
				</table>
			</div>
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