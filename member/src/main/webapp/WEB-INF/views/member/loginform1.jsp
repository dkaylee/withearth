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
<script src="/js/login/naveridlogin_js_sdk_2.0.2.js"></script>

<!-- 구글 로그인 -->
 <meta name="google-signin-scope" content="profile email">
 <meta name="google-signin-client_id" content="1062510835529-vrqcivq464jhn25nhdghd3ij957430it.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>


<!-- Form -->
								
		<h3>Login</h3>
		
		<form method="post">
			<input type="email" name="userid" id="userid" value="${cookie.uid.value}" placeholder="Email">
			<input type="password" name="pw" id="pw" placeholder="Password">
			<input type="checkbox" name="chk" id="chk" value="on" value="remember-me" ${cookie.uid ne null? 'checked' : '' }>
			<label for="copy">Remember Email</label>
		</form>
			<input type="submit" id="btnlog"value="Login" />
		<a id="custom-login-btn" href="javascript:loginWithKakao()" style="">
  		 	<img src="<c:url value="/img/kakao_login_medium_wide.png"/>"/></a>
  		<a id="naverIdLogin_loginButton" href="#"><img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="60"></a>
  		<div class="g-signin2" data-onsuccess="onSignIn"></div>
     
    	<a href="javascript:logout()">임시 로그아웃</a><br>
    	<a href="<c:url value="/member/findpw"/>">비밀번호 찾기</a> 
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
                	console.log(authObj) //토큰
                	//성공한다면 사용자 정보 가져오기
                	logintwo();
                },
                fail: function(err) {
                    console.log(authObj)
                }
            }); 
        }; 
        
	function logintwo(){
		//사용자 정보 저장하기 api
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
		 	
		 	//아이디 저장 유무 확인
		 	$.ajax({
				url: 'kakaoidcheck',
				data: {id:email},
				success : function(data){
					if(data=='Y'){
						console.log("이미 존재하는 회원이므로 세션등록")
						//세션 로그인 url			
						$.ajax({
						url: '/member/member/kakaoLogin',
						type: 'post',
						data: {id:email},
						success: function(data){
							alert("로그인 되었습니다.");
							location.href="/member"; 
							console.log(data);
						}
						});
						
						
						
						
					} else {
					
				 	 	$.ajax({
							url : 'kakaoReg',//컨트롤러
							type : 'post',
							//dataType : 'json',
							data : JSON.stringify(kakaoinfo),
							contentType:'application/json;charset=utf-8',
							success : function(check) {
								console.log("성공");
								alert("가입이 완료되었습니다.")
								//location.href="/member";
								
							},
							error: function(error){
								console.log("실패");
								console.log(error);
							} 
				 	 	}); //두번쨰 ajax
				 	 } //else
				}, //1번째 ajax success
				error: function(error){
					console.log(error);
				}
		 	});//1번째 ajax
		 	}// api 성공
		}); //api request 닫기
	};	//함수 닫기	
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

<!-- 구글 로그인 -->
<script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        var g_nam = profile.getName();
 		var g_img =profile.getImageUrl();
        var g_email = profile.getEmail();
		var gmaiinfo = {g_name=g_nam, g_img=g_photo, g_email=g_id};
		
		$.ajax({
			url : 'googleReg',//컨트롤러
			type : 'post',
			//dataType : 'json',
			data : JSON.stringify(gmaiinfo),
			contentType:'application/json;charset=utf-8',
			success : function(check) {
				console.log("성공");
				alert("가입이 완료되었습니다.")
				//location.href="/member";
				
			},
			error: function(error){
				console.log("실패");
				console.log(error);
		});
		
      }
 </script>
</html>