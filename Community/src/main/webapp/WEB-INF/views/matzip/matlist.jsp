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


	<div id="map" style="width: 100%; height: 450px;"></div>
	
	<!-- 카카오 api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004&libraries=services">
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97c778ca3a2efa48c4c3af1ce102d004">
	</script>
	
	
	
	<script>
	<!-- 데이터 불러오기 -->
		var mat = [];

		
		$.ajax({
				url : "http://localhost:8080/community/matzip/matlist/listInfo",
				type : "GET",
				async: false,
				success : function(data) {
					console.log(data);
					mat = data.matzipList;
					
					console.log(mat.param);
					
					$.each(mat, function(index, item){
						var html = "";
						html += '<div class="image fit" id="thumb">';
						html +='<a href="/matzip/matDetailView?matIdx='+item.matIdx+'"/>"><img src="/fileupload/matzip/'+item.matImg+'"/>"/></a>';
						html +='</div>';
						html +='<header>';
						html +='<h3><a href="<c:url value="/matzip/matDetailView?matIdx='+item.matIdx+'"/>">'+item.matIdx+'</a></h3>';
						html +='<p>'+item.matCont+'</p>';
						html +='</header>';
						html +='<p>'+item.matAddr+'</p>';
						html +='<p>'+item.matNum+'</p>';
						html +='<p>'+item.matTime+'</p>';
						html +='<div>';
						
						$('#matzip_list').append(html);
						
						console.log(html);
					});
					
					/* if(mat.totalMatzipCount>0){
						for(var i=0; i < mat.totalPageCount; i++){
						var html = "";
						html += '<a href="http://localhost:8080/community/matzip/matlist/?p=>'+i+'&searchType='++'<a>';
						
						
						}	
					} */
					
					
				},
				error : function(){
					alert("데이터 못 불러옴^^");
				}
			});	
		
		// 페이지번호 클릭
		
	
		
		/* var mtitle = [];
		var maddr = [];
		var mnum = [];
		
			
		for(var i=0; i<mat.length; i++){
			mtitle.push(mat[i].matTitle);
			maddr.push(mat[i].matAddr);
			mnum.push(mat[i].matNumber);
		}
		
		console.log(mtitle);
		console.log(maddr);
		console.log(maddr[1]); */
	
	

	/* 맛집지도 */
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
		
		
		
		/* function getPositions(content, latlng){
			
			for (var i=0; i<mat.length; i++){
				
				var content = '<div>'+mat[i].matTitle+'</div>'+
							  '<div>'+mat[i].matAddr+'</div>'+
							  '<div>'+mat[i].matNum+'</div>';			
				
			}
			
		} */

		
		function getMarkers(latitude, longitude){
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 	
			
			var contentArr = [];
	        
			// contnets 배열에 저장
	        for (var i=0; i<mat.length; i++){
	        	
				var content = 
				'<div>'+mat[i].matTitle+'</div>'+'<div>'+mat[i].matAddr+'</div>'+'<div>'+mat[i].matNum+'</div>';
				
				contentArr.push(content);
				}
	        
				console.log(contentArr);
	
			for(var i=0; i<mat.length; i++){
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
			
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(mat[i].matAddr, function(result, status) {
				
		    	// 정상적으로 검색이 완료됐으면 
		     	if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        console.log(coords);
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		        
		     	// 마커에 표시할 인포윈도우를 생성합니다 
		        var infowindow = new kakao.maps.InfoWindow({
		            /* content: contentArr[i] */ // 인포윈도우에 표시할 내용
		        });
		     	
		     	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        // map.setCenter(coords);
		   	
		     			}
					}); 
			
			}
			getLocation();
		}
		
		getLocation();
		
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
					<article id ="matzip_list">
						
					</article>
				</div>
			
		</div>
		
		<div class="inner">
		
		<button id="morebtn" class="button special" onclick="morelist();">더보기</button>
		
		<%-- <nav class="paging">
				<c:if test="${matlist.totalMatzipCount>0}">
					<c:forEach begin="1" end="${matlist.totalPageCount}" var="num">
				<a href="<c:url value="/matzip/matlist"/>?p=${num}&searchType=${param.searchType}&keyword=${param.keyword}"
							class="${matlist.pageNumber eq num ? 'nowpage' : ''}">${num}</a>			
					</c:forEach>
				</c:if>
		</nav>  --%>
		</div>
		
		
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>

