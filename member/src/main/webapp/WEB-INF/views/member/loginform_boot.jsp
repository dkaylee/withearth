<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
  maximum-scale=1.0, minimum-scale=1.0">
<title>Login</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<!--카카오 로그인-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 구글 로그인 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
 <meta name="google-signin-client_id" content="1062510835529-simuk8jl5l9putr99lf4282vbrbg8qs0.apps.googleusercontent.com">
<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- css -->
<link href="<c:url value="/css/login.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<div class="first_container">
<div class="second_container">
	<div class="main_img">
	<img src="<c:url value="/img/withearthlogo2.png"/>" class="rounded mx-auto d-block" alt="로고" >
	</div>
	<div class="mb-3">
	  <input type="email" class="form-control" id="userid" placeholder="이메일 주소" name="userid" value="${cookie.uid.value}">
	  <input type="password" class="form-control" id="pw" placeholder="비밀번호" name="pw" >
	</div>
		<button type="submit" class="btn btn-secondary" id="btnlog"value="Login">로그인</button> <br>
	<div class="a-tag">
	<a href="<c:url value="/member/findpw"/>" class="text-center">비밀번호 찾기</a> 
	<a href="<c:url value="/member/reg"/>" class="text-center">회원가입</a> <br>
	</div>
	<h2 class="login_sns_title">SNS계정으로 간편 로그인/회원가입</h2>
  	<a class="g-signin2" data-width="208.07px" data-height="45px" onclick="onSignIn();"></a>
	<a id="custom-login-btn" href="javascript:loginWithKakao()" style="">
	<img src="<c:url value="/img/kakao_login_medium_narrow.png"/>"/></a>
  	<div id="naverIdLogin"></div>

</div>
</div>
</body>


<script>
$(document).ready(function(){
	 //로그인 버튼 클릭시,
	 $('#btnlog').click(function(){ 
		var id = $('#userid').val();
		var pw = $('#pw').val();
		
		$.ajax({
			url:'leaveidcheck',
			data: {id:id},
			success: function(data){
			if(data=='Y'){
				alert("탈퇴한 회원입니다.");	
				return false;
			}else{
		
		
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
									//로그인 미인증 회원은 로그인은 되는데, 회원메뉴를 접근 못하게 하고싶음 
								/* 	var formData = new FormData();
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
									}); */
								} else {
									//로그인 클릭
									var formData = new FormData();
									formData.append("userid",$('#userid').val());
									formData.append("pw",$('#pw').val());
									
									$.ajax({
									url: 'login',
									type: 'post',
									data: formData,
									enctype: 'multipart/form-data',
									processData: false,
									contentType: false,
									cache: false,
									success: function(data){
										alert("로그인 되었습니다.");
										location.href="<c:url value='/'/>"; 										
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
						console.log("이미 존재하는 회원이므로 세션등록");
						//세션 로그인 url			
						$.ajax({
						url: '/member/member/kakaoLogin',
						type: 'post',
						data: {id:email},
						success: function(data){
							alert("로그인 되었습니다.");
							location.href="<c:url value='/'/>"; 
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
								location.href='<c:url value="/"/>';
								
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

function onSignIn() {
	var auth2 = gapi.auth2.getAuthInstance();
	
	if (auth2.isSignedIn.get()) {
		var profile = auth2.currentUser.get().getBasicProfile();
        //console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        var g_name = profile.getName();
 		var g_img =profile.getImageUrl();
        var g_email = profile.getEmail();
		var googleinfo = {g_name:g_name, g_img:g_img, g_email:g_email};
		console.log(g_name);
	}	
	
	$.ajax({
		url: 'googleidcheck',
		data: {id:g_email},
		success : function(data){
			if(data=='Y'){
				console.log("이미 존재하는 회원이므로 세션등록")
				//세션 로그인 url			
				$.ajax({
				url: 'googleLogin',
				type: 'post',
				data: {id:g_email},
				success: function(data){
					alert("로그인 되었습니다.");
					location.href="<c:url value='/'/>"; 
					console.log(data);
				}
				});
				
			} else {
	
	
	
			$.ajax({
				url : 'googleReg',//컨트롤러
				type : 'post',
				//dataType : 'json',
				data : JSON.stringify(googleinfo),
				contentType:'application/json;charset=utf-8',
				success : function(check) {
					console.log("성공");
					alert("가입이 완료되었습니다.")
					location.href="<c:url value='/'/>"; 					
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
 </script>

<!-- 네이버 로그인 -->
<script type="text/javascript">

	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "m2atJuSTPKnWvaMTDlAu",
			callbackUrl: "http://localhost:8080/member/member/callback",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 45} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
 	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	$('#naverIdLogin').click(function(){
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var n_email = naverLogin.user.getEmail();
			var n_name = naverLogin.user.getNickName();
			var n_img = naverLogin.user.getProfileImage();
			
			var naverinfo = {n_name:n_name, n_img:n_img, n_email:n_email};
			//가입
			$.ajax({
				url: 'naveridcheck',
				data: {id:n_email},
				success : function(data){
					if(data=='Y'){
						console.log("이미 존재하는 회원이므로 세션등록")
						//세션 로그인 url			
						$.ajax({
						url: '/member/member/naverLogin',
						type: 'post',
						data: {id:n_email},
						success: function(data){
							alert("로그인 되었습니다.");
							location.href="<c:url value='/'/>"; 
							console.log(data);
						}
						});
						
					} else {
			
			
			
					$.ajax({
						url : 'naverReg',//컨트롤러
						type : 'post',
						//dataType : 'json',
						data : JSON.stringify(naverinfo),
						contentType:'application/json;charset=utf-8',
						success : function(check) {
							console.log("성공");
							alert("가입이 완료되었습니다.")
							location.href="<c:url value='/'/>"; 							
						},
						error: function(error){
							console.log("실패");
							console.log(error);
						}	
					});
		      		}
				}
			});
			
			
		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}

	});
});

</script>
</html>