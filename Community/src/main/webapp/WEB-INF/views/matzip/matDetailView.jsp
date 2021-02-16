<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matzip</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
</head>

<body class="subpage">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<section id="three" class="wrapper special">
	
		<span class="image fit" style="width: 1480px; height: 200px;"><img src="${matzip.matImg}"></span>
		
		<div class="inner">
			<header class="align-center">
				<h2>${matzip.matTitle}</h2>
				<p>${matzip.matCont}</p>
				<p>${matzip.matAddr}</p>
				<p>${matzip.matTime}</p>
				<p>${matzip.matNum}</p>
				<p>${matzip.matDate}</p>
				<p>${matzip.matHeart}</p>
			</header>
		</div>
		
		<ul class="actions">
			<li><a href="#" class="button alt">수정</a></li>
			<li><a href="#" class="button alt">목록</a></li>
		</ul>
		
</section>











<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</body>
</html>