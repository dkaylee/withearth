<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 안내</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp" %>

<style>
.contents{
	margin-top: 5%;
	margin-left: 1%;
	margin-right: 1%;
}


</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	
	<div class="contents">
		<h3>서비스 안내 페이지 입니다.</h3>
		<img alt="serviceInfo1" src="<c:url value="/img/serviceInfo1.png"/>" style="width: 100%;">
		<img alt="serviceInfo2" src="<c:url value="/img/serviceInfo2.png"/>" style="width: 100%;">
		<img alt="serviceInfo3" src="<c:url value="/img/serviceInfo3.png"/>" style="width: 100%;">
		
		<br>
		
		
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	

</body>
</html>