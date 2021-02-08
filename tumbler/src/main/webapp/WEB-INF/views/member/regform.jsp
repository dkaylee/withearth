<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  
<title>Insert title here</title>
<style>
#idCheckMsg.display_block{
	display: block
}
#idCheckMsg.font_red{
	color: red;
}
</style>
</head>
<body>
<h1>회원가입</h1>
<form id="regForm" method="post" enctype="multipart/form-data">
아이디 <input type="email" id="id" name="userid">
<div id="idCheckMsg"></div>
비밀번호 <input type="password" id="pw" name="userpw">
비밀번호 확인 <input type="password" id="pwcheck" name="pwcheck">
<div id="pwCheckMsg"></div>
 별명 <input type="text" id="name" name="username">
<div id="nameCheckMsg"></div>
프로필 사진 <input type="file" id="photo" name="userPhoto">
<input type="submit">
</form>

<script>
$(document).ready(function(){
	
	$('#id').focusout(function(){
	var thisid = $(this).val();
	var msg = $('idCheckMsg');
	msg.addClass('display_block');
	
	if(thisid.length==0){
		msg.removeClass('display_block');
		msg.html('id를 넣어주세요')
		msg.addClass('font_red')
	}
	
	
	});
});
</script>
</body>
</html>