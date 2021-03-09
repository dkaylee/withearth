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

.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}


.searchPart{
display:inline-block;
}

.pagebtn {
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
}

#thumb img {
	display: block; /* Otherwise it keeps some space around baseline */
	min-width: 100%; /* Scale up to fill container width */
	min-height: 100%; /* Scale up to fill container height */
	-ms-interpolation-mode: bicubic;
	/* Scaled images look a bit better in IE now */
}

.article {
	border: 1px solid #e6e6e6;
	padding : 10px;
	margin : 12px;

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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	
	
	
	<script>
	<!-- 데이터 불러오기 -->
	

	// 파라미터로 페이지 번호 받기
	function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 	
    var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);	
  	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var mat = [];
	
	var p = getParameterByName('p');
	

	console.log(p);
	
	$('#paging').empty();
	
			$.ajax({
				url : "https://www.withearthcomm.tk/community/matzip/matlist/listInfo?p="+p,
				type : "GET",
				success : function(data) {
					console.log(data);
					console.log(data.totalMatzipCount);
					
					mat = data.matzipList;
					var startRow = data.startRow;
					var endRow = data.endRow;
					var totalCount = data.totalMatzipCount;
					
					
					$.each(mat, function(index, item){	
						console.log("data: "+ mat);
						console.log(mat);
						console.log(p +","+startRow + "," + endRow);
						console.log("start : " + startRow);
						console.log("end : " + endRow);
						
						var html = "";
						html +='<article class="article">'
						html +='<div class="image fit" id="thumb">';
						html +='<a href="<c:url value="/matzip/matDetailView?matIdx='+item.matIdx+'"/>"><img src="http://localhost:8080/community/fileupload/matzip/'+item.matImg+'"></a>';
						html +='</div>';
						html +='<hr class="major"/>';
						html +='<header>';
						html +='<h3><a href="<c:url value="/matzip/matDetailView?matIdx='+item.matIdx+'"/>">'+item.matTitle+'</a></h3>';
						html +='<p>'+item.matCont+'</p>';
						html +='</header>';
						html +='<p><i class="fas fa-map-marker-alt"></i>'+item.matAddr+'</p>';
						html +='<p><i class="fas fa-phone-alt"></i>'+item.matNum+'</p>';
						html +='<p><i class="fas fa-clock"></i>'+item.matTime+'</p>';
						html +='</article>';
						
						$('#matzip_list').append(html);
						
						console.log(html);
					});
					
					console.log(totalCount);
					console.log(p);
					            
					if(data.totalMatzipCount > 0){
						for(var i = 1; i <= data.totalPageCount; i++){
							var html = "";
							/* html += '<a href="https://www.withearthcomm.tk/community/matzip/matlist?p='+i+'" class="pagebtn">'+i+'</a>'; */
							 html += '<a href="<c:url value="/matzip/matlist?p="/>'+i+'" class="button alt">'+i+'</a>'
							$('#paging').append(html);
						}	
					}
		         },
				error : function(){
					alert("오류가 발생했습니다.");
				}
					
			});	
			
			/*  검색어로 찾기 */
			 $(".searchBtn").on("click", function(){
					var chk = $('.search').val();
					
					if(chk==null){
						alert("검색어를 입력해주세요!");
						return false;
					
					}else {					
							$.ajax({
								url : "https://www.withearthcomm.tk/community/matzip/matlist/listInfo?searchType=all&keyword="+chk,
								type : "GET",
								success : function(data) {
									console.log(data);
									
									$.each(mat, function(index, item){	
										console.log("data: "+ mat);
										console.log(mat);
										console.log(p +","+startRow + "," + endRow);
										console.log("start : " + startRow);
										console.log("end : " + endRow);
										
										var html = "";
										html +='<article class="article">'
										html +='<div class="image fit" id="thumb">';
										html +='<a href="<c:url value="/matzip/matDetailView?matIdx='+item.matIdx+'"/>"><img src="https://www.withearthcomm.tk/community/fileupload/matzip/'+item.matImg+'"></a>';
										html +='</div>';
										html +='<hr class="major"/>';
										html +='<header>';
										html +='<h3><a href="<c:url value="/matzip/matDetailView?matIdx='+item.matIdx+'"/>">'+item.matTitle+'</a></h3>';
										html +='<p>'+item.matCont+'</p>';
										html +='</header>';
										html +='<p><i class="fas fa-map-marker-alt"></i>'+item.matAddr+'</p>';
										html +='<p><i class="fas fa-phone-alt"></i>'+item.matNum+'</p>';
										html +='<p><i class="fas fa-clock"></i>'+item.matTime+'</p>';
										html +='</article>';
										
										$('#matzip_list').append(html);
										
										console.log(html);
										});
									
									console.log(totalCount);
									console.log(p);
									            
									if(data.totalMatzipCount > 0){
										for(var i = 1; i <= data.totalPageCount; i++){
											var html = "";
											/* html += '<a href="https://www.withearthcomm.tk/community/matzip/matlist?p='+i+'" class="pagebtn">'+i+'</a>'; */
											 html += '<a href="<c:url value="/matzip/matlist?p="/>'+i+'" class="button alt">'+i+'</a>'
											$('#paging').append(html);
										}	
									}
						         },
								error : function(){
									alert("오류가 발생했습니다.");
								}
									
							});	

						
					}

				});
			
			
	
			
			
		/* '&searchType='+data.searchType+'&keyword='+data.keyword+ */

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

		
		
		

		function getMarkers(latitude, longitude) {

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			var imageSrc = "/member/fileupload/icon/carrot2.png", // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)};

			

			for (var i = 0; i < mat.length; i++) {

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				var matTitle = mat[i].matTitle;
				
				console.log(matTitle);
			

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(mat[i].matAddr, function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,result[0].x);

								console.log('coords:::'+coords);
								
								// contnets 배열에 저장
								/* for (var i = 0; i < mat.length; i++) {

									var content =  mat[i].matTitle
													+ mat[i].matAddr
													+ mat[i].matNum
													+ coords; */
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
								 markerPosition = new kakao.maps.LatLng(coords); // 마커가 표시될 위치입니다					
							
									var content = 
										'<div class="customoverlay">' +
									    '  <a href="https://place.map.kakao.com/662101801" target="_blank">' +
									    '    <span class="title">'+matTitle+'</span>' +
									    '  </a>' +
									    '</div>';
										
								 
									console.log('contents:::::'+content);
								

								// 결과값으로 받은 위치를 마커로 표시합니다
								 var marker = new kakao.maps.Marker({
									map : map,
									position : coords,
									image: markerImage
								
								}); 

								// 마커에 표시할 인포윈도우를 생성합니다 
								var customOverlay = new kakao.maps.CustomOverlay({
									map : map,
									position : coords,
								 	content: content// 인포윈도우에 표시할 내용
								 	
								});
								
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);

							}
						});

			}
			getLocation();
		}

		getLocation();


		
		
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

					

					<div class="searchPart"><input type="text" name="keyword" placeholder="검색어를 입력하세요" class="search"></div>
					<div class="searchPart"><button type="submit" class="searchBtn" value="검색">Search</button></div>
					</form>
			</div>

			
				<div class="flex flex-2" id ="matzip_list">
				
				</div>
			
		</div>
		
		
		<div class="inner">
			<div id="paging">
			</div>
		</div>
		
		
		<!-- <button id="morebtn" class="button special" onclick="morelist();">더보기</button> -->
		<%-- <nav class="paging">
				<c:if test="${matlist.totalMatzipCount>0}">
					<c:forEach begin="1" end="${matlist.totalPageCount}" var="num">
				<a href="<c:url value="/matzip/matlist"/>?p=${num}&searchType=${param.searchType}&keyword=${param.keyword}"
							class="${matlist.pageNumber eq num ? 'nowpage' : ''}">${num}</a>			
					</c:forEach>
				</c:if>
		</nav>  --%>
		
		
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>

