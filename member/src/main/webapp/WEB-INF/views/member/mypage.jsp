<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>" />
<title>Insert title here</title>
</head>
<body>
   <!-- <body id="page-top"> -->
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       
		<section id="one" class="wrapper">	
		</section>	
	<div id="div1">
		<div id="div2">
		<h2>회원정보 수정</h2>
		<input type="hidden" id="idx" name="idx"  value="${loginInfo.idx}">
		 <label>이메일</label>
		  <input type="email" id="id" name="id"  value="${loginInfo.id}" readonly>
		 <label>비밀번호</label>
		  <input type="password" id="pw" name="pw"  placeholder="비밀번호">
		  <input type="password" id="pwcheck" placeholder="비밀번호 확인" name="pwcheck">
		 <label>별명</label> 
		  <input type="text" id="name" name="name" placeholder="${loginInfo.name}" required>
		  <label>프로필 사진</label>
		  <input type="text" id="oldphoto" name="oldphoto" value="${loginInfo.photo}" placeholder="${loginInfo.photo}" readonly>
		  <!-- <input type="file" id="photo" name="photo"><br> -->
		  <form id="form1" runat="server">
			<input type='file' id="photo" name="photo" onchange="readURL(this);" />
			<img id="blah" src="#" alt="your image" style="width:100px; height:100px" />
		</form>

		  <input type="submit" id="btnEdit" value="수정">
		  <!-- <input type="submit" id="leave" value="회원탈퇴"> -->
	  </div>
	 </div>
	 <div id="footer1">
	 <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	 </div>


</body>
<script>
	function readURL(input) {
	 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  reader.onload = function (e) {
		   $('#blah').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
	  }
	}
	
	$("#imgInput").change(function(){
	   readURL(this);
	});
	
</script>


<script>
$(document).ready(function(){
	//정보수정 버튼 클릭시
	 $('#btnEdit').click(function(){ 
		 

		 var pwCheck = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/; //6~20미만 최소 1개의 숫자 혹은 특수문자 포함
	
		if ($('#pw').val().length>0 && pwCheck.test($('#pw').val())!=true){
				 alert("비밀번호는 6~20자, 최소 1개의 숫자 혹은 특수문자를 포함해야합니다. ");
				 return false;
			 } else if ($('#pw').val()!=$('#pwcheck').val()){
				 alert("입력하신 비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
				 return false;
		 } else {
		 
			var file1 = $('#photo')[0].files[0]
			var formData = new FormData();
			var name = $('#name').val();
			formData.append("idx",$('#idx').val());
			formData.append("id",$('#id').val());
			formData.append("cgpw",$('#pw').val());
			formData.append("cgname",encodeURIComponent($('#name').val()));
			formData.append("oldphoto",$('#oldphoto').val());

			
			if(typeof(file1) != 'undefined'){
				formData.append("cgphoto",file1);
			}
		 
		 
		 
		console.log(typeof(file1))
		 	console.log(name);
		
		$.ajax({
		url: '/member/member/mypage',
		type: 'post',
		data: formData,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		cache: false,
		success: function(data){
			alert("회원정보가 수정됐습니다.");
			console.log(data);
		},
		error: function(error){
			console.log("실패");
			console.log(error);
		}	
		
		});
	 }
	});
});

</script>
</html>