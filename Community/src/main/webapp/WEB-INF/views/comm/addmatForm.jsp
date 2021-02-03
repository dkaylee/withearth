<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h1>새로운 맛집 추가하기</h1>
		<hr>
		<form method="post" enctype="multipart/form-data">
		<table>
			<tr>
			 <th><label for="mat_title">가게명</label></th>
			 <td>
			 	<input type="text" id="mat_title" name="mat_title">
			</td>
			</tr>
			<tr>
			 <th><label for="mat_title">주소</label></th>
			 <td>
			 	<input type="text" id="mat_addr" name="mat_addr">
			</td>
			</tr>
			<tr>
			 <th><label for="mat_title">작성자</label></th>
			 <td>
			 	<input type="text" id="mat_wr" name="mat_wr">
			</td>
			</tr>
			<tr>
			 <th><label for="mat_title">소개글</label></th>
			 <td>
			 	<input type="text" id="mat_content" name="mat_content">
			</td>
			</tr>
			<tr>
			 <th><label for="mat_img">이미지</label></th>
			 <td>
			 	<input type="file" id="mat_img" name="mat_img">
			</td>
			</tr>
			<tr>
			 <th><label for="mat_date">작성일</label></th>
			 <td>
			 	<input type="text" id="mat_date" name="mat_date">
			</td>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>