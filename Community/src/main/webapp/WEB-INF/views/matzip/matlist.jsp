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
.paging a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

#thumb {
	display: block;
	overflow: hidden;
	height: 450px;
	width: 500px;
}

#thumb img {
	display: block; /* Otherwise it keeps some space around baseline */
	min-width: 100%; /* Scale up to fill container width */
	min-height: 100%; /* Scale up to fill container height */
	-ms-interpolation-mode: bicubic;
	/* Scaled images look a bit better in IE now */
}

#article {
	
}
</style>


</head>


<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div id="map" style="width: 1480px; height: 450px;"></div>
	
	<!-- 카카오 api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004&libraries=services">
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004">
	</script>
	
	
	<!-- 데이터 불러오기 -->
	<script>
	
	$(document).ready(function(){	
		
		$.ajax({
				url : "http://localhost:8080/community/matzip/matlist/totalinfo",
				type : "GET",
				async: false,
				success : function(data) {
					console.log(data);
					var matziplist = JSON.stringify(data);
					console.log(matziplist);
					
					
					
				},
				error : function(){
					alert("데이터 못 불러옴^^");
				}
			});	
		})
		
		
	
	</script>
	
	

	<!-- 맛집 지도 -->
	<script>
	// 위도 경도 구하기 (카카오맵)
 	var latitude;
	var longitude;

		function getLocation() {
			if (navigator.geolocation) { // GPS를 지원하면
				navigator.geolocation.getCurrentPosition(function(position) {

					var latitude = position.coords.latitude;
					var longitude = position.coords.longitude;
					
					getMarkers(latitude, longitude);

					//getMyloc(latitude, longitude);

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
		
		// 나의 위치 구하기
		function getMyloc(latitude, longitude) {
			var container = document.getElementById('map');
			var options = {
				center : new kakao.maps.LatLng(latitude, longitude),
				level : 3
			};
			var map = new kakao.maps.Map(container, options);
		}
		
		
		function getMarkers(latitude, longitude){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('서울 중구 동호로24길 7-6 불광산사 지하2층', function(result, status) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        
		        /* for( var i = 0; i < matloc.length; i++){
		        var infowindow = new kakao.maps.InfoWindow({
		            //content: '<div style="width:150px;text-align:center;padding:6px 0;">한과채</div>'
		           	content : '<div style="width:80px;text-align:center;">'+matTtitle[i]+'</div>'
		        });
		        }
		        
		        infowindow.open(map, marker); */
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        // map.setCenter(coords);
		   	 		} 
				}); 
		}
		
		getLocation();
		
		
		
		
	</script>
	
	<script>
		
	
	</script>


	<section id="three" class="wrapper special">
	
		
		<div class="inner">
			<header class="align-center">
				<h2>비건 맛집</h2>
				<p>채식주의자들을 위한 맛집을 탐색합니다.</p>
			</header>
			
			<a href="<c:url value="/matzip/addmatForm"/>" class="button special">새로운 맛집 등록</a>

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

			
				<div class="flex flex-2">
				<c:forEach items="${matlist.matzipList}" var="matzip">
					<article>
						<div class="image fit" id="thumb">
							<a href="<c:url value="/matzip/matDetailView?matIdx=${matzip.matIdx}"/>"><img src="<c:url value="/fileupload/matzip/${matzip.matImg}"/>"/></a>
						</div>
						<header>
							<h3><a href="<c:url value="/matzip/matDetailView?matIdx=${matzip.matIdx}"/>">${matzip.matTitle}</a></h3>
							<p>${matzip.matCont}</p>
							<%-- <h3><a href='matDetailView?matIdx=${matzip.matIdx}'>${matzip.matTitle}</a></h3> --%>
						</header>
						
						<p>${matzip.matAddr}</p>
						<p>${matzip.matNum}</p>
						<p>${matzip.matTime}</p>
						<%-- <p><fmt:formatDate value="${matzip.matDate}" pattern="yyyy.MM.dd." /></p> --%>
						
					</article>
				</c:forEach>
				</div>
			
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


	
	
	




</body>
</html>