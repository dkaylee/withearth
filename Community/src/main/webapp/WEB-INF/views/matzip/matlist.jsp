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
<style>


.paging a{
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}


</style>


</head>


<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div id="map" style="width: 1480px; height: 450px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004"></script>
	<script>
	
	
	// 위도 경도 구하기 (카카오맵)
	var latitude;
	var longitude;

		function getLocation() {
			if (navigator.geolocation) { // GPS를 지원하면
				navigator.geolocation.getCurrentPosition(function(position) {

					var latitude = position.coords.latitude;
					var longitude = position.coords.longitude;

					getMyloc(latitude, longitude);

				}, function(error) {
					console.error(error);
				}, {
					enableHighAccuracy : false,
					maximumAge : 0,
					timeout : Infinity
				});
			} else {
				alert('GPS를 지원하지 않습니다');
			}
		}
		getLocation();
		
		// 나의 로케이션 구하기
		function getMyloc(latitude, longitude) {
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(latitude, longitude),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
		}
	</script>

	



	<section id="three" class="wrapper">
	
		<a href="<c:url value="/matzip/addmatForm"/>" class="button special">새로운 맛집 등록</a>
		<div class="inner">
			<header class="align-center">
				<h2>비건 맛집</h2>
			</header>

			<div>
				<form id="searchForm">
					
					<!-- Search 
						<select name="searchType">
						<option value="name">이름</option>
						<option value="loc">위치</option>
						<option value="food">음식종류</option>
						</select> -->
					<select name="searchType" style="visibility: hidden;"><option value="all">전체검색</option></select>	
					<input type="text" name="keyword" placeholder="검색어를 입력하세요">
					<button type="submit" value="검색">Search</button>
				</form>
			</div>

			<c:forEach items="${matlist.matzipList}" var="matzip">
				<div class="flex flex-2">
					<article>
						<div class="image fit">
							<img src="<c:url value="/fileupload/matzip/s_${matzip.matImg}}"/>"/>
						</div>
						<header>
							<h3><a href="<c:url value="/matzip/detailView?idx=${matzip.matIdx}"/>">${matzip.matTitle}</a></h3>
						</header>
						<p>${matzip.matNum}</p>
						<p><fmt:formatDate value="${matzip.matDate}" pattern="yyyy.MM.dd." /></p>
						<p>${matzip.matCont}</p>
					</article>
				</div>
			</c:forEach>
		</div>
		
		<div class="inner">
		<nav class="paging">
				<c:if test="${matlist.totalMatzipCount>0}">
					<c:forEach begin="1" end="${matlist.totalPageCount}" var="num">
				<a href="<c:url value="/matzip/matlist"/>?p=${num}&searchType=${param.searchType}&keyword=${param.keyword}"
							class="${matlist.pageNumber eq num ? 'nowpage' : ''}">${num}</a>			
					</c:forEach>
				</c:if>
		</nav>
		</div>
		
		
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<!-- <script>
		var searchForm = $("#serarchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			e.preventDefault();
			searchForm.submit();
		});
	</script> -->




</body>
</html>