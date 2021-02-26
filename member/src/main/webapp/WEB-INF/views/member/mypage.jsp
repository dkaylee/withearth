<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <label>비밀번호</label>
	 <label>비밀번호는 6~20자리, 숫자 또는 특수 문자를 포함하세요</label>
	  <input  type="password" id="pw" name="pw"  placeholder="비밀번호">
	  <input type="password" id="pwcheck" placeholder="비밀번호 확인" name="pwcheck">
	 <label>별명</label> 
	  <input type="text" id="name" name="username" placeholder="별명" required>
	  <label>프로필 사진</label>
	  <input type="file" id="photo" name="userPhoto">
</body>

<script>
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


</script>
</html>