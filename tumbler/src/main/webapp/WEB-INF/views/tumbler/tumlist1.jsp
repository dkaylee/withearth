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
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	/* background: rgba(255, 255, 255, 0.7); */
	background: white;
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}
/* #placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;} */
#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/*
 .contents{
  
  padding: 0 4% 0 4%;
} */

/*매장 검색창  */
form {
	display: flex;
}

.search {
	display: inline-block;
	margin: 100px;
}

/* 모달 창 */
#maodel_btnx {
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
	margin: 50px 10px;
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
			<button id="open" onclick="location.href='/tumbler/tumlist'">텀블러
				이용내역</button>
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

		<h1 style="text-align: center;">이용 가능한 매장</h1>



		<!-- 		<div class="store_wrap">

			<div class="search">

				<form>
					<select name="searchType">
						<option value="id">매장명</option>
						<option value="name">주소</option>
					</select> <input type="text" name="keyword"> <input type="submit"
						value="검색">
				</form>
			</div>
			<div class="result_list">
			<ui id="placesList">
			<li></li>
			<li></li>
			<li></li>
			</ui>
			</div>
		</div> -->





	</section>


	<div class="contents">
		<div class="map_wrap">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div class="store_input" id="storename_div" style="display:;">
						<form onsubmit="searchPlaces(); return false;">
							매장명 : <input type="text" value="스타벅스 " id="keyword" size="15">
							<!--    매장명 : <input type="text"  id="keyword" size="15">  -->
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList">

					<c:forEach items="${list}" var="cafe" varStatus="status">
						<li><a>
								<dl>
									<dt>${cafe.cafe_name}</dt>
									<dd>${cafe.location}</dd>
									<dd id="cafelat">${cafe.cafe_lat}</dd>
									<dd id="cafelon">${cafe.cafe_lon}</dd>
								</dl>
						</a></li>

					</c:forEach>

				</ul>
				<div id="pagination"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a0e7ca127ec3e8873006a2df2202abf&libraries=services"></script>

	<script>

		// 마커를 담을 배열입니다
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//장소 검색 객체를 생성합니다
//var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});



//키워드로 장소를 검색합니다
//searchPlaces();
 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//지도에 표시될 마크
var markers = [];
    
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">내위치!!!!!!</div>'; // 인포윈도우에 표시될 내용입니다

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
				zIndex:1,
				content : iwContent,
				removable : iwRemoveable
			});

			
		
			
			
			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);
			//infowindow.setContent(content);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);		
			markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			
			
			console.log(locPosition);
			console.log("dddddds"+marker);
		
			

		}   
    
// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
/*  var positions  = [
	 {
	 
	 title:'종각',
	 latlng: new kakao.maps.LatLng(37.569918, 126.984528)//종각
		 
 },
 {
	 title:'종로3가',
	 latlng:new kakao.maps.LatLng(37.570553, 126.990206) //종로3가
 },
 {
	 title:'광화문R',
	 latlng:new kakao.maps.LatLng(37.571229, 126.976287) //광화문R
 }
	 
	 
];  
 */


 //var positions=[];
/* 
  $.getJSON("http://localhost:8080/tumbler/tumlist1",function(data)){
	
	var positions=[];
	
	$.each(data, function(key, val){
		positions.push("")
	}
}
   */
 
 /* $(document).ready(function(){
		
		$.ajax({
			url : 'http://localhost:8080/tumbler/tumlist1',
			type : 'GET',
			dataType:"json",
			success : function(data){
				console.log(data);
				alert(data);
				alert(JSON.stringify(data));
				
				var positions=[];
				
				$.each(data, function(index, item){
					
					for(var i =0; i< data.lenght; i++){
						alert(i);
					
						
					   });
				})
				
			},

			error : function(e){
				console.log("에러발생!! : ", e);
			}
		});
		
		
		
	}); */
	
	 $(document).ready(function(){
		 console.log(ststdsfsdf);
	 
$.get("map",function(data){
	
		console.log(data);
		
	});
})
	
 /*  $(document).ready(function(){
  $.ajax({
		url:'http://localhost:8080/tumbler/tumlist1',
		type:'GET',
		dataType:"json",
		data:JSON.stringify(data),
		data:"cafe_name"+cafe_name,
		success:function(data){
			console.log(data);
			alert(data);
			alert(JSON.stringify(data));
			

			},
	
			  

		error : function(e){
			console.log("에러발생!! : ", e);
		},
		async:false
	});
	
});  
	
 */

// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds();    

var i, marker;

for (i = 0; i < positions.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker = new kakao.maps.Marker({ 
    	 position: positions[i].latlng, // 마커를 표시할 위치
         title : positions[i].title // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    
    });
    
    marker.setMap(map);
    
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(positions[i]);
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
		
		
		/*모달창  */
	
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