<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${result eq 1}">
<script>
	alert("코스 정보가 삭제되었습니다.");
	location.href = '<c:url value="/member/loc/courselist"/>';	
	
</script>
</c:if>

<c:if test="${result ne 1}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/include/basicset.jsp" %>
<style>
	div.content>h1{
		text-align: center;
	}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="contents">
		<h2 class="content_title">코스 정보 삭제 실패</h2>
		<hr>
		<div class="content">
			<h1>요청하신 인덱스의 코스 정보가 존재하지 않습니다.<br>다시 확인 후 시도해주세요.</h1>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>
</c:if>