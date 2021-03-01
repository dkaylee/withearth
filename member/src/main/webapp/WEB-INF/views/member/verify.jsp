<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<!--카카오 로그인-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>
	<h2>회원 이메일 인증</h2>
	<hr>
	<c:if test="${result == 0}">
	<h1>유효하지 않은 인증 요청입니다. 다시 시도해주세요.</h1>
	</c:if>
	<c:if test="${result == 1}">
	<h1>인증되었습니다.</h1>
	</c:if>
	<c:if test="${result == 3}">
	<h1>이미 인증된 이메일 입니다.</h1>		
	</c:if>				
	

</body>
</html>