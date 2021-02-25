<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="jquery.bootpag.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script
	src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>


<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> 


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial=scale=1.0">
<title>텀블러 인증</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

<style>
.nowpage {
	font-size: 1.5em;
	font-weight: bold;
}

#point {
	margin: auto;
	display: block;
	text-align: center;
}

#maodel_btnx {
	all: unset;
	background-color: #F2CF8D;
	color: white;
	padding: 15px 25px;
	border-radius: 6px;
	cursor: pointer;
}

 #modal_btn {
	text-align: center;
	margin: 0 auto;
} 

button {
	all: unset;
	background-color: #6B90BF;
	color: white;
	padding: 30px 100px;
	margin: 50px 10px;
	border-radius: 6px;
	cursor: pointer;
	width:20px;
	height:10px;
	
}
</style>



</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">



		<div class="head_orderlist">
			<!-- Table -->
			<div id="point">
				<%-- <img alt="point2" src="<c:url value="/img/point2.png"/>" style="width: 25%;"> --%>
				<img src="/img/point2.png" style="width: 25%;">
			</div>

			<div id="card">

				<h3 style="text-align: center">100point 적립되었습니다</h3>
			</div>


			<div id="modal_btn">
				<button id="open"onclick="location.href='/'"> 메인화면</button>
				<button id="open" onclick="location.href='/tumbler/tumlist'">텀블러 이용내역</button>
			</div>




	</section>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
