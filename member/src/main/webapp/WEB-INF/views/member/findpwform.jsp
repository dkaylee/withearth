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
		var id = $('#id').val();
	 
		$.ajax({
			url: '/member/member/findpw',
			type: 'post',
			data: {id:id},
			success : function(data){
				console.log("됐다")
			},
			error:function(){
				console.log("안됐다")
			}
		});
	});
});
</script>
</html>