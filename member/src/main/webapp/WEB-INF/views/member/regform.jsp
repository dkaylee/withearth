<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  
<title>Insert title here</title>
<style>

.font_red{
	color:red;
}
.font_blue{
	color:blue
}
#idCheckMsg{
	display:none;
}
#idCheckMsg.display_block{
	display:block
}
</style>
</head>
<body>
<h1>회원가입</h1>
<!-- <form id="regForm" method="post" enctype="multipart/form-data"> -->
<form id="regForm" method="post" enctype="multipart/form-data">
아이디 <input type="email" id="id" name="userid" placeholder="이메일 주소" required>
<div id="idCheckMsg"></div>
비밀번호 <input type="password" id="pw" name="userpw" placeholder="영문,숫자 포함  8자 이상" required >
비밀번호 확인 <input type="password" id="pwcheck" name="pwcheck" placeholder="비밀번호 재입력" required >
<div id="pwCheckMsg"></div>
 별명 <input type="text" id="name" name="username" required >
<div id="nameCheckMsg"></div>
프로필 사진 <input type="file" id="photo" name="userPhoto">
<input type="submit">
</form>

<script>
 $(document).ready(function(){
	 
	 $('#id').focusout(function(){
		var id = $(this).val();
		var msg = $('#idCheckMsg');
		msg.addClass('display_block');
		
		if(id.length==0){
			msg.html('id는 필수항목입니다.');
			msg.addClass('font_red');
		} else {
			
			$.ajax({
				url: 'idcheck',
				data: {id:id},
				success : function(data){
					if(data=='Y'){
						msg.html('사용가능한 아이디 입니다.');
						msg.removeClass('font_red');
						msg.addClass('font_blue');
					} else {
						msg.html('사용불가능한 아이디입니다.');
						msg.removeClass('font_blue');
						msg.addClass('font_red');
					}
					
				},
				error:function(){
					msg.html('에러');
					msg.removeClass('font_blue');
					msg.addClass('font_red');
				}
			});
		}
		
		$('#id').focusin(function(){
			
			$(this).val('');
			
			var msg = $('#idCheckMsg');
			msg.removeClass('font_red');
			msg.removeClass('font_blue');
			msg.removeClass('display_block');
			
		});
		
		
	 });
	 

	 }
	 
	 
	 
	 
	 
	 
	 
	 
 });
</script>

</body>
</html>