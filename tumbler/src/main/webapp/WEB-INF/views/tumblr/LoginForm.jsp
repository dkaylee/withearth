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
		
<form method="post" action="rtumlist.jsp">
아이디 <input type="email" name="id" id="id"> </br>
비밀번호 <input type="password" name="pw" id="pw">

<input type="submit">
</form>

</body>