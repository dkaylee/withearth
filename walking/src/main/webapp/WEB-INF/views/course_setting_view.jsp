<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<div class="course_contents">
		<h2>코스 설정이 완료되었습니다.</h2>
		<hr>
		<div class="course_content">

			<c:if test="${result>0}">
				코스 설정이 완료되었습니다.
				<%-- 출발지: ${start} , 목적지: ${end} --%>
			</c:if>
			<c:if test="${result eq 0}">
				코스 설정에 실패했습니다. 다시 시도해주세요.
			</c:if>


		</div>
	</div>




	<%@ include file="/WEB-INF/views/include/footer.jsp"%>



</body>
</html>
