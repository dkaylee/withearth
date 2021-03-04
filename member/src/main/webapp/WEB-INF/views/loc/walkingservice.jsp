<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>Walking Service</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxa82c096d66484d37ac10b23c15a64620"></script>

<!-- modal 부트스트랩 -->	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
	
<%@ include file="/WEB-INF/views/include/basicset.jsp" %>

<style>


.mainPage{	
	margin-top: 5%;
	margin-left: 10%;
	margin-right: 10%;
}

#mainInfo{
	float: left;
	margin:50px 0;
	font-weight: bolder;
}

#startBtn{margin-bottom: 1%; width: 48%;  }

#arriveBtn{margin-bottom: 1%;  width: 48%;  margin-left: 2%;}

#InfoBtn{margin-bottom: 1%; }

#startInfo{
	clear:left;
	margin: 0 20px;
	font-weight: bolder;
 }
 
 #endInfo{
 	margin: 0 20px;
 	font-weight: bolder;
 }

#fullAddr{margin-top: 3%; margin-left: 0%; width: 75%; float: left; overfloat: hidden;}

#btn_select{
	margin-top: 3%;
	margin-left: 2%;
	overflow: hidden;
	width: 22%;
	
}

#endAdd{margin-bottom: 10%;}

#clock{
	margin-top: 10%;
	font-size: larger;
	text-align: center;
	width: 100%;
}

#restart{
	margin-bottom: 1%;
	width: 48%;
	display: none;
}

#stopTimer{
	margin-bottom: 1%;
	width: 49%;
	display: none;
	 margin-left: 1%;
}

#walkingResult{
	display: none;
}

#saveBtn{
	display: none;
	margin-bottom: 1%;
	width: 47%; margin-left: 1%;
}

#modalChk{
	margin-bottom: 1%;
	width: 47%; margin-left: 1%;
}

</style>


<script type="text/javascript">
	
	//jQuery.noConflict(); -> 부트스트랩 모달 충돌 방지
	

	var now_lat = $('#nowLat'); 	// 현재 위치 위도
	var now_lon = $('#nowLon'); 	// 현재 위치 경도
	var new_lat = $('#newLat'); 	// 목적지 위치 위도
	var new_lon = $('#newLon'); 	// 목적지 위치 경도
	new_lat = 37.57081522;			// 목적지 위도 기본값
	new_lon = 127.00160213;			// 목적지 경도 기본값
	var newAddress=''; 				// 목적지 주소
	
	$(document).ready(function() {
		// Geolocation API에 액세스할 수 있는지를 확인
		/*******************************현재 위치 불러오는 기능********************************************/
		if (navigator.geolocation) {
		//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				$('#latitude').html(pos.coords.latitude); 		// 위도 ex)37.xxx -> ssl 사용 -> ssl 등록(aws)
				$('#longitude').html(pos.coords.longitude); 	// 경도 ex)126.xxx
				now_lat = pos.coords.latitude;
				now_lon = pos.coords.longitude;
				
				// initTmap()에 pos.coords.latitude, pos.coords.longitude 값을 전달
				console.log("현재 경도" + now_lon);
				console.log("현재 위도" + now_lat);
				
				// 경로 function으로 현재 위경도, 목적지 위경도 전송
				initTmap(new_lat, new_lon, now_lat, now_lon);
				
				// 현재 위경도 값을 좌표 -> 주소로 변경하는 function으로 전송
				reverseGeo(now_lon, now_lat);
			});
		} else {
			alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}
		
		
		/*******************************목적지 검색 기능(newAddress(목적지 주소))********************************************/
		var map, marker1;
		
		$('#btn_select').click(	function() {
			
			// 목적지 초기화 
			newAddress='';
			
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
					// 3.마커 찍기
					// 검색 결과 정보가 없을 때 처리
					if (resultInfo.coordinate.length == 0) { // coordinate -> 좌표 정보
						$("#addresult").text("요청 데이터가 올바르지 않습니다.");
					} else {
					
						var lon, lat;
						var resultCoordinate = resultInfo.coordinate[0];
						if (resultCoordinate.lon.length > 0) {
							
							
							lon = resultCoordinate.lon;
							lat = resultCoordinate.lat;
							
							// 목적지 위경도 ID 설정
							$("#sch_lat").html(lat); // 검색한 위도
							$("#sch_lon").html(lon); // 검색한 경도
							// 데이터 지정
							var new_lat = lat;
							var new_lon = lon;
	
	
							initTmap(new_lat,new_lon,now_lat,now_lon);		// 보행자 경로 안내 지도 function
							arrChk(new_lat,new_lon,now_lat,now_lon);		// 도착버튼 function
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
							arrChk(new_lat,new_lon,now_lat,now_lon);
						}
						var lonEntr, latEntr;
						if (resultCoordinate.lonEntr == undefined&& resultCoordinate.newLonEntr == undefined) {
							lonEntr = 0;
							latEntr = 0;
						} else {
							if (resultCoordinate.lonEntr.length > 0) {
								lonEntr = resultCoordinate.lonEntr;
								latEntr = resultCoordinate.latEntr;
							} else {
								lonEntr = resultCoordinate.newLonEntr;
								latEntr = resultCoordinate.newLatEntr;
							}
						}
						var markerPosition = new Tmapv2.LatLng(Number(lat),Number(lon));
						//map.setCenter(markerPosition); //21.02.05 -> 주석처리하니 에러 없음. 위경도좌표도 나옴. km, 
						// 검색 결과 표출
						var matchFlag, newMatchFlag;
						// 검색 결과 주소를 담을 변수
						var address = '';
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
								// 시/도 명칭
								if (resultCoordinate.city_do.length > 0) {
								city = resultCoordinate.city_do;
								newAddress += city+ " ";
	
							}
	
							// 군/구 명칭
							if (resultCoordinate.gu_gun.length > 0) {
								gu_gun = resultCoordinate.gu_gun;
								newAddress += gu_gun+ " ";
							}
	
							// 읍면동 명칭
							if (resultCoordinate.eup_myun.length > 0) {
								eup_myun = resultCoordinate.eup_myun;
								newAddress += eup_myun+ " ";
							} else {
									// 출력 좌표에 해당하는
									// 법정동 명칭
									if (resultCoordinate.legalDong.length > 0) {
										legalDong = resultCoordinate.legalDong;
										newAddress += legalDong+ " ";
									}
									// 출력 좌표에 해당하는
									// 행정동 명칭
									if (resultCoordinate.adminDong.length > 0) {
										adminDong = resultCoordinate.adminDong;
										newAddress += adminDong+ " ";
									}
								}										
								// 출력 좌표에 해당하는 리 명칭
								if (resultCoordinate.ri.length > 0) {
									ri = resultCoordinate.ri;
									newAddress += ri+ " ";
								}
								// 출력 좌표에 해당하는 지번 명칭
								if (resultCoordinate.bunji.length > 0) {
									bunji = resultCoordinate.bunji;
									newAddress += bunji+ " ";
								}
								// 새(도로명)주소 매칭을 한
								// 경우, 길 이름을 반환
								if (resultCoordinate.newRoadName.length > 0) {
									newRoadName = resultCoordinate.newRoadName;
									newAddress += newRoadName+ " ";
								}
								// 새(도로명)주소 매칭을 한
								// 경우, 건물 번호를 반환
								if (resultCoordinate.newBuildingIndex.length > 0) {
									newBuildingIndex = resultCoordinate.newBuildingIndex;
									newAddress += newBuildingIndex+ " ";
								}
								// 새(도로명)주소 매칭을 한
								// 경우, 건물 이름를 반환
								if (resultCoordinate.newBuildingName.length > 0) {
									newBuildingName = resultCoordinate.newBuildingName;
									newAddress += newBuildingName+ " ";
								}
								// 새주소 건물을 매칭한 경우
								// 새주소 건물 동을 반환
								if (resultCoordinate.newBuildingDong.length > 0) {
									newBuildingDong = resultCoordinate.newBuildingDong;
									newAddress += newBuildingDong+ " ";
								}
								// 검색 결과 표출
								if (lonEntr > 0) {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
									var text = "검색 결과(새주소) "+" \n "+ newAddress+ "\n "
									console.log('newaddress'+newAddress);
									$("#endAdd").html(text);
									// modal 전용 id를 만들어서 사용 -> 데이터 값 뒤에 text 추가 
									$("#modalEnd").html(newAddress+" ");
		
								} else {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
									var text = "검색 결과(새주소): "+" \n " + newAddress
									console.log('newaddress'+newAddress);
									$("#endAdd").html(text);
									// modal 전용 id를 만들어서 사용 -> 데이터 값 뒤에 text 추가 
									$("#modalEnd").html(newAddress+" ");
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
								address += city+ " ";
							}
							// 군/구 명칭
							if (resultCoordinate.gu_gun.length > 0) {
								gu_gun = resultCoordinate.gu_gun;
								address += gu_gun+ " ";
							}
							// 읍면동 명칭
							if (resultCoordinate.eup_myun.length > 0) {
								eup_myun = resultCoordinate.eup_myun;
								address += eup_myun+ " ";
							}
							// 출력 좌표에 해당하는 법정동
							// 명칭
							if (resultCoordinate.legalDong.length > 0) {
								legalDong = resultCoordinate.legalDong;
								address += legalDong+ " ";
							}
							// 출력 좌표에 해당하는 행정동
							// 명칭
							if (resultCoordinate.adminDong.length > 0) {
								adminDong = resultCoordinate.adminDong;
								address += adminDong+ " ";
							}
							// 출력 좌표에 해당하는 리 명칭
							if (resultCoordinate.ri.length > 0) {
								ri = resultCoordinate.ri;
								address += ri+ " ";
							}
							// 출력 좌표에 해당하는 지번 명칭
							if (resultCoordinate.bunji.length > 0) {
								bunji = resultCoordinate.bunji;
								address += bunji+ " ";
							}
							// 출력 좌표에 해당하는 건물 이름
							// 명칭
							if (resultCoordinate.buildingName.length > 0) {
								buildingName = resultCoordinate.buildingName;
								address += buildingName+ " ";
							}
							// 출력 좌표에 해당하는 건물 동을
							// 명칭
							if (resultCoordinate.buildingDong.length > 0) {
								buildingDong = resultCoordinate.buildingDong;
								address += buildingDong+ " ";
							}
							// 검색 결과 표출
								var new_lt;
								var new_lo;
								if (lonEntr > 0) {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
									var text = "검색 결과(지번주소) \n"+"\n"+ address;
									console.log('address'+address);
									newAddress = address;	// newAddress에 값을  저장해서 데이터 전송
									$("#endAdd").html(text);
									// modal 전용 id를 만들어서 사용 -> 데이터 값 뒤에 text 추가 
									$("#modalEnd").html(newAddress+" ");
									
		
								} else {
									var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>";
									var text = "검색 결과(지번주소)"+" \n "+ address;
									console.log('address'+address);
									newAddress = address; // newAddress에 값을  저장해서 데이터 전송
									$("#endAdd").html(text);
									// modal 전용 id를 만들어서 사용 -> 데이터 값 뒤에 text 추가 
									$("#modalEnd").html(newAddress+" ");
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
		
		
}); // ready
	
	
	
		
	    	
     
	
	/*******************************현재 위치 좌표 -> 주소로 변환 기능(revresult(출발지 주소))********************************************/
	var revresult;
	function reverseGeo(lon, lat) {
		$.ajax({
					method : "GET",
					url : "https://apis.openapi.sk.com/tmap/geo/reversegeocoding?version=1&format=json&callback=revresult",
					async : false,
					data : {
						appKey : "l7xxa82c096d66484d37ac10b23c15a64620",
						coordType : "WGS84GEO",
						addressType : "A10",
						lon : lon,
						lat : lat
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
						
						revresult =  newRoadAddr;
						//result += "지번주소 : " + jibunAddr + "</br>";
						//result += "위경도좌표 : " + lat + ", " + lon;
						$("#revresult").html(revresult);
						/* modal 전용 id를 만들어서 사용 -> 데이터 값 뒤에 text 추가 */
						$("#modalrevresult").html(revresult + " ");
						
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
	/*******************************보행자 경로 안내 기능(marker_s(출발지 마커), marker_e(목적지 마커), tDistance(이동거리), aTime(소요시간))********************************************/
	var map;
	var marker_s, marker_e, marker_p1, marker_p2;
	var totalMarkerArr = [];
	var drawInfoArr = [];
	var resultdrawArr = [];
	var tDistance, aTime;
	function initTmap(newlat, newlon, nowlat, nowlon) {
		console.log('목적지 위도: '+newlat);
		console.log('목적지 경도: '+newlon);
		console.log('출발지(현재위치) 위도:'+nowlat);
		console.log('출발지(현재위치) 경도: '+nowlon);
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
			method : "GET",
			url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
			async : false,
			data : {
				appKey : "l7xxa82c096d66484d37ac10b23c15a64620",
				startX : nowlon, // 경도
				startY : nowlat, // 위도
				angel : 1,
				speed : 60,
				endX : newlon, 	// 경도
				endY : newlat, 	// 위도
				reqCoordType : "WGS84GEO", 	// 출발지, 경유지, 목적지 좌표계 유형  - WGS84GEO(기본값) - 경위도
				resCoordType : "EPSG3857", 	// 지구 위의 위치를 나타내는 좌표 타입  - Google Mercator
				startName : "출발지", 		// %EC%B6%9C%EB%B0%9C
				endName : "목적지" 			// %EB%B3%B8%EC%82%AC
			},
			success : function(response) {
			var resultData = response.features;
			//결과 출력
			tDistance =  ((resultData[0].properties.totalDistance) / 1000).toFixed(1) ;
			console.log('test: ' + tDistance);
			aTime =  ((resultData[0].properties.totalTime) / 60).toFixed(0) ;
			$("#result").text("총 "+tDistance+ " km," + " 약 : "+aTime+ " 분");
			$("#tDistance").html(tDistance);
			$("#aTime").html(aTime);
			// modal에 사용될 id // modal 전용 id를 만들어서 사용 -> 데이터 값 뒤에 text 추가 
			$("#modalDistance").html(tDistance+ "km");
			
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
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
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
	
	//시작 버튼 눌렀을 떄 일어나는 함수
    //function startWalk(){
		//	startTime(); 
			/* if(new_lat==37.57081522&&new_lon==127.00160213){
	    		alert('기본값으로 목적지를 설정합니다.(목적지: 종로5가역)');
	    	}else{
	    		console.log('걷기를 시작합니다.');
	    	}  */  			
	//}// startWalk
	
	/*******************************목적지 도착 기능********************************************/
	var distance;
	var confirm_test = null;
	var end_lat;
	var end_lon;
	function arrChk( arrlat, arrlon){
		
		$("#arriveBtn").click(function(){ 
			
			 if (navigator.geolocation) {
				//위치 정보를 얻기
					navigator.geolocation.getCurrentPosition(function(pos) {
						$('#endlatitude').html(pos.coords.latitude); 		// 위도 ex)37.xxx -> ssl 사용 -> ssl 등록(aws)
						$('#endlongitude').html(pos.coords.longitude); 	// 경도 ex)126.xxx
						end_lat = pos.coords.latitude;
						end_lon = pos.coords.longitude;
						
						console.log("arriveBtn 도착 경도" + end_lon);
						console.log("arriveBtn 도착 위도" + end_lat);
					});
				} else {
					alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
				} 
			
			console.log('도착1');
			// 3. 직선거리 계산  API 사용요청
			$.ajax({
						method : "GET",
						url : "https://apis.openapi.sk.com/tmap/routes/distance?version=1&format=json&callback=result",//
						async : false,
						data : {
							appKey : "l7xxa82c096d66484d37ac10b23c15a64620",
							startX : arrlon,
							startY : arrlat,
							endX : end_lon,
							endY : end_lat,
							reqCoordType : "WGS84GEO"
						},
						success : function(response) {
							//console.log(response);
							distance = response.distanceInfo.distance;
		
							$("#arrresult").text("두점의 직선거리 : " + distance + "m");
							console.log('두점의 직선거리'+distance + 'm');
							
							
						},
						error : function(request, status, error) {
							console.log("code:" + request.status + "\n"
									+ "message:" + request.responseText + "\n"
									+ "error:" + error);
						}
					}); //ajax
					
					if(distance <= 100){ // 거리가 약 반경 100m 내의 있을 경우
						stop();
						
						confirm_test = confirm("목적지 부근입니다. 서비스를 종료하시겠습니까?");
						if(confirm_test==true){
							//$('#testBtn').click(function(e){
								//e.preventDefault();
								/* $('#testModal').modal('show'); */
								$('#walkingResult').show();
								$('#saveBtn').show();
							//});
							
							console.log('목적지 도착');
						}else{
							// 되돌아가기 
						}
					
						
					// 모달
					} else{
						alert('목적지에 도착하지 않았습니다. 위치를 다시 한번 확인해주세요.');
					}
		 }); 
	} // arriveBtn
	
	/*******************************스톱워치 기능********************************************/
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
    
    var hour, minute, second;
    var walkTime;  // 소요 시간
    var modalwTime; // 모달 전용 소요 시간 
    
    /*****스톱워치 시작 기능*****/
    function startTime(){
   		 $('#restart').show();
      	 $('#stopTimer').show();
    	//if(new_lat==37.57081522&&new_lon==127.00160213){
    	//	alert('목적지가 기본값으로 설정되어있습니다. 다시 시도해주세요.');
    		
    	//} else{
    		calcTime();
	        hour = addZeros(h, 2);
	        minute = addZeros(m, 2);
	        second = addZeros(s, 2);           
	        timetime = setTimeout("startTime()", 1000);  
	        
	        $('#clock').html(hour + ' : ' + minute + ' : ' + second);    
	        
	        walkTime = hour + minute + second;
	        modalwTime = hour + ":" + minute + ":" +second + " ";
	        
    	//}
    	
    }
    
    /*****스톱워치 정지 기능*****/
    
    var tTime;
    function stop(){
    	clearTimeout(timetime);
    	exTime = ((h*360) + (m*60) + s) / 60;
    	exTime = exTime.toFixed(2);
    	
    	
    	tTime = modalwTime;
    	console.log('tTime', tTime);
    	
    	$('#modalTime').html(modalwTime);
    	
    } // 타임워치 -끝-
    
	/*******************************데이터 저장 기능********************************************/
	function saveData(){
    	
		var idx = ${loginInfo.idx};
		console.log(idx);
    	
		$.ajax({
			url: '<c:url value="/member/loc/walkingservice"/>',
			type: 'post',
			data: {
				tdistance: tDistance, 	// 이동 거리
				atime: aTime, 			// 예상 시간
				startAdd: revresult, 	// 출발지 주소
				endAdd: newAddress,  	// 목적지 주소 -> newAddress를 전역 변수로 저장해서 값을 불러온다.
				ttime: tTime,			// 소요 시간
				uIdx: idx				// 회원 idx 값
			}, 
			success: function(data){
				
				
				//반환되는 데이터:idx
				console.log('data',data);
			    console.log('tdistance', tDistance)
			    // idx+이동거리 ->   ajax -> 포인트적립으로 이동
			    //로그인한 회원 idx ->
			    //배포주소로,,

			    console.log('uidx', idx);
				console.log('cidx', data);
 				$.ajax({

				

				
					url: 'https://www.withearthdona.tk/point/rest/user/point/course?idx='+idx+'&cIdx='+data+'&distance='+tDistance,
					type: 'get',
					//data:{
						//cIdx: data,
						//course_km: tDistance
					//},
					
					success: function(data){
						alert('데이터 전송을 완료했습니다.');
						var cc= '<c:out value="${result}"/>';
						console.log(cc);
						console.log('pdata',data);
						console.log('uidx', idx);
						console.log('cidx', data);
					},
					error: function(error){
						console.log(error);
						console.log('포인트 적립 실패');
					}
				}); // point-ajax 
				
				alert('코스 저장을 성공했습니다.');
			},
			error: function(error){
				console.log(error)
				console.log('저장 실패');
			}
			
		}); // saveData ajax
	} // saveData
	
	
	
	
    /*******************************모달창 기능********************************************/
    
   /*  var myModal = document.getElementById('myModal');
	var myInput = document.getElementById('myInput');

	/* myModal.addEventListener('shown.bs.modal', function () {
	  myInput.focus()
	}) */
    
    /* function infoModal(){
    	$('#InfoModal').modal('show');
	}  */
    
	
	
</script>


</head>
<body>
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		
		<%@ include file="/WEB-INF/views/include/course_nav.jsp" %>
		
		
		
		<div class="mainPage">
			
			
			<!--  -->
			<h2 style="" id="mainInfo">걷기 인증 서비스</h2> 
			
			<h4 id="startInfo">◇ 출발지(현재 위치)</h4> <h4 id="revresult" style="margin: 10px 30px"></h4><br>
			<h4 id="endInfo">◇ 목적지 <br />(ex.서울특별시 종로구 종로5가)</h4>
			<input type="text"   class="text_custom" id="fullAddr" name="fullAddr"
				value="서울특별시 종로구 종로5가"><button id="btn_select" class="button special" >설정</button> 
			<h4 id="endAdd" style="margin: 10px 30px;"></h4>
			
			<button id="startBtn" class="button special" onclick="startTime()">시작</button>
			<button id="arriveBtn" class="button special">도착</button><br>
			<!-- <button id="InfoBtn" class="button special" onclick="infoModal()" >올바르게 걷는 방법</button> -->
			
			<br>
			
			
			
			<!-- 타임워치  -->
			<h3 id="clock" class="contents"></h3>
			<!-- 타임워치 정지 버튼 -->
			<button id="restart" class="button special" onclick="startTime();">다시 시작</button>
			<button id="stopTimer" class="button special" onclick="stop();">일시 정지</button>
			
			<!-- 도보 결과 출력 -->
			<div id="walkingResult">
				<h4 >출발지 </h4><h3 id="modalrevresult" ></h3><br>
				<h4 >목적지 </h4><h3 id="modalEnd" ></h3><br>
				<h4 >이동 거리 </h4><h3 id="modalDistance" > </h3><br>
				<h4 >소요 시간 </h4><h3 id="modalTime"  ></h3>
			</div>
			<button class="button special" id="saveBtn" type="button" onclick="saveData()">저장</button>
			
			<!-- 예상 이동 거리, 도보 시간  출력-->
			<h3 id="result" style="float: right"></h3>
			
			<!-- 경로 지도 -->			
			<div id="map_wrap"  class="map_wrap3">
				<div id="map_div" style="width: 600px" ></div>
			</div>
			<div class="map_act_btn_wrap clear_box"></div>
			<br />
			
			<br>
		</div>



	<!-- Modal content -->
	<!-- <button id="testBtn" class="btn">모달 테스트</button> -->
  <!-- 완주 확인 Modal-->
	 <!-- <div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">코스 완주 성공!</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> modal id 값을 따로 만들어서 조회
					출발지<br><h3 id="modalrevresult"></h3>
					목적지<br><h3 id="modalEnd"></h3>
					이동 거리<br><h3 id="modalDistance"> </h3>
					소요 시간<br><h3 id="modalTime"></h3>
					
				</div>
				<div class="modal-footer">
					<button class="button special" id="saveBtn" type="button" onclick="saveData()">저장</button>
					<button class="button special" type="button" data-dismiss="modal" id="modalChk">확인</button>
				</div>
			</div>
		</div>
		
	</div>  -->
	
	<!-- 올바른 걷기 자세 안내 Modal-->
 
	
		
	</div>
	
	<!-- InfoModal -->
		<%-- <div class="modal fade" id="InfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">종이류, 종이팩</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <h3 style="font-weight: bolder;">운동 순서</h3>
					<h4>1. 배에 힘을 주고 등을 곧게 편다. 발을 내딛으면서 바깥쪽이 먼저 바닥에 닿도록 해야 몸이 받는 충격을 최대한 흡수할 수 있다.</h4>
					<h4>2. 발바닥이 마지막으로 지면에 닿는 순간 가볍게 바닥을 밀어 힘들이지 않고 속도를 낸다. 체중은 발뒤꿈치 바깥쪽을 시작으로 발 가장자리에서 엄지발가락 쪽으로 이동시킨다.</h4>
					<h4>3. 몸의 중심이 앞으로 이동했으면 다른 쪽 발을 내딛을 수 있도록 발뒤꿈치를 들어준다. 팔은 자연스럽게 앞뒤로 흔들고 팔의 움직임과 함께 어깨를 자연스럽게 좌우로 돌린다.</h4>
					<img alt="walkingInfo1" src="<c:url value="/img/walkingInfo.png"/>" style="width: 100%;">
					
					<h6>출처: [네이버 지식백과] 걷기 [walking] (유산소운동 바로 알기, 최대혁, 국민체육진흥공단 체육과학연구원)</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- InfoModal 끝 --> --%>
	
	<div> <!-- footer와 본문 사이 간격 조정 -->
		<br/>
	</div>
	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	
	
</body>
</html>