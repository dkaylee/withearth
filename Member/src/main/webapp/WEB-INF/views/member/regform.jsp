<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form id="regForm" method="post" enctype="multipart/form-data">
아이디 <input type="email" id="id" name="userid">
비밀번호 <input type="password" id="pw" name="userpw">
<!-- 비밀번호 확인 <input type="password" id="pwcheck" name="pwcheck">
 -->
 별명 <input type="text" id="name" name="username">
프로필 사진 <input type="file" id="photo" name="userPhoto">
<input type="submit">
</form>

</body>
</html>