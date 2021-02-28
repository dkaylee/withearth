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
	지금 로그인한 사람의 정보가 필요하면 다음 버튼을 누르세요
	그러면 서버로 전송됩니다.
	  <input type="submit" id="btnEdit">
</body>

<script>
$(document).ready(function(){
 	var loginIdx = "${loginInfo.idx}"
	var	loginId = "${loginInfo.id}"
	var loginName = "${loginInfo.name}"
	var loginPhoto = "${loginInfo.photo}" 
	var loginInfo = {idx:loginIdx,
					id:loginId,
					name:loginName,
					photo:loginPhoto};
	
	 //회원가입 버튼 클릭시,
	 $('#btnEdit').click(function(){ 
		
		$.ajax({
		url: '/member/member/ajaxTest',
		type: 'post',
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(loginInfo),
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