<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!--카카오 로그인-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>


<!-- Form -->
								
		<h3>Login</h3>
		
		<form method="post">
			<input type="email" name="userid" id="userid" placeholder="Email">
			<input type="password" name="pw" id="pw" placeholder="Password">
			<input type="checkbox" name="chk" id="chk" value="on" value="remember-me">
			<label for="copy">Remember Email</label>
		</form>
			<input type="submit" id="btnlog"value="Login" />
		<a id="custom-login-btn" href="javascript:loginWithKakao()" style="">
  		 	<img src="<c:url value="/img/kakao_login_medium_wide.png"/>"/></a>
    	<a href="javascript:logout()">임시 로그아웃</a><br>
    	<a href="<c:url value="/member/findpwform"/>">비밀번호 찾기</a> 

</body>

<script>
$(document).ready(function(){
	 //로그인 버튼 클릭시,
	 $('#btnlog').click(function(){ 
		var id = $('#userid').val();
		var pw = $('#pw').val();
		$.ajax({
			url: 'idpwcheck',
			data: {id:id,pw:pw},
			success : function(data){
				if(data=='N'){
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					 $('#id').focus();
					 return false;
				} else {
						var id = $('#userid').val();
						var pw = $('#pw').val();
						$.ajax({
							url: 'idpwverifycheck',
							data: {id:id,pw:pw},
							success : function(data2){
								console.log(data2);
								if(data2=='N'){
									alert("인증되지 않은 회원입니다. 인증메일을 확인해주세요.");
									 return false;
								} else {
									//로그인 클릭
									var formData = new FormData();
									formData.append("userid",$('#userid').val());
									formData.append("pw",$('#pw').val());
									$.ajax({
									url: '/member/member/login',
									type: 'post',
									data: formData,
									enctype: 'multipart/form-data',
									processData: false,
									contentType: false,
									cache: false,
									success: function(data){
										alert("로그인 되었습니다.");
										location.href="/member"; 
										console.log(data);
									},
									error: function(error){
										console.log("실패");
										console.log(error);
									}
								});
								}
							}
						});
					}
			}
		});
	 });	
	});	 
</script>


<!-- 카카오 로그인 -->
<script type='text/javascript'>
        
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('3899d49bf0d8f2c59f6f0bb935d45d34');

        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
            	//이메일 프로필 필수 동의 요구
            	scope: 'account_email,profile',
                success: function(authObj) {
                	//성공한다면 사용자 정보 가져오기
                	logintwo();
                },
                fail: function(err) {
                    console.log(authObj)
                }
            }); 
        }; 
</script>

<script>
	function logintwo(){
		//사용자 정보 가져오기
		Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(res){
		    	console.log(res);
			var nick = res.properties.nickname;
		 	var pimg = res.properties.profile_image;
		 	var thumimg = res.properties.thumbnail_image;
		 	var email = res.kakao_account.email;
		 	var kakaoinfo = {ka_name:nick,ka_img:pimg,ka_thum:thumimg,ka_email:email};
		 	console.log(kakaoinfo)
		 	
	 	 	$.ajax({
				url : 'kakaoLogin',//컨트롤러
				type : 'post',
				//dataType : 'json',
				data : JSON.stringify(kakaoinfo),
				contentType:'application/json;charset=utf-8',
				success : function(check) {
					console.log("성공");
					alert("가입이 완료되었습니다.")
					location.href="/member";
					
				},
				error: function(error){
					console.log("실패");
					console.log(error);
				} 
				
		 	});//ajax
		 	
		    },//성공
		    
		    fail: function(error){
				console.log(error);
			}//실패
		});
	};		
</script>

<script>
	function logout(){
		Kakao.API.request({
			  url: '/v1/user/unlink',
			  success: function(response) {
			    console.log(response);
			  },
			  fail: function(error) {
			    console.log(error);
			  },
			});
		
	}
</script>
</html>