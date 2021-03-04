<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>recycle</title>


<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
.recontents {
	margin-top: 15%;
	margin-left: 20%;
	margin-right: 15%;
	float: left;
}

#recycle_nav {
	margin-top: 15%;
	margin-left: 0;
	margin-right: 15%;
	position: fixed;
	float: right;
}

img{
	width: 100%;
}

ul, li {
	list-style: none;
	margin: 10px 0;
}

#moveBtn {
	background-color: #d4e0ef;
	margin-bottom: 1%;
}

#moveBtn:hover {
	background-color: #5385c1;
}

h2 {
	font-weight: bolder;
	margin-top: 5%;
}

h3{
	font-weight: bolder;
	margin-top: 5%;
	margin-left: 3%;
}


.footerCss {
	clear: left;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%-- <%@ include file="/WEB-INF/views/include/recycle_nav.jsp"%> --%>
	<!----------------------------------------View -------------------------------------------------->
	<p id="top"></p>
	<div id="recycle_nav">
		<ul>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#paperP'">종이류</button></li>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#canP'">금속캔, 고철류</button></li>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#glassP'">유리병류</button></li>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#petP'">플라스틱 용기류</button></li>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#vinylP'">비닐류</button></li>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#styrofoamP'">스티로폼</button></li>
			<li><button id="moveBtn" class="button special"
					onclick="location.href='#top'" style="background-color: #5385c1;">맨 위로 ↑</button></li>
		</ul>
	</div>

	<div class="recontents">



		<h2>분리 배출 핵심 4가지</h2>

		<img alt="recycle"
			src="http://me.go.kr/upload/2/editor/201804/04/20180404094316.png">
		<br>
		<br>

		<h2>종류별 재활용 방법</h2>
		<div class="imgfiles">
			<!-- Modal -->
			<div>
				<!-- 종이류, 종이팩> -->
				<h3 id="paperP"># 종이류, 종이팩</h3>
				<img alt="paper" src="<c:url value="/img/recycle/paper.jpg"/>"
					style="width: 100%;">
				<!-- 금속캔, 고철 -->
				<hr>
				<h3 id="canP"># 금속캔, 고철</h3>
				<img alt="can" src="<c:url value="/img/recycle/can.jpg"/>"
					style="width: 100%;">
				<!-- 유리병류 -->
				<hr>
				<h3 id="glassP"># 유리병류</h3>
				<img alt="glass" src="<c:url value="/img/recycle/glass.jpg"/>"
					style="width: 100%;">
				<!-- 플라스틱 용기류 -->
				<hr>
				<h3 id="petP"># 플라스틱 용기류</h3>
				<img alt="pet" src="<c:url value="/img/recycle/pet.jpg"/>"
					style="width: 100%;">
				<!-- 비닐류 -->
				<hr>
				<h3 id="vinylP"># 비닐류</h3>
				<img alt="vinyl" src="<c:url value="/img/recycle/vinyl.jpg"/>"
					style="width: 100%;">
				<!-- 스티로폼 -->
				<hr>
				<h3 id="styrofoamP"># 스티로폼(발포합성수지)</h3>
				<img alt="styrofoam"
					src="<c:url value="/img/recycle/Styrofoam.jpg"/>"
					style="width: 100%;">
			</div>
		</div>
	</div>


	
	<div class="footerCss"></div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>




	



</body>


</html>