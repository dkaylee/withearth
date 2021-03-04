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
</form>
<input type="submit" id="btnReg" disabled="true">

<script>
 $(document).ready(function(){
	 //회원가입 버튼 클릭시,
	 $('#btnReg').click(function(){ 
		 
		 if($('#id').val() == ""){
			 alert("아이디를 입력하세요.");
			 $('#id').focus();
			 return false;
	  	 }  else if (emailCheck.test($('#id').val())!=true){
			 alert("잘못된 이메일 형식입니다. 다시 확인해주세요.")
			 $('#id').focus();
			 return false;  
		 } else if (pwCheck.test($('#pw').val())!=true){
			 alert("비밀번호는 6~20자, 최소 1개의 숫자 혹은 특수문자를 포함해야합니다. ");
			 return false;
		 } else if ($('#pw').val()==""){
			 alert("비밀번호를 입력하세요.");
			 return false;
		 } else if ($('#pw').val()!=$('#pwcheck').val()){
			 alert("입력하신 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			 return false;
		 } else if ($('#name').val()==""){
			 alert("닉네임을 입력하세요.");
			 return false;
		 } else {
		 
		 
		 
		 
		 //회원 가입
			var photoFile = $('#photo');
			var file1 = photoFile[0].files[0];
			console.log(typeof(file1)); 
			
			var formData = new FormData();
			formData.append("userid",$('#id').val());
			formData.append("userpw",$('#pw').val());
			formData.append("username",$('#name').val());
			
			if(typeof(file1) != 'undefined'){
			formData.append("userPhoto",file1);	
			}
		
		$.ajax({
			url: '/member/member/reg',
			type: 'post',
			data: formData,
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			cache: false,
			success: function(data){
				alert("회원가입이 완료되었습니다.");
				location.href="/member"; 
				console.log(data);
			},
			error: function(error){
				console.log("실패");
				console.log(error);
			}	
		});
		
		
		
		}
		
	 });
	 
	 
	 
	 //유효성 검사
	 
	  //유효성 검사용
		 //정규식 
		 var pwCheck = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/; //6~20미만 최소 1개의 숫자 혹은 특수문자 포함
		 var emailCheck = /^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; 
	 
	 
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
						$('#btnReg').attr("disabled", false);
					} else {
						msg.html('사용불가능한 아이디입니다.');
						msg.removeClass('font_blue');
						msg.addClass('font_red');
						$('#btnReg').attr("disabled", true);
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
	 
	 
 });
</script>

</body>
</html>