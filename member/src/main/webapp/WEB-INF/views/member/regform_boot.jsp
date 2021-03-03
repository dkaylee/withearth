<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  
<link href="<c:url value="/css/reg.css"/>" rel="stylesheet" type="text/css">
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

<div class="first_container">
<div class="second_container">
	<p id="text1" class="text-center">간편하게 가입하고<br>다양한 서비스를 이용하세요.</p>
	<div class="mb-3">
	 <label for="exampleFormControlInput1" class="form-label">이메일</label>
	 <div id="idCheckMsg"></div>
	  <input type="email" class="form-control" id="id" name="userid" placeholder="이메일 주소" required>
	 <label for="exampleFormControlInput1" class="form-label">비밀번호</label>
	 <label id="pwment" for="exampleFormControlInput1" class="form-label">비밀번호는 6~20자리, <br> 숫자 또는 특수 문자를 포함하세요</label>
	  <div id="pwCheckMsg"></div>
	  <input type="password" class="form-control" id="pw" placeholder="비밀번호" required>
	  <input type="password" class="form-control" id="pwcheck" placeholder="비밀번호 확인" name="pwcheck" required>
	
	 <label for="exampleFormControlInput1" class="form-label">별명</label> 
	  <input type="text" class="form-control" id="name" name="username" placeholder="별명" required>
	</div>
	  <label for="formFile" class="form-label">프로필 사진</label>
	  <input class="form-control" type="file" id="photo" name="userPhoto">
	  <button type="submit" class="btn btn-secondary" id="btnReg"value="reg" disabled="true">회원가입</button>
</div>	
</div>

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
			formData.append("username",encodeURIComponent($('#name').val()));
			
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
				location.href='<c:url value="/"/>';
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
						msg.html('이미 사용중인 아이디 입니다.');
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