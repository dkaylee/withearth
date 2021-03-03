<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

</head>

<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<section id="three" class="wrapper special">
	<div class="row uniform">
		<header class="align-center">
		<h2>맛집 추가 완료</h2>
		</header>
		<hr>
		
		<form method="post" enctype="multipart/form-data">
			<div class="row uniform">
				<div class="6u 12u$(xsmall)">
					상호명 ${matReq.mTitle}
				</div>
				<div class="6u 12u$(xsmall)">
					주소	${matReq.mAddr}
				</div>
				<div class="6u 12u$(xsmall)">
					시간 ${matReq.mTime}
				</div>
				<div class="6u 12u$(xsmall)">
					전화번호 ${matReq.mNum}
				</div>
				<div class="6u$ 12u$(xsmall)">
					소개글 ${matReq.mCont}
				</div>
				
				<c:forEach items="${matReq.mImg}" var="upload">
				<div class="6u$ 12u$(xsmall)">
					<img src="<c:url value="/fileupload/matzip/${matReq.mImg}"/>">
				</div> 
				</c:forEach>

				<div class="3u$ 12u$(small)">
					<input type="button" value="목록"><input type="button" value="글쓰기">
				</div>
			</div>
		</form>
	</div>
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script type="text/javascript"></script>
	
	

</body>
</html>