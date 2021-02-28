<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	 <label>이메일</label>
	  <input type="email" id="id" name="id"  value="${loginInfo.id}" readonly>
	 <label>비밀번호</label>
	 <label>비밀번호는 6~20자리, 숫자 또는 특수 문자를 포함하세요</label>
	  <input  type="password" id="pw" name="pw"  placeholder="비밀번호">
	  <input type="password" id="pwcheck" placeholder="비밀번호 확인" name="pwcheck">
	 <label>별명</label> 
	  <input type="text" id="name" name="username" placeholder="별명" value="${loginInfo.name}" required>
	  <label>프로필 사진</label>
	  <input type="text" id="oldphoto" name="odluserPhoto" value="${loginInfo.photo}" readonly>
	  <input type="file" id="photo" name="userPhoto">
	  <input type="submit" id="btnEdit">
</body>

<script>
$(document).ready(function(){
	var	photo = $('#photo');
	var file1 = photo[0].files[0];
	var formData = new FormData();
	 //회원가입 버튼 클릭시,
	 $('#btnEdit').click(function(){ 
		
		
		$.ajax({
		url: '/member/member/mypage',
		type: 'post',
		data: formData,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		cache: false,
		success: function(data){
			alert("성공");
			console.log(data);
		},
		error: function(error){
			console.log("실패");
			console.log(error);
		}	
		
		});
	 });
});

</script>
</html>