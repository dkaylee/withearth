<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<table>
			<tr>
			 <th><label for="matTitle">가게명</label></th>
			 <td>
			 	<input type="text" id="matTitle" name="matTitle">
			</td>
			</tr>
			<tr>
			 <th><label for="matAddr">주소</label></th>
			 <td>
			 	<input type="text" id="matAddr" name="matAddr">
			</td>
			</tr>
			<tr>
			 <th><label for="matTime">시간</label></th>
			 <td>
			 	<input type="text" id="matTime" name="matTime">
			</td>
			</tr>
			<tr>
			 <th><label for="matNum">전화번호</label></th>
			 <td>
			 	<input type="text" id="matWr" name="matWr">
			</td>
			</tr>
			<tr>
			 <th><label for="matCont">소개글</label></th>
			 <td>
			 	<input type="text" id="matContent" name="matContent">
			</td>
			</tr>
			<tr>
			 <th><label for="matImg">이미지</label></th>
			 <td>
			 	<input type="file" multiple="multiple" id="matImg" name="matImg">
			</td>
			</tr>
		</table>
		<div class="3u$ 12u$(small)">
			 <input type="submit" value="등록하기">
		</div>
		</form>
	</div>

</body>
</html>