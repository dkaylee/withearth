<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
</head>
<body>


<!-- Form -->
								
		<h3>Login</h3>
		
		<form method="post">
			<div class="row uniform">
				<div class="6u 12u$(xsmall)">
					<input type="email" name="userid" id="userid" placeholder="Email">
				</div>
				<div class="6u$ 12u$(xsmall)">
					<input type="password" name="pw" id="pw" placeholder="Password">
				</div>
				
				<div class="6u 12u$(small)">
					<input type="checkbox" name="chk" id="chk" value="on" value="remember-me">
					<label for="copy">Remember Email</label>
				</div>
				<!-- Break -->
				<div class="12u$">
					<ul class="actions">
						<li><input type="submit" value="Login" /></li>
					</ul>
				</div>
			</div>
		</form>


<!-- 
<form method="post">
아이디 <input type="email" name="userid" id="userid">
비밀번호 <input type="password" name="pw" id="pw">
<input type="checkbox" name="chk" value="on" value="remember-me"> Remember ID(email)
<input type="submit">
</form> -->
</body>
</html>