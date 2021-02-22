<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
/* 상단 버튼 css */



#moveBtn {
	color: #5385c1;
	background-color: #d4e0ef;
}

#moveBtn:hover {
	background-color: #5385c1;
	color: white;
}



.menu{
	margin-top: 10%;
	margin-left: 15%;
	
	margin-bottom: 0;
}

</style>
	<!-- nav 메뉴 이동 시 사용 -->
	<nav class="menu">
	
		<button id="moveBtn" onclick = "location.href = 'http://localhost:8080/walking/course/loc/walkingservice'">
			걷기 인증 서비스 시작
		</button>
		<button id="moveBtn">			
			<a href="<c:url value="/loc/walkingInfo"/>">걷기 운동 서비스 안내</a>
		</button>
		<button id="moveBtn" onclick = "location.href = 'http://localhost:8080/walking/loc/courselist'">
			나의 코스
		</button>
		
	</nav>
