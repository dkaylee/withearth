<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- css -->
<link href="<c:url value="/css/findpw.css"/>" rel="stylesheet" type="text/css">
</head>
<body>


<div class="first_container">
<div class="second_container">
	<div class="mb-3">
	<p id="text1" class="text-center">비밀번호 찾기</p>
	  <input type="email" class="form-control" id ="id" name="id" placeholder="이메일 주소" >
	</div>
	<button type="submit" class="btn btn-secondary" id="findbtn" value="findbtn">비밀번호 찾기</button>
</div>
</div>
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
						alert("메일로 임시비밀번호가 발송되었습니다.");
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