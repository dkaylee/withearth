<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--카카오 로그인-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!— Latest compiled and minified CSS —>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!— jQuery library —>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!— Popper JS —>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!— Latest compiled JavaScript —>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/login.css"/>" rel="stylesheet">

<!-- 구글 로그인 -->
 <meta name="google-signin-scope" content="profile email">
 <meta name="google-signin-client_id" content="1062510835529-vrqcivq464jhn25nhdghd3ij957430it.apps.googleusercontent.com">
 <script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign in</h5>
            <form class="form-signin" method="post">
              <div class="form-label-group">
                <input type="email" id="inputEmail" name="userid" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputEmail">Email address</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="inputPassword" name="pw" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1" name="chk">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
              
              <hr class="my-4">
              <a id="custom-login-btn" href="javascript:loginWithKakao()" style="">
       		 	<img src="<c:url value="/img/kakao_login_medium_wide.png"/>"/>
    		  </a>
    		   <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    		  
              <!-- <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
 -->              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Kakao</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<script src="<c:url value="/js/login/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/js/login/jquery.slim.min.js"/>"></script>

<!-- 카카오 로그인 -->
<script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('3899d49bf0d8f2c59f6f0bb935d45d34');

        function loginWithKakao() {
            // 로그인 창을 띄웁니다.
            Kakao.Auth.login({
                success: function(authObj) {
                    alert(JSON.stringify(authObj));

                    //Kakao.Auth.setAccessToken(authObj.access_token);

                  /*   startWithKakao(); */
                   /*  infoWithKakao(); */
                    

                },
                fail: function(err) {
                    alert(JSON.stringify(err));
                }
            });
             
            
            
        }; //로그인창 띄우기
        
         function startWithKakao() {
            Kakao.Auth.getStatusInfo(function(statusObj) {
                if (statusObj.status == 'connected') {
                    /* $('#custom-login-btn').css('display', 'none'); */
                } else {
                    $('#custom-login-btn').css('display', 'inline');
                }
            });
        };
         
        //로그인 성공시 데이터 받기
       /*  function infoWithKakao() {
            // 로그인 성공시, API를 호출합니다.
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(res) {
                    $('#content').html(JSON.stringify(res);
                    JSON.stringify(res);
               var kakaonickname = res.propertise.nickname;
               var kakaoprofile = res.propertise.profile_image;
               var kakaothumnail = res.propertise.thumbnail_image;
               var kakaoemail = res.kakao_account.email;
               
               
               
                },
                fail: function(error) {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
                    
        };  */
        

</script>

<script>
        $(document).ready(function() {
            startWithKakao();
        });
</script>

<!-- 구글 로그인 -->
<script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
 </script>
<!-- 
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script> 
구글 로그아웃 -->
</html>