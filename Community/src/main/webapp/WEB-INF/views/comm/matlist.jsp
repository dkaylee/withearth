<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matzip List</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>


<script>

var latitude;
var longitude;

function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	
	      latitude = position.coords.latitude;
	      longitude = position.coords.longitude;
	      
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
		  
	    alert('GPS를 지원하지 않습니다');
	  }
	}
	
	getLocation();
	
</script>

</head>
<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004"></script>
	<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(latitude, longitude),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);
	</script>
	
	<a href="<c:url value="comm/addmatForm"/>" class="button special">새로운 맛집 추가</a>
	
	

	<section id="main" class="wrapper">
		<div class="table-wrapper">
		
		<div>
				<form id="searchForm">
				Search <select name="searchType">
						<option value="loc">위치</option>
						<option value="food">음식종류</option>
						<option value="time">시간</option>
					</select> 검색 키워드 <input type="text" name="keyword"> <button type="submit" value="검색">Search</button>
				</form>
			</div>
			
			<table>
				<tr>
					<th>idx</th>
					<th>이름</th>
					<th>주소</th>
					<th>운영시간</th>
					<th>전화번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>사진</th>
					<th>작성일자</th>
					<th>하트수</th>
					<th>회원아이디</th>
				</tr>

				<c:forEach items="${matlist}" var="matzip">
					<tr>
						<td>${matzip.matIdx}</td>
						<td>${matzip.matTitle}</td>
						<td>${matzip.matAddr}</td>
						<td>${matzip.matTime}</td>
						<td>${matzip.matNum}</td>
						<td>${matzip.matWr}</td>
						<td>${matzip.matCont}</td>
						<td>${matzip.matImg}</td>
						<td>${matzip.matDate}</td>
						<td>${matzip.matHeart}</td>
						<td>${matzip.idx}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<script>
		var searchForm = $("#serarchForm");

		$("#searchForm button").on("click", function(e) {

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			
			e.preventDefault();

			searchForm.submit();

		});
	</script>




</body>
</html>