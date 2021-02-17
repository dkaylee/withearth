<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	이메일 : <input type="text">
</form>
	<input type="submit">
</body>
<script>
$(document).ready(function(){
	 //회원가입 버튼 클릭시,
	 $('#btnReg').click(function(){ 
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
	});
});
</script>		
</html>