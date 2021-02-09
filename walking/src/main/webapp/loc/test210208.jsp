<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>

<style>
#eddAdd{
	float: left;
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxa82c096d66484d37ac10b23c15a64620"></script>

<script type="text/javascript">
	var now_lat = $('#nowLat');
	var now_lon = $('#nowLon');
	var new_lat = $('#newLat');
	new_lat = 37.57081522;
	var new_lon = $('#newLon')
	new_lon = 127.00160213;

	$(document).ready(function() {
		// Geolocation API에 액세스할 수 있는지를 확인
		if (navigator.geolocation) {
		//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				$('#latitude').html(pos.coords.latitude); // 위도 37
				$('#longitude').html(pos.coords.longitude); // 경도 126

				now_lat = pos.coords.latitude;
				now_lon = pos.coords.longitude;
				// initTmap()에 pos.coords.latitude, pos.coords.longitude 값을 전달

				console.log("현재 경도" + now_lon);
				console.log("현재 위도" + now_lat);
				initTmap(new_lat, new_lon, now_lat, now_lon);

			});
		} else {
			alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}

		// 주소 검색
		var map, marker1;

		$('#btn_select').click(	function() {
			console.log('진입1');

			// 마커 초기화
			marker1 = new Tmapv2.Marker({
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
			});

			// 2. API 사용요청
			var fullAddr = $("#fullAddr").val();
			$.ajax({
				method : "GET",
				url : "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
				async : false,
				data : {
				appKey : "l7xxa82c096d66484d37ac10b23c15a64620",
				coordType : "WGS84GEO", // 지구 위의 위치를 나타내는 좌표 타입
				fullAddr : fullAddr		// 주소 정보
				},
				success : function(response) {

					var resultInfo = response.coordinateInfo; // .coordinateInfo -> 좌표 정보
					console.log(resultInfo);
					// 기존 마커 삭제
					marker1.setMap(null);

					console.log('진입2')
					// 3.마커 찍기
					// 검색 결과 정보가 없을 때 처리
					if (resultInfo.coordinate.length == 0) { // coordinate -> 좌표 정보
						$("#addresult").text("요청 데이터가 올바르지 않습니다.");
					} else {
					
						var lon, lat;
						var resultCoordinate = resultInfo.coordinate[0];
						if (resultCoordinate.lon.length > 0) {
							// 구주소
							lon = resultCoordinate.lon;
							lat = resultCoordinate.lat;
	
							$("#sch_lat").html(lat); // 검색한 위도
							$("#sch_lon").html(lon); // 검색한 경도
	
							var new_lat = lat;
							var new_lon = lon;
	
							console.log('진입3-1')
	
							initTmap(new_lat,new_lon,now_lat,now_lon);

						} else {
							// 신주소
							lon = resultCoordinate.newLon;
							lat = resultCoordinate.newLat
							$("#sch_lat").html(lat); // 검색한 위도
							$("#sch_lon").html(lon); // 검색한 경도

							new_lat = lat;
							new_lon = lon;

							console.log("검색 위도: "+ new_lat);
							console.log("검색 경도: "+ new_lon);

							initTmap(new_lat,new_lon,now_lat,now_lon);

							console.log('진입3-2')

						}

						var lonEntr, latEntr;

						if (resultCoordinate.lonEntr == undefined&& resultCoordinate.newLonEntr == undefined) {
							lonEntr = 0;
							latEntr = 0;
							console.log('진입4-1');
						} else {
							if (resultCoordinate.lonEntr.length > 0) {
								lonEntr = resultCoordinate.lonEntr;
								latEntr = resultCoordinate.latEntr;
								console.log('진입4-2');
							} else {
								lonEntr = resultCoordinate.newLonEntr;
								latEntr = resultCoordinate.newLatEntr;
									console.log('진입4-3');
							}
						}

						console.log('진입5')
						var markerPosition = new Tmapv2.LatLng(Number(lat),Number(lon));

						console.log('진입6')
						//map.setCenter(markerPosition); //21.02.05 -> 주석처리하니 에러 없음. 위경도좌표도 나옴. km, 
						console.log('진입7');
						// 검색 결과 표출
						var matchFlag, newMatchFlag;
						// 검색 결과 주소를 담을 변수
						var address = '', newAddress = '';
						var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
						var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;

						// 새주소일 때 검색 결과 표출
						// 새주소인 경우 matchFlag가 아닌
						// newMatchFlag가 응답값으로
						// 온다

						if (resultCoordinate.newMatchFlag.length > 0) {
								// 새(도로명) 주소 좌표 매칭
								// 구분 코드
								newMatchFlag = resultCoordinate.newMatchFlag;
								console.log('진입8');
								// 시/도 명칭
								if (resultCoordinate.city_do.length > 0) {
								city = resultCoordinate.city_do;
								newAddress += city+ "\n";
	
							}
	
							// 군/구 명칭
							if (resultCoordinate.gu_gun.length > 0) {
								gu_gun = resultCoordinate.gu_gun;
								newAddress += gu_gun+ "\n";
								console.log('진입9');
							}
	
							// 읍면동 명칭
							if (resultCoordinate.eup_myun.length > 0) {
								eup_myun = resultCoordinate.eup_myun;
								newAddress += eup_myun+ "\n";
							} else {
									// 출력 좌표에 해당하는
									// 법정동 명칭
									if (resultCoordinate.legalDong.length > 0) {
										legalDong = resultCoordinate.legalDong;
										newAddress += legalDong+ "\n";
									}
									// 출력 좌표에 해당하는
									// 행정동 명칭
									if (resultCoordinate.adminDong.length > 0) {
										adminDong = resultCoordinate.adminDong;
										newAddress += adminDong+ "\n";
									}
								}										
								// 출력 좌표에 해당하는 리 명칭
								if (resultCoordinate.ri.length > 0) {
									ri = resultCoordinate.ri;
									newAddress += ri+ "\n";
								}
								// 출력 좌표에 해당하는 지번 명칭
								if (resultCoordinate.bunji.length > 0) {
									bunji = resultCoordinate.bunji;
									newAddress += bunji+ "\n";
								}
								// 새(도로명)주소 매칭을 한
								// 경우, 길 이름을 반환
								if (resultCoordinate.newRoadName.length > 0) {
									newRoadName = resultCoordinate.newRoadName;
									newAddress += newRoadName+ "\n";
								}
								// 새(도로명)주소 매칭을 한
								// 경우, 건물 번호를 반환
								if (resultCoordinate.newBuildingIndex.length > 0) {
									newBuildingIndex = resultCoordinate.newBuildingIndex;
									newAddress += newBuildingIndex+ "\n";
								}
								// 새(도로명)주소 매칭을 한
								// 경우, 건물 이름를 반환
								if (resultCoordinate.newBuildingName.length > 0) {
									newBuildingName = resultCoordinate.newBuildingName;
									newAddress += newBuildingName+ "\n";
								}
								// 새주소 건물을 매칭한 경우
								// 새주소 건물 동을 반환
								if (resultCoordinate.newBuildingDong.length > 0) {
									newBuildingDong = resultCoordinate.newBuildingDong;
									newAddress += newBuildingDong+ "\n";
								}
								// 검색 결과 표출
								if (lonEntr > 0) {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
									/* var text = "검색결과(새주소) : "+ newAddress+ ",\n 응답코드:"+ newMatchFlag+ "(상세 코드 내역은 "+ docs+ " 에서 확인)"+ "</br> 위경도좌표(중심점) : "+ lat+ ", "
																+ lon+ "</br>위경도좌표(입구점) : "+ latEntr+ ", "+ lonEntr; */
									var text = "검색결과(새주소) : "+ newAddress+ "\n "
									$("#endAdd").html(text);
		
								} else {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
									/* var text = "검색결과(새주소) : "+ newAddress+ ",\n 응답코드:"+ newMatchFlag+ "(상세 코드 내역은 "+ docs+ " 에서 확인)"+ "</br> 위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다."; */
									var text = "검색결과(새주소) : "+ newAddress
									$("#endAdd").html(text);
								}
							}
	
						// 구주소일 때 검색 결과 표출
						// 구주소인 경우 newMatchFlag가
						// 아닌 MatchFlag가 응닶값으로
						// 온다
						if (resultCoordinate.matchFlag.length > 0) {
						// 매칭 구분 코드
							matchFlag = resultCoordinate.matchFlag;
		
							// 시/도 명칭
							if (resultCoordinate.city_do.length > 0) {
								city = resultCoordinate.city_do;
								address += city+ "\n";
							}
							// 군/구 명칭
							if (resultCoordinate.gu_gun.length > 0) {
								gu_gun = resultCoordinate.gu_gun;
								address += gu_gun+ "\n";
							}
							// 읍면동 명칭
							if (resultCoordinate.eup_myun.length > 0) {
								eup_myun = resultCoordinate.eup_myun;
								address += eup_myun+ "\n";
							}
							// 출력 좌표에 해당하는 법정동
							// 명칭
							if (resultCoordinate.legalDong.length > 0) {
								legalDong = resultCoordinate.legalDong;
								address += legalDong+ "\n";
							}
							// 출력 좌표에 해당하는 행정동
							// 명칭
							if (resultCoordinate.adminDong.length > 0) {
								adminDong = resultCoordinate.adminDong;
								address += adminDong+ "\n";
							}
							// 출력 좌표에 해당하는 리 명칭
							if (resultCoordinate.ri.length > 0) {
								ri = resultCoordinate.ri;
								address += ri+ "\n";
							}
							// 출력 좌표에 해당하는 지번 명칭
							if (resultCoordinate.bunji.length > 0) {
								bunji = resultCoordinate.bunji;
								address += bunji+ "\n";
							}
							// 출력 좌표에 해당하는 건물 이름
							// 명칭
							if (resultCoordinate.buildingName.length > 0) {
								buildingName = resultCoordinate.buildingName;
								address += buildingName+ "\n";
							}
							// 출력 좌표에 해당하는 건물 동을
							// 명칭
							if (resultCoordinate.buildingDong.length > 0) {
								buildingDong = resultCoordinate.buildingDong;
								address += buildingDong+ "\n";
							}
							// 검색 결과 표출
								var new_lt;
								var new_lo;
								if (lonEntr > 0) {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
									/* var text = "검색결과(지번주소) : "+ address+ ","+ "\n"+ "응답코드:"+ matchFlag+ "(상세 코드 내역은 "+ docs+ " 에서 확인)"+ "</br>"	+ "위경도좌표(중심점) : "
																+ lat+ ", "+ lon+ "</br>"+ "위경도좌표(입구점) : "+ latEntr+ ", "+ lonEntr; */
									var text = "검색결과(지번주소) : "+ address;
									$("#endAdd").html(text);
									
		
								} else {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
									/* var text = "검색결과(지번주소) : "+ address+ ","+ "\n"+ "응답코드:"+ matchFlag+ "(상세 코드 내역은 "+ docs+ " 에서 확인)"
												+ "</br>"+ "위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다."; */
									var text = "검색결과(지번주소) : "+ address;
									$("#endAdd").html(text);
								}
							}
					}

				},

														error : function(
																request,
																status, error) {
															console
																	.log(request);
															console
																	.log("code:"
																			+ request.status
																			+ "\n message:"
																			+ request.responseText
																			+ "\n error:"
																			+ error);
															// 에러가 발생하면 맵을 초기화함
															// markerStartLayer.clearMarkers();
															// 마커초기화
															map
																	.setCenter(new Tmapv2.LatLng(
																			37.570028,
																			126.986072));
															$("#endAdd")
																	.html("");

														}
													});
										});
		
		 $('#btn_save').click(function(){
			console.log('test1');
			var formData = new FormData();
			formData.append("nowLat",$('#latitude').val()); // 현위치 위도
			formData.append("nowLon",$('#longitude').val()); // 현위치 경도
			formData.append("newLat",$('#sch_lat').val()); // 검색위치 위도
			formData.append("newLon",$('#sch_lon').val()); // 검색 위치 경도
			formData.append("tDistance",$('#tDistance').val()); // 총 거리
			formData.append("tTime", $('#tTime').val()); 	// 총 시간
			
			console.log('formData: '+formData);
					
			$.ajax({
				url : 'setting',
				type : 'post',
				data : ,
				processData : false,
				contentType : false,
				cache : false ,
				success : function(data){
					console.log('데이터 전송 성공!' + data);
				},error:function(request,status,error){
				    console.log(error);
				}
			});
			
		
		}); // #btn_save 
		
}); // ready

	// 현재위치 정보 불러오기
	$(function() {

	}); // 현재위치 정보 불러오는 기능

	// 주소 검색 기능
	/* function searchTmap(){
		
		
		//ready 메소드
	}  */

	// 시작, 도착 보행자 경로 안내
	var map;
	var marker_s, marker_e, marker_p1, marker_p2;
	var totalMarkerArr = [];
	var drawInfoArr = [];
	var resultdrawArr = [];

	function initTmap(newlat, newlon, nowlat, nowlon) {
		console.log(newlat);
		console.log(newlon);
		console.log(nowlat);
		console.log(nowlon);

		// 21.02.07 추가
		$('#map_div').html('');

		// 1. 지도 띄우기
		map = new Tmapv2.Map("map_div", {
			//center : new Tmapv2.LatLng(37.570028, 126.989072),
			center : new Tmapv2.LatLng(nowlat, nowlon),
			width : "100%",
			height : "400px",
			zoom : 15,
			zoomControl : true,
			scrollwheel : true
		});

		// 2. 시작, 도착 심볼찍기
		// 시작
		marker_s = new Tmapv2.Marker(
				{
					//position : new Tmapv2.LatLng(37.56689860(위도), 126.97871544(경도)),
					position : new Tmapv2.LatLng(nowlat, nowlon),

					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});

		// 도착
		marker_e = new Tmapv2.Marker(
				{
					//position : new Tmapv2.LatLng(37.57081522(위도), 127.00160213(경도)),
					position : new Tmapv2.LatLng(newlat, newlon),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});

		// 3. 경로탐색 API 사용요청
		$.ajax({
			method : "POST",
			url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
			async : false,
			data : {
				appKey : "l7xxa82c096d66484d37ac10b23c15a64620",
				startX : nowlon, // 경도
				startY : nowlat, // 위도
				angel : 1,
				speed : 60,
				endX : newlon, // 경도
				endY : newlat, // 위도
				reqCoordType : "WGS84GEO", // 출발지, 경유지, 목적지 좌표게 유형  / WGS84GEO(기본값) - 경위도
				resCoordType : "EPSG3857", // 받고자 하는 응답 좌표계 유형 / WGS84GEO(기본값) - 경위도
				startName : "출발지", // %EC%B6%9C%EB%B0%9C
				endName : "목적지" // %EB%B3%B8%EC%82%AC

			},
			success : function(response) {
			var resultData = response.features;

			//결과 출력
			var tDistance = "총 거리 : "+ ((resultData[0].properties.totalDistance) / 1000).toFixed(1) + "km,";
			var tTime = " 총 시간 : "+ ((resultData[0].properties.totalTime) / 60).toFixed(0) + "분";

						$("#result").text(tDistance + tTime);
						$("#tDistance").text(tDistance);
						$("#tTime").text(tTime);

						//기존 그려진 라인 & 마커가 있다면 초기화
						if (resultdrawArr.length > 0) {
							for ( var i in resultdrawArr) {
								resultdrawArr[i].setMap(null);
							}
							resultdrawArr = [];
						}

						drawInfoArr = [];

						for ( var i in resultData) { //for문 [S]
							var geometry = resultData[i].geometry;
							var properties = resultData[i].properties;
							var polyline_;

							if (geometry.type == "LineString") {
								for ( var j in geometry.coordinates) {
									// 경로들의 결과값(구간)들을 포인트 객체로 변환 
									var latlng = new Tmapv2.Point(
											geometry.coordinates[j][0],
											geometry.coordinates[j][1]);
									// 포인트 객체를 받아 좌표값으로 변환
									var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
											latlng);
									// 포인트객체의 정보로 좌표값 변환 객체로 저장
									var convertChange = new Tmapv2.LatLng(
											convertPoint._lat,
											convertPoint._lng);
									// 배열에 담기
									drawInfoArr.push(convertChange);
								}
							} else {
								var markerImg = "";
								var pType = "";
								var size;

								if (properties.pointType == "S") { //출발지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
									pType = "S";
									size = new Tmapv2.Size(24, 38);
								} else if (properties.pointType == "E") { //도착지 마커
									markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
									pType = "E";
									size = new Tmapv2.Size(24, 38);
								} else { //각 포인트 마커
									markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
									pType = "P";
									size = new Tmapv2.Size(8, 8);
								}

								// 경로들의 결과값들을 포인트 객체로 변환 
								var latlon = new Tmapv2.Point(
										geometry.coordinates[0],
										geometry.coordinates[1]);

								// 포인트 객체를 받아 좌표값으로 다시 변환
								var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
										latlon);

								var routeInfoObj = {
									markerImage : markerImg,
									lng : convertPoint._lng,
									lat : convertPoint._lat,
									pointType : pType
								};

								// Marker 추가
								marker_p = new Tmapv2.Marker(
										{
											position : new Tmapv2.LatLng(
													routeInfoObj.lat,
													routeInfoObj.lng),
											icon : routeInfoObj.markerImage,
											iconSize : size,
											map : map
										});
							}
						}//for문 [E]
						drawLine(drawInfoArr);
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n"
								+ "message:" + request.responseText + "\n"
								+ "error:" + error);
					}
				});

	} // 경로 설정 기능

	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}

	function drawLine(arrPoint) {
		var polyline_;

		polyline_ = new Tmapv2.Polyline({
			path : arrPoint,
			strokeColor : "#DD0000",
			strokeWeight : 6,
			map : map
		});
		resultdrawArr.push(polyline_);
	}
	
	
</script>


</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
		<h3>출발지:</h3><br>
		<h3></h3>
		<h3>목적지 </h3><input type="text" class="text_custom" id="fullAddr" name="fullAddr"
			value="서울시 마포구 와우산로29가길 69">
		<button id="btn_select">설정 하기</button>
		<h2 id="endAdd"></h2> <button id="btn_save">저장 하기</button>
		
		<br />
		<br>
		<!-- 경로 지도 -->
		<div id="map_wrap" class="map_wrap3">
			<div id="map_div"></div>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		
		<h2 id="result"></h2>
		<br />
	
		<ul>
			<li>경도:<span id="latitude"></span></li>
			<li>위도:<span id="longitude"></span></li>
	
		</ul>
		<ul>
			<li>경도 검색 결과: <span id="sch_lat"></span></li>
			<li>위도 검색 결과: <span id="sch_lon"></span></li>
		</ul>
		
		<ul>
			<li>총 거리: <span id="tDistance"></span></li>
			<li>총 시간: <span id="tTime"></span></li>
		</ul>
	
	
</body>
</html>
