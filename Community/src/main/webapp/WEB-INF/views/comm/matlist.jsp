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

</head>


<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div id="map" style="width: 1480px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004"></script>
	<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(latitude, longitude),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);
	</script>

	<a href="<c:url value="mat/addmatForm"/>" class="button special">새로운 맛집 등록</a>



	<section id="three" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h2>비건 맛집</h2>
			</header>

			<div>
				<form id="searchForm">
					Search <select name="searchType">
						<option value="loc">위치</option>
						<option value="food">음식종류</option>
						<option value="time">시간</option>
					</select> 검색 키워드 <input type="text" name="keyword">
					<button type="submit" value="검색">Search</button>
				</form>
			</div>



			<c:forEach items="${matlist}" var="matzip">
				<div class="flex flex-2">
					<article>
						<div class="image fit">
							<img src="<c:url value="/fileupload/matzip/s_${matzip.matImg}}"/>" alt="Pic 01" />
						</div>
						<header>
							<h3>${matzip.matTitle}</h3>
						</header>
						<p><fmt:formatDate value="${matzip.matDate}" pattern="yyyy.MM.dd." /></p>
						<p>${matzip.matCont}</p>
					</article>
				</div>
			</c:forEach>
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