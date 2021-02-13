<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>

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
            <h5 class="card-title text-center">SIGN UP</h5>
       <!-- <form class="form-signin" id="regForm" method="post" enctype="multipart/form-data"> -->
            <form class="form-signin" id="regForm">
              <div class="form-label-group">
                <input type="email" id="inputEmail" name="userid" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputEmail">Email address</label>
              </div>

              <div class="form-label-group" >
                <input type="password" id="inputPassword" name="userpw" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Create Password</label>
              </div>
              
              <div class="form-label-group">
                <input type="password" id="inputPassword2" name="pwcheck" class="form-control" placeholder="Password2" required>
                <label for="inputPassword">Repeat Password</label>
              </div>
              
              <div class="form-label-group">
                <input type="password" id="inputPassword3" name="username" class="form-control" placeholder="Password3" required>
                <label for="inputPassword">Create Username</label>
              </div>              
				
				<div class="form-label-group">
                <input type="file" id="photo" class="form-control" name="userPhoto" placeholder="Password3" required>
                <label for="inputPassword">Upload my picture</label>
              </div> 

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign up</button>
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