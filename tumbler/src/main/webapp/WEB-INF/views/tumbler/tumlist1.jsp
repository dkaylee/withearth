<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}

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
			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div class="store_input" id="storename_div" style="display:;">
						<form onsubmit="searchPlaces(); return false;">
							매장명 : <input type="text" value="스타벅스 " id="keyword" size="15">
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

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a0e7ca127ec3e8873006a2df2202abf&libraries=services"></script>

	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	/* 좌표 가져오기 */
	$(document).ready(function(){
		
		 var cafeinfo = $.ajax({
				type:"GET",
				url:"http://localhost:8080/tumbler/tumlist1/map",
				data:{
			
				cafe_name:"${cafe.cafe_name}",
				cafe_lat:"${cafe.cafe_lat}",
				cafe_lon:"${cafe.cafe_lon}",
				location:"${cafe.location}"
			
			    },
			    
			    error : function(error) {
			    	console.log("error");
			    	
			    },

			    success : function(positions) {
			    	//console.log(positions);
			    	//alert(data);
			    	//alert(JSON.stringify(positions));
			    	console.log("success");
			    	
			    	var cafeinfo = JSON.stringify(positions);
			    	
			    	//console.log("cafeinfo!!!!!"+cafeinfo);
			    	//console.log(positions);

			    	//console.log(cafeinfo);
			    	  
			    	},

		});

			 cafeinfo.done(successFunction);
			//cafeinfo.error(errorFunction);
			
			
			//마커 생성
			var cafemarkers = [];
			//카페 좌표 배열
			var cafelatlon = [];
			//카페 이름 배열
			var namearr=[];
			//카페 주소 배열
			var cafeAdd=[];
			//카페 좌표
			var  latlng;
			
		    function successFunction(positions){
		 
		   	 for (i = 0; i < positions.length; i++) {
		   		
		   			var content = positions[i].cafe_name;
			        var latlng = new kakao.maps.LatLng(positions[i].cafe_lat,positions[i].cafe_lon);
			        var addr = positions[i].location;
			        //console.log(addr);
		   		    //console.log(title);
		   			//console.log(latlng);
		   			
		   			cafelatlon.push(latlng);
		   			namearr.push(content);
		   			cafeAdd.push(addr);
		   			
		   		//console.log(namearr);
		   			
		   		// 마커를 생성합니다
			   	    var cafemarkers = new kakao.maps.Marker({
			   	    	 map: map, // 마커를 표시할 지도
			   	         position: latlng // 마커의 위치 
        
			   	        });
		   		
		   		
		   		
		   		
			   	// 마커에 표시할 인포윈도우를 생성합니다 
			   	    /*  var infowindow = new kakao.maps.InfoWindow({
			   	    	content: content // 인포윈도우에 표시할 내용
			   	    }); */ 
			   	// 커스텀 오버레이에 표시할 컨텐츠 입니다
			   	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			   	// 별도의 이벤트 메소드를 제공하지 않습니다 
			   	 var content = '<div class="wrap">' + 
			   	            '    <div class="info">' + 
			   	            '        <div class="title">' + 
			   	                               content    + 
			   	            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			   	            '        </div>' + 
			   	            '        <div class="body">' + 
			   	            '            <div class="img">' +
			   	            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			   	            '           </div>' + 
			   	         
			   	            '            <div class="desc">' + 
			   	            '                <div class="ellipsis">'+addr+'</div>' + 
			   	          
			   	            '        </div>' + 
			   	            '    </div>' +    
			   	            '</div>'; 
			   	      // 마커 위에 커스텀오버레이를 표시합니다
			   	      // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			   	      positions.forEach(function(pos) {
			   	      var overlay = new kakao.maps.CustomOverlay({
			   	          content: content,
			   	          map: map,
			   	          position: cafemarkers.getPosition()       
			   	      });
			   	      
			   	     var content = document.createElement('div');

			   	     
			   	  
			   	     var closeBtn = document.createElement('button');
			         closeBtn.appendChild(document.createTextNode('닫기'));
			         closeBtn.onclick = function() { customOverlay.setMap(null); };
			         content.appendChild(closeBtn);

			         overlay.setContent(content);
			         overlay.setMap(map);
			         
			       });

			   	      /* // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			   	      kakao.maps.event.addListener(cafemarkers, 'click', function() {
			   	    	 
			   	          overlay.setMap(map);
			   	      });
			   	      
			   	      
			   	      // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			   	      function closeOverlay() {
			   	       overlay.setMap(null);     
			   	   }
			   	
			   	
			   	
			   	
			   	     // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			   	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			   	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			   	    kakao.maps.event.addListener(cafemarkers, 'mouseover', makeOverListener(map, cafemarkers, overlay));
			   	    kakao.maps.event.addListener(cafemarkers, 'mouseout', makeOutListener(overlay));
	  
		  */
		    }
		   	    
		   	                    
		   	   // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		        /* function makeOverListener(map, cafemarkers, overlay) {
		   	     return function() {
		   	    	overlay.open(map, cafemarkers);
		   	     };
		      }

		   	   // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		   	   function makeOutListener(overlay) {
		   	      return function() {
		   	    	overlay.close();
		   	       };
		   	    } */            
		  
			  function errorFunction(request,status,error){
				console.log("오류확인");
				console.log(error);
			}  
		 
		}
	})


	
       


	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

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
			//console.log("dddddds"+marker);
		
			

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