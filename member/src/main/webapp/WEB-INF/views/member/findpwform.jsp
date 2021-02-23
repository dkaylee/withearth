<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<form method="post">
	이메일 : <input type="text" id ="id" name="id">
</form>
	<input type="submit" id="findbtn">
</body>
<script>
$(document).ready(function(){
	//비밀번호 찾기 버튼 클릭시, 
	$('#findbtn').click(function(){ 			
		//만약 이메일 사용자가 아니거나 해당하는 이메일이 없다면?
			
		var id = $('#id').val();
		
		$.ajax({
			url: '/member/member/emailusercheck',
			data: {id:id},
			success : function(data){
				if(data=='N'){
					alert("해당하는 이메일을 가진 회원이 없거나, email로 가입한 회원이 아닙니다.");
					 $('#id').focus();
					 return false;
				} else {
						
	 
				$.ajax({
					url: '/member/member/findpw',
					type: 'post',
					data: {id:id},
					success : function(data){
						console.log("됐다");
						alert("메일이 발송되었습니다.");
						location.href="/member"; 
					},
					error:function(error){
						console.log("안됐다");
						console.log(error);
					}
				});
		}
		}	
		});		
	});
});	
</script>
</html>