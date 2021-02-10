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
	<div class="row uniform">
		<h1>새로운 맛집 추가</h1>
		<hr>
		<form method="post" enctype="multipart/form-data">
			<div class="row uniform">
				<div class="6u 12u$(xsmall)">
					상호명 ${regData.mTitle}
				</div>
				<div class="6u 12u$(xsmall)">
					주소	${regData.mAddr}
				</div>
				<div class="6u 12u$(xsmall)">
					시간 ${regData.mTime}
				</div>
				<div class="6u 12u$(xsmall)">
					전화번호 ${regData.mNum}
				</div>
				<div class="6u$ 12u$(xsmall)">
					소개글	${regData.mCont}
				</div>
				
				<div class="6u$ 12u$(xsmall)">
					이미지첨부 <c:forEach var="uploadFile" items="${mfileList}">
							<img alt="프로필 사진"
								src="<c:url value="/fileupload/member/${uploadFile.newFileName}"/>">
							</c:forEach>
				</div>

				<div class="3u$ 12u$(small)">
					<input type="button" value="목록">
					<input type="button" value="글쓰기">
				</div>
			</div>
		</form>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>
</html>