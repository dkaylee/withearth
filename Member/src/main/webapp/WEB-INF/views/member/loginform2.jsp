<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!— Latest compiled and minified CSS —>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!— jQuery library —>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!— Popper JS —>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!— Latest compiled JavaScript —>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/login.css"/>" rel="stylesheet">


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
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Kakao</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<script src="<c:url value="/js/login/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/js/login/jquery.slim.min.js"/>"></script>
</html>