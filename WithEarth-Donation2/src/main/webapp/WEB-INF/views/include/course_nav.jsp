<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
/* 상단 버튼 css */

a{
	text-decoration:none;
	color:#5385c1;
}

a:hover{
	text-decoration:none;
	color:white;
}

a:visited{

}


#moveBtn {
	color: #5385c1;
	background-color: #d4e0ef;
	margin-bottom: 1%;
	
}

#moveBtn:hover {
	background-color: #5385c1;
	color: white;
}



.menu{
	margin-top: 25%;
	margin-left: 15%;
	margin-right: 15%;
	
	margin-bottom: 0;
}



</style>
	<!-- nav 메뉴 이동 시 사용 -->
	<nav class="menu">
	
		<button id="moveBtn" class="button special"  onclick="location.href='<c:url value="/member/loc/walkingservice"/>'" >
			서비스 시작
		</button>
		<button id="moveBtn" class="button special" onclick="location.href='<c:url value="/member/loc/walkingInfo"/>'">	
			서비스 안내
		</button>
		<button id="moveBtn" class="button special" onclick="location.href='<c:url value="/member/loc/courselist"/>'">
			나의 코스
		</button>
		
	</nav>
