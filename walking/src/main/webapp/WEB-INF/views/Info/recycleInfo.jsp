<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>recycle</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- modal 부트스트랩 -->	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
	.recontents{
		margin-top: 10%;
		margin-left: 5%;
		margin-right: 1%;
		float: left;
	}
	
	.recontents img{
		width: 100px;
		height: 100px;
		margin: 20px;
		border-radius: 20px;
	}
	
	
	
	h2, h3{
		font-weight: bolder;
	}
</style>
</head>
<body>
 <%@ include file="/WEB-INF/views/include/header.jsp"%>
 	<!----------------------------------------View -------------------------------------------------->
 	
 	
 	
	<div class="recontents">
	
		<h2>분리 배출 핵심 4가지</h2><hr>
	 	<h4>1. 비운다. <br /> 용기 안에 담겨 있는 내용물은 깨끗이 비워주세요.</h4>
	 	<h4>2. 헹군다. <br /> 이물질이나 음식물은 닦거나 헹궈주세요.</h4>
	 	<h4>3. 분리한다. <br /> 라벨 등이 다른 재질일 경우 제거해주세요.</h4>
	 	<h4>4. 섞지않는다. <br /> 재활용품은 종류별로 구분해 불리수거함에 버려주세요.</h4>
		<br><br>
	
		<h3>종류별 재활용 방법</h3><hr>
		<!-- <button class="button special" onclick="papaerModal()">종이류, 종이팩</button> -->
		<img alt="recycle1" src="<c:url value="/img/cat1.jpg"/>" onclick="papaerModal()" >
	
		<!-- <button class="button special" onclick="canModal()">금속캔, 고철</button> -->
		<img alt="recycle1" src="<c:url value="/img/cat2.jpg"/>" onclick="canModal()" >
	
		<!-- <button class="button special" onclick="glassModal()">유리병류</button> -->
		<img alt="recycle1" src="<c:url value="/img/cat3.jpg"/>" onclick="glassModal()" >
	
		<!-- <button class="button special" onclick="petModal()">플라스틱 용기류</button> -->
		<img alt="recycle1" src="<c:url value="/img/cat4.jpg"/>" onclick="petModal()" >
	
		<!-- <button class="button special" onclick="vinylModal()">비닐류</button> -->
		<img alt="recycle1" src="<c:url value="/img/cat5.jpg"/>" onclick="vinylModal()" >
	
		<!-- <button class="button special" onclick="styrofoamModal()">스티로폼(발포합성수지)</button> -->
		<img alt="recycle1" src="<c:url value="/img/cat6.jpg"/>" onclick="styrofoamModal()" >
	</div>
	
	
	<!---------------------------------------- Modal -------------------------------------------------->
	<!-- paperModal-->
	<div class="modal fade" id="papaerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">종이류, 종이팩</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> <!-- modal id 값을 따로 만들어서 조회 -->
					<img alt="walkingInfo1" src="<c:url value="/img/paper.jpg"/>" style="width: 100%;">
					
					<h6>[출처]내 손안에 분리배출 app</h6>
					
				</div>
				<div class="modal-footer">
					<button class="button special" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>		
	</div> <!-- paperModal 끝 -->
	
	<!-- canModal-->
	<div class="modal fade" id="canModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">금속캔, 고철</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> <!-- modal id 값을 따로 만들어서 조회 -->
					<img alt="walkingInfo1" src="<c:url value="/img/can.jpg"/>" style="width: 100%;">
					
					<h6>[출처]내 손안에 분리배출 app</h6>
					
				</div>
				<div class="modal-footer">
					<button class="button special" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>		
	</div> <!-- canModal 끝 -->
	
	<!-- glassModal-->
	<div class="modal fade" id="glassModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">유리병류</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> <!-- modal id 값을 따로 만들어서 조회 -->
					<img alt="glass" src="<c:url value="/img/glass.jpg"/>" style="width: 100%;">
					
					<h6>[출처]내 손안에 분리배출 app</h6>
					
				</div>
				<div class="modal-footer">
					<button class="button special" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>		
	</div> <!-- glassModal 끝 -->
	
	<!-- pet Modal-->
	<div class="modal fade" id="petModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">플라스틱</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> <!-- modal id 값을 따로 만들어서 조회 -->
					<img alt="pet" src="<c:url value="/img/pet.jpg"/>" style="width: 100%;">
					
					<h6>[출처]내 손안에 분리배출 app</h6>
					
				</div>
				<div class="modal-footer">
					<button class="button special" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>		
	</div> <!-- pet Modal 끝 -->
	
	<!-- vinylModal-->
	<div class="modal fade" id="vinylModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">플라스틱</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> <!-- modal id 값을 따로 만들어서 조회 -->
					<img alt="vinyl" src="<c:url value="/img/vinyl.jpg"/>" style="width: 100%;">
					
					<h6>[출처]내 손안에 분리배출 app</h6>
					
				</div>
				<div class="modal-footer">
					<button class="button special" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>		
	</div> <!-- vinylModal 끝 -->
	
	<!-- styrofoamModal-->
	<div class="modal fade" id="styrofoamModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel">스티로폼(발포함성수지)</h2>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body"> <!-- modal id 값을 따로 만들어서 조회 -->
					<img alt="Styrofoam" src="<c:url value="/img/Styrofoam.jpg"/>" style="width: 100%;">
					
					<h6>내 손안에 분리배출 app</h6>
					
				</div>
				<div class="modal-footer">
					<button class="button special" type="button" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>		
	</div> <!-- vinylModal 끝 -->
	
	
	
	 
	
	
	<script>
	function papaerModal(){
    	$('#papaerModal').modal("show");
	}
	
	function canModal(){
    	$('#canModal').modal("show");
	}
	
	function glassModal(){
    	$('#glassModal').modal("show");
	}
	
	function petModal(){
    	$('#petModal').modal("show");
	}
	
	function vinylModal(){
    	$('#vinylModal').modal("show");
	}
	
	function styrofoamModal(){
    	$('#styrofoamModal').modal("show");
	}
	
	
	</script>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>


</html>