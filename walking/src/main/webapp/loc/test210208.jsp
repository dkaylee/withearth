 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=utf-8">
<title>simpleMap</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp" %>
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
		
		//시작 버튼 눌렀을 떄 일어나는 함수
	    function startRide(){
	
	    	if(endPointChk==0){
	    		alert('도착지를 지정해주세요!')
	    	}else{
	    		startTime();
	    		movingLocation();
	    		$('#startBtnArea').css("display", "none");
		    	$('#endBtnArea').css("display", "block");
		    	
		    	$("#searchEndPoint").attr("disabled",true);
		    	$("#customSwitch1").attr("disabled",true);
		    	$("#endPoint").attr("disabled",true);
	    	}   	
	    }
		
	
		
		
		
		// Geolocation API에 액세스할 수 있는지를 확인
		//===========현재위치 불러오기===========
		if (navigator.geolocation) {
		//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				$('#latitude').html(pos.coords.latitude); // 위도 ex)37
				$('#longitude').html(pos.coords.longitude); // 경도 ex)126

				now_lat = pos.coords.latitude;
				now_lon = pos.coords.longitude;
				// initTmap()에 pos.coords.latitude, pos.coords.longitude 값을 전달

				console.log("현재 경도" + now_lon);
				console.log("현재 위도" + now_lat);
				// 경로 function으로 현재 위경도, 목적지 위경도 전송
				initTmap(new_lat, new_lon, now_lat, now_lon);
				// 현재 위경도 값을 좌표->주소로 변경하는 function으로 전송
				reverseGeo(now_lon, now_lat);

			});
		} else {
			alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}
		
		



		// ==========목적지 검색==========
		var map, marker1;

		$('#btn_select').click(	function() {
			console.log('진입1');

			// 목적지 설정 마커 초기화
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
							
							// 목적지 위경도 ID 설정
							$("#sch_lat").html(lat); // 검색한 위도
							$("#sch_lon").html(lon); // 검색한 경도
							// 데이터 지정
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
									var text = "검색 결과(새주소) : "+ newAddress+ "\n "
									$("#endAdd").html(text);
		
								} else {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
									/* var text = "검색결과(새주소) : "+ newAddress+ ",\n 응답코드:"+ newMatchFlag+ "(상세 코드 내역은 "+ docs+ " 에서 확인)"+ "</br> 위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다."; */
									var text = "검색 결과(새주소) : "+ newAddress
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
									var text = "검색 결과(지번주소) : "+ address;
									$("#endAdd").html(text);
									
		
								} else {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
									/* var text = "검색결과(지번주소) : "+ address+ ","+ "\n"+ "응답코드:"+ matchFlag+ "(상세 코드 내역은 "+ docs+ " 에서 확인)"
												+ "</br>"+ "위경도좌표(입구점) : 위경도좌표(입구점)이 없습니다."; */
									var text = "검색 결과(지번주소) : "+ address;
									$("#endAdd").html(text);
								}
							}
					}

				},

				error : function(request,status, error) {
					console.log(request);
					console.log("code:"+ request.status+ "\n message:"+ request.responseText+ "\n error:"+ error);
					// 에러가 발생하면 맵을 초기화함
					// markerStartLayer.clearMarkers();
					// 마커초기화
					map.setCenter(new Tmapv2.LatLng(37.570028,126.986072));
					$("#endAdd").html("");

				}
			});
		}); // $('#btn_select')
		
		/*  $('#btn_save').click(function(){
			
			
					
			 */
			 
		
		
}); // ready
	

	// 현재 위치 좌표 -> 주소로 변환
	function reverseGeo(lon, lat) {
	$.ajax({
				method : "GET",
				url : "https://apis.openapi.sk.com/tmap/geo/reversegeocoding?version=1&format=json&callback=result",
				async : false,
				data : {
					"appKey" : "l7xxa82c096d66484d37ac10b23c15a64620",
					"coordType" : "WGS84GEO",
					"addressType" : "A10",
					"lon" : lon,
					"lat" : lat
				},
				success : function(response) {
					// 3. json에서 주소 파싱
					var arrResult = response.addressInfo;

					//법정동 마지막 문자 
					var lastLegal = arrResult.legalDong
							.charAt(arrResult.legalDong.length - 1);

					// 새주소
					newRoadAddr = arrResult.city_do + ' '
							+ arrResult.gu_gun + ' ';

					if (arrResult.eup_myun == ''
							&& (lastLegal == "읍" || lastLegal == "면")) {//읍면
						newRoadAddr += arrResult.legalDong;
					} else {
						newRoadAddr += arrResult.eup_myun;
					}
					newRoadAddr += ' ' + arrResult.roadName + ' '
							+ arrResult.buildingIndex;

					// 새주소 법정동& 건물명 체크
					if (arrResult.legalDong != ''
							&& (lastLegal != "읍" && lastLegal != "면")) {//법정동과 읍면이 같은 경우

						if (arrResult.buildingName != '') {//빌딩명 존재하는 경우
							newRoadAddr += (' (' + arrResult.legalDong
									+ ', ' + arrResult.buildingName + ') ');
						} else {
							newRoadAddr += (' (' + arrResult.legalDong + ')');
						}
					} else if (arrResult.buildingName != '') {//빌딩명만 존재하는 경우
						newRoadAddr += (' (' + arrResult.buildingName + ') ');
					}

					// 구주소
					jibunAddr = arrResult.city_do + ' '
							+ arrResult.gu_gun + ' '
							+ arrResult.legalDong + ' ' + arrResult.ri
							+ ' ' + arrResult.bunji;
					//구주소 빌딩명 존재
					if (arrResult.buildingName != '') {//빌딩명만 존재하는 경우
						jibunAddr += (' ' + arrResult.buildingName);
					}

					revresult = "현재 위치(새주소) : " + newRoadAddr + "</br>";
					/* revresult += "지번주소 : " + jibunAddr + "</br>";
					revresult += "위경도좌표 : " + lat + ", " + lon; */

					var resultDiv = document.getElementById("revresult");
					resultDiv.innerHTML = revresult;

				},
				error : function(request, status, error) {
					console.log("code:" + request.status + "\n"
							+ "message:" + request.responseText + "\n"
							+ "error:" + error);
				}
			});

}

	// 현재위치 정보 불러오기
	$(function() {

	}); // 현재위치 정보 불러오는 기능


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
	
	/*******************************타임워치********************************************/
 	var h = 0;
    var m = 0;
    var s = 0;
	var timetime;
    var exTime;
    
    function calcTime() {
        s = parseInt(s);
        m = parseInt(m);
        h = parseInt(h);
        
        s += 1;
        if (s == 60) {
            m += 1;
            s = 1;
        }
        if (m == 60) {
            h += 1;
            m = 1;
        }                  
    }
    
    function addZeros(num, digit) { // 자릿수 맞춰주기
        var zero = '';
        num = num.toString();
        if (num.length < digit) {
            for (i = 0; i < digit - num.length; i++) {
                zero += '0';
            }
        }
        return zero + num;
    }
    
    function startTime(){
        calcTime();
        var hour = addZeros(h, 2);
        var minute = addZeros(m, 2);
        var second = addZeros(s, 2);           
        timetime = setTimeout("startTime()", 1000);  
        $('#clock').html(hour + ' : ' + minute + ' : ' + second);            
    }
    function stop(){
    	clearTimeout(timetime);
    	exTime = ((h*360) + (m*60) + s) / 60;
    	exTime = exTime.toFixed(2);
    }
    
    /***********************************************************나의 위치*********************************************************/
		
		//각종 변수들
    var DrawLine = DrawLine || {}; // NameSpace
    DrawLine.CNT_BUFF = 10; // 매끄러운 매칭을 위한 버퍼 포인트 개수
    DrawLine.SPLIT_VALUE = 20; // Road API 로 한번에 요청할 포인트 개수. 최대 100개 까지 가능  ex)샘플코드에서는 SPLIT_VALUE 를 10으로 가정했을 때 요청 포인트 개수가 총 25개라면 API 가 3번 호출됨
    DrawLine.REQ_LIMIT_PER_SEC = 1; // API 초당 요청 제한건수
    DrawLine.vectorLayer2 = null; // 이동한도로찾기 API 사용후 벡터 레이어
    DrawLine.arrPoint = null; // 포인트 배열 (resource)
    DrawLine.totDistance = 0; // 매칭된 거리 (단위: m)
    DrawLine.totPointCount = 0; // 매칭된 좌표의 개수 (단위: count)
    DrawLine.arrMatchedId = []; // 매칭된 링크 아이디 (중복제거)
    DrawLine.currentIndex = 0;
    DrawLine.startSourceIndex = 0; // 버퍼 포인트(이전 포인트의 일부를 포함하여 요청)를 제외한 실제 포인트 시작 인덱스
    DrawLine.cntReqApi = 0; // API 요청횟수
    DrawLine.lastMatchedLocation = null; // 이전 마지막 포인트를 저장( 이후 포인트와 연결하기 위함 )
		
    var mylon;
    var mylat;
    var repeat;
    
		//나의 위치를 구해주는 함수
		function myLocation() {
        if (navigator.geolocation) {
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                var mylat = position.coords.latitude;
                var mylon = position.coords.longitude;
              
                DrawLine.arrPoint.push(mylon);
                DrawLine.arrPoint.push(mylat);
                
                console.log(mylon + "," + mylat);               
            });
        }
    }

	//나의 위치를 계속 해서 기록 하는 함수
    function movingLocation() {
		
    	myLocation();
    	
        repeat = setInterval(myLocation, 10000);
    }
	
	//위치 기록 종료
    function stopMyLocation(){
    	if (navigator.geolocation) {
    		navigator.geolocation.getCurrentPosition(function(position) {
   
                var mylat = position.coords.latitude;
                var mylon = position.coords.longitude;
                var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326        
                
                var endPoint = new Tmap.LonLat(mylon, mylat).transform(PR_4326, PR_3857);
                
                myCourse.endPoint = endPoint;
                
                console.log("끝지점 " + endPoint);
    		}); 
    	}
		
        clearInterval(repeat);
    }
    
    /* 내가 이동한 좌표 그리기 함수 */
    function drowMyRoad(){
		setTimeout(function() { // 지도를 띄우고 API 를 호출하기 위해 딜레이 줌
           DrawLine.splitPoint(); // 포인트 데이터 나눠서 요청하기 ( LoadApi 한번에 요청 가능한 개수 100개 제한 )
        }, 1000);
    }
     
    /**
     * 포인트 개수 나누기 ( LoadApi request limit 100 )
     */
    DrawLine.splitPoint = function() {
        var cntAllPoint = DrawLine.arrPoint.length; // 포인트 배열 갯수 구하기
        var pointString = ""; // LoadApi 에 요청할 포인트 스트링
        var arrMatchedPoint = {}; // response 결과
        var i, j, k, cntPointString = 0;
        for (i = DrawLine.currentIndex; i < cntAllPoint; i += 2) {
            // 포인트 스트링 만들기
            // 경도와 위도 사이는 ‘,’ 좌표와 좌표 사이는 ‘|’ 로 구분 지어 요청 합니다.
            if (pointString != "") {
                pointString += '|';
            }
            pointString += DrawLine.arrPoint[i] + ',' + DrawLine.arrPoint[i + 1]; // ex) 127.925710,37.557086|127.954464,37.556542
            cntPointString++; // 포인트 스트링 개수 카운트
            var coord = new Tmap.LonLat(DrawLine.arrPoint[i], DrawLine.arrPoint[i + 1]).transform("EPSG:4326", "EPSG:3857");
            if (cntPointString == DrawLine.SPLIT_VALUE || (i + 2) >= cntAllPoint) {
                // 포인트 개수가 제한 수에 도달했다면 || 반복문의 마지막 항목 이라면 할 작업 
                // 0. LoadApi 요청
                DrawLine.reqLoadApi(pointString, function(response) {
                    DrawLine.cntReqApi++; // API 요청횟수 카운트
                    // LoadApi Response 받은 후 작업
                    var matchedId = ""; // 매칭된 아이디
                    var objNextMatchedLocation = {}; // 바로 직전에 매칭된 좌표
                    var objSourceLocation = {}; // 요청한 좌표
                    var lastSourceIndex = -1; // 요청 포인트 인덱스 번호
                    var arrPointForLine = []; // 선으로 그려질 포인트
                    var arrPointForMarker = []; // 마커로 그려질 포인트
                    var arrPointForCalDistance = []; // 거리 계산을 위한 포인트
                    // 결과 값이 존재한다면 실행할 작업
                    if (response && response.resultData.matchedPoints) {
                        arrMatchedPoint = response.resultData.matchedPoints; // 매칭된 정보 데이터(matchedPoints)를 arrMatchedPoint 배열에 담는다.
                        for (j = 0; j < arrMatchedPoint.length; j++) {
                            objMatchedLocation = arrMatchedPoint[j].matchedLocation;
                            objSourceLocation = arrMatchedPoint[j].sourceLocation;
                            // 1. 매칭 아이디 추가 (중복제거)
                            //----------------------------------------------------------------
                            matchedId = arrMatchedPoint[j].linkId + "_" + arrMatchedPoint[j].idxName;
                            for (k = 0; k < DrawLine.arrMatchedId.length; k++) {
                                if (DrawLine.arrMatchedId[k] == matchedId) {
                                    break;
                                }
                            }
                            if (k >= DrawLine.arrMatchedId.length) {
                                // 중복된 아이디가 존재하지 않는다면 할 작업
                                DrawLine.arrMatchedId.push(matchedId); // 매칭된 아이디 목록에 추가
                            }
                            //----------------------------------------------------------------
                            if (arrMatchedPoint[j].sourceIndex >= 0) {
                                // sourceIndex 가 존재한다면 마지막 sourceIndex 갱신
                                lastSourceIndex = arrMatchedPoint[j].sourceIndex;
                            }
                            // 2. 라인으로 그려질 소스 포인트 리스트 만들기
                            if (objSourceLocation) {
                                arrPointForMarker.push(new Tmap.Geometry.Point(objSourceLocation.longitude, objSourceLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                            }
                            // 3-1. 라인으로 그려질 매칭 포인트 리스트 만들기
                            // 한번에 모든 좌표를 요청하면 문제가 없겠지만 100개 이상의 좌표를 여러번 나눠서 요청해야할 경우 요청과 요청 사이의 매칭된 링크가 어긋날 수 있다.
                            // 이를 보정하기 위해 이전 요청 좌표의 일부(버퍼)를 함깨 요청하고 매 요청의 곂치는 부분의 결과를 (버퍼사이즈/2 만큼)덜 그림으로써 좀더 매끄러운 결과를 얻을 수 있다.
                            if (arrPointForLine.length == 0 && DrawLine.lastMatchedLocation) {
                                // 이전 요청의 마지막 매칭좌표가 존재한다면 현재 매칭 좌표라인의 맨 앞에 추가 ( 이전 요청 라인과 이어지게 하기 위함 )
                                arrPointForLine.push(new Tmap.Geometry.Point(DrawLine.lastMatchedLocation.longitude, DrawLine.lastMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                arrPointForCalDistance.push(DrawLine.lastMatchedLocation); // 거리 계산을 위해 저장
                                DrawLine.lastMatchedLocation = null;
                            }
                            if (cntAllPoint / 2 <= DrawLine.SPLIT_VALUE) {
                                // 1) 처음이자 마지막 요청이라면(전체 요청 좌표개수가 분할요청 기준보다 적다면) => 매칭된 좌표를 모두 라인으로 그림
                                if (objMatchedLocation) {
                                    arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                    arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                }
                            } else if (DrawLine.cntReqApi == 1) {
                                // 2) 처음 요청이면서 이후에 요청이 있을 예정이라면 => 뒤쪽좌표 중 버퍼의 절반 만큼 그리지 않음
                                if (objMatchedLocation && lastSourceIndex < (cntPointString - (DrawLine.CNT_BUFF / 2))) {
                                    arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                    DrawLine.lastMatchedLocation = objMatchedLocation; // 이후 API 요청결과와 라인을 이어가기 위해 마지막 포인트 저장
                                    arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                }
                            } else if (DrawLine.cntReqApi > 1 && (i + 2) >= cntAllPoint) {
                                // 3) 처음이 아니면서 마지막 API 요청이라면 => 앞쪽좌표 중 버퍼의 절반 만큼 그리지 않음
                                if (objMatchedLocation && lastSourceIndex >= (DrawLine.CNT_BUFF / 2)) {
                                    arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                    DrawLine.lastMatchedLocation = objMatchedLocation; // 이후 API 요청결과와 라인을 이어가기 위해 마지막 포인트 저장
                                    arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                }
                            } else if (DrawLine.cntReqApi > 1) {
                                // 4) 처음이 아니면서 이후에 API 요청이 있을 예정이라면 => 앞쪽좌표 중 버퍼의 절반, 뒤쪽좌표 중 버퍼의 절반 만큼 그리지 않음
                                if (objMatchedLocation && lastSourceIndex >= (DrawLine.CNT_BUFF / 2) && lastSourceIndex < (cntPointString - (DrawLine.CNT_BUFF / 2))) {
                                    arrPointForLine.push(new Tmap.Geometry.Point(objMatchedLocation.longitude, objMatchedLocation.latitude).transform("EPSG:4326", "EPSG:3857")); // 좌표변환
                                    DrawLine.lastMatchedLocation = objMatchedLocation; // 이후 API 요청결과와 라인을 이어가기 위해 마지막 포인트 저장
                                    arrPointForCalDistance.push(objMatchedLocation); // 거리 계산을 위해 저장
                                }
                            }
                        }
                        // 3-2. 매칭 포인트 리스트로 라인 그리기
                        // 요청한 좌표와 매칭되는 좌표를 사용해 라인을 그려줍니다.(파랑색)
                        // 마커를 추가합니다.
                        var lat = DrawLine.arrPoint[DrawLine.arrPoint.length-1];
                		var lon = DrawLine.arrPoint[DrawLine.arrPoint.length-2];
                		var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                		var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326        
                		var lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);
                		var size = new Tmap.Size(24, 38);
                		var offset = new Tmap.Pixel(-(size.w / 2), -(size.h));
                		var icon = new Tmap.IconHtml('<img src=http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_e.png />', size, offset);
                		var marker = new Tmap.Marker(lonlat, icon);
                		
                		markerEndPointLayer.addMarker(marker);
                        DrawLine.drawLine(arrPointForLine);
                        // 4. 매칭된 좌표의 거리 구하기
                        for (k = 0; k < (arrPointForCalDistance.length - 1); k++) {
                            DrawLine.totDistance += DrawLine.calDistance(arrPointForCalDistance[k].longitude, arrPointForCalDistance[k].latitude, arrPointForCalDistance[k + 1].longitude, arrPointForCalDistance[k + 1].latitude);
                        }
                        
                        // 거리 계산용 포인트 리스트 초기화
                        arrPointForCalDistance = [];
                    }
                });
                if ((i + 2) < cntAllPoint) {
                    // 마지막 항목이 아니라면 버퍼 포인트 추가
                    pointString = ""; // LoadAPI 의 파라미터 초기화
                    cntPointString = 0; // 포인트 스트링 개수 초기화(LoadAPI 에 포인트 분할 요청을 위한 카운트)
                    i -= (DrawLine.CNT_BUFF * 2); // 매끄러운 링크 매칭을 위해 이전 일부 포인트를 포함한 매칭을 한다. (매칭 버퍼)
                    DrawLine.startSourceIndex = DrawLine.CNT_BUFF; // 매칭 버퍼 포인트를 제외하고 매칭 좌표 수를 카운트 하기 위한 변수
                    
                }
                DrawLine.currentIndex = i;
                console.log("총 거리 : " + DrawLine.totDistance.toFixed(2) + "m");
            	changeCss();
            	saveData();  
            }             
        }
    }
    /**
     * 라인 그리기
     */
    DrawLine.drawLine = function(pointList) {
        // 지도상에 그려질 스타일을 설정합니다.
        var lineStyle = {
            strokeWidth: 6,
            strokeColor: "#0000FF"
        };
        lineString = new Tmap.Geometry.LineString(pointList); // 라인 스트링 생성
        lineFeature = new Tmap.Feature.Vector(lineString, null, lineStyle); // 백터 생성
        DrawLine.vectorLayer2.addFeatures([lineFeature]); // 백터를 백터 레이어에 추가
        
    }
    /**
     * 로드 매칭 API 요청
     */
    DrawLine.reqLoadApi = function(pointString, callback) {
        var url = 'https://apis.openapi.sk.com/tmap/road/matchToRoads?version=1&appKey=6d5877dc-c348-457f-a25d-46b11bcd07a9'; // 이동한 도로 찾기 api 요청 url입니다.
        $.ajax({
            type: 'POST',
            contentType: "application/x-www-form-urlencoded",
            url: url,
            data: {
                "responseType": "1", // 1:전체 데이터 요청, 2:요청좌표 및 매치된 좌표를 제외한 데이터 요청
                "coords": pointString // 좌표계는 WGS84GEO, 매핑에 사용될 좌표 목록입니다.  경도와 위도 사이는 "," 좌표와 좌표 사이에는 "|"로 구분지어 요청합니다. 
            },
            async: false,
            success: function(data) {
                callback(data);
            }
        });
    }
    /**
     * 위경도로 거리 구하기
     */
    DrawLine.calDistance = function(lon1, lat1, lon2, lat2) {
        var theta, dist;
        if (lon1 == lon2 && lat1 == lat2)
            return 0;
        theta = lon1 - lon2;
        dist = Math.sin(DrawLine.deg2rad(lat1)) * Math.sin(DrawLine.deg2rad(lat2)) + Math.cos(DrawLine.deg2rad(lat1)) *
            Math.cos(DrawLine.deg2rad(lat2)) * Math.cos(DrawLine.deg2rad(theta));
        dist = Math.acos(dist);
        dist = DrawLine.rad2deg(dist);
        dist = dist * 60 * 1.1515;
        dist = dist * 1.609344; // 단위 mile 에서 km 변환
        dist = dist * 1000.0; // 단위  km 에서 m 로 변환
        return Number(Number(dist).toFixed(2));
    }
    /**
     * 주어진 도(degree) 값을 라디언으로 변환
     */
    DrawLine.deg2rad = function(deg) {
        return (deg * Math.PI / 180);
    }
    /**
     * 주어진 라디언(radian) 값을 도(degree) 값으로 변환
     */
    DrawLine.rad2deg = function(rad) {
        return (rad * 180 / Math.PI);
    }
    
    /**
     * 포인트 배열 초기화
     */
    DrawLine.initData = function() {
        DrawLine.arrPoint = [];          
    }
		var realDistance;
		
    function endRide(){
    	
    	var myLat = direct.endPoint.lat;
     	var myLon = direct.endPoint.lon;
     	var distance;
 
    	if (navigator.geolocation) {
            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
                // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
              
                DrawLine.arrPoint.push(lon);
                DrawLine.arrPoint.push(lat);
                
                var PR_3857 = new Tmap.Projection("EPSG:3857"); // Google Mercator 좌표계인 EPSG:3857
                var PR_4326 = new Tmap.Projection("EPSG:4326"); // WGS84 GEO 좌표계인 EPSG:4326   
                
                lonlat = new Tmap.LonLat(lon, lat).transform(PR_4326, PR_3857);
                distance = Math.sqrt(Math.pow((lonlat.lon-myLon),2) + Math.pow((lonlat.lat-myLat),2));
                realDistance = distance.toFixed(3);
                
                console.log(":::::종료 시 위치는 " + myLon + "," + myLat);
                console.log("::::::종료지점 위치는 " + lonlat.lon + "," + lonlat.lat); 
                console.log(":::::거리는 " + realDistance);
                realEnd();
            });
        }    	
		 }
    
    function realEnd(){
       	 if(realDistance <= 100){
       		 alert('라이딩 종료!');
       		 //라이딩 종료
             stop(); // 타이머 종료
             stopMyLocation(); //내 위치 받기 종료
             drowMyRoad(); //내가 이동한 위치 그리기   	
       		       		
       	 } else{
       		var askEnd = confirm('목표지점에 도달하지 못했습니다. 종료하시겠습니까?');

       		if(askEnd == true){
       			stop(); // 타이머 종료
                stopMyLocation(); //내 위치 받기 종료
                drowMyRoad(); //내가 이동한 위치 그리기   	
       		}            
       	 }    
    }
	
	
</script>


</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
		<h2>걷기 인증 서비스</h2>
	
		<h2>출발지(현재 위치)</h2><h3 id="revresult"></h3><br>
		
		<h2>목적지 </h2><input type="text" class="text_custom" id="fullAddr" name="fullAddr"
			value="ex)서울시 마포구 와우산로29가길 69">
		<button id="btn_select">설정 하기</button>
		<h3 id="endAdd"></h3> <button id="btn_save">저장 하기</button>
		
		<br />
		<br>
		<!-- 경로 지도 -->
		<div id="map_wrap" class="map_wrap3">
			<div id="map_div"></div>
		</div>
		<div class="map_act_btn_wrap clear_box"></div>
		
		<h2 id="result"></h2>
		<br />
		<!-- 타임 워치 -->
		
	
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
		
		<!-- 타임워치  -->
		<div id="clock" class="contents">
        </div>
        
		<!-- 해당 운동에 대한 레코드 기록 보여주기  -->
		<div id="myRecord" style="display: none">
		<div class="row">			
			<div class="col">
				<h4>Distance</h4>
				<div class="contents" id=todayDistance></div>
					<p>meter</p>
				</div>
				
				<div class="col">
				<h4>Time</h4>
					<div class="contents" id=todayTime></div>
					<p>minute</p>
				</div>			
			</div>
		</div>
		<br>
		<div id="btnArea">
			<div id="startBtnArea">
				
				<input type="button" class="btn btn-primary btn-lg btn-block" onclick="startRide()" value="시작하기">
			</div>
			<div id="endBtnArea" style="display: none">
				<input type="button" class="btn btn-primary btn-lg btn-block" onclick="endRide()" value="종료하기">
			</div>
			
			<div id="regMyCourseBtn" style="display: none">
				<!-- a trigger modal -->
				<input type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myCourseModal" value="나의 코스 등록">			
			</div>
		
	
	
</body>
</html>
