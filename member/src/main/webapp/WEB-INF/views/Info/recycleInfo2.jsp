<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<title>recycle</title>

<!-- modal 부트스트랩 -->
<script src="https://code.jquery.com/jquery-1.12.4.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
	.recontents{
		margin-top: 15%;
		margin-left: 15%;
		margin-right: 15%;
		float: left;
	}
	
	.imgfiles img{
		width: 100px;
		height: 100px;
		margin: 20px;
		border-radius: 10px;
	}
	
	
	
	
	h2, h3{
		font-weight: bolder;
		margin-top: 5%;
	}
	
	.footerCss{
		clear:left;
	}
</style>
</head>
<body>
 <%@ include file="/WEB-INF/views/include/header.jsp"%>
 	<!----------------------------------------View -------------------------------------------------->
 	
 	
 	
	<div class="recontents">
	
		<h2>분리 배출 핵심 4가지</h2>
	 	
	 	<img alt="recycle" src="http://me.go.kr/upload/2/editor/201804/04/20180404094316.png">
		<br><br>
	
		<h3>종류별 재활용 방법</h3>
		<div class="imgfiles">
			<!-- Modal -->		
			<!-- 종이류, 종이팩> -->
			<img alt="recycle1" src="<c:url value="/img/main/cat1.jpg"/>" onclick="paperModal()">
			
			<!-- 금속캔, 고철 -->
			<img alt="recycle1" src="<c:url value="/img/main/cat2.jpg"/>" onclick="canModal()" >
		
			<!-- 유리병류 -->
			<img alt="recycle1" src="<c:url value="/img/main/cat3.jpg"/>" onclick="glassModal()" >
		
			<!-- 플라스틱 용기류 -->
			<img alt="recycle1" src="<c:url value="/img/main/cat4.jpg"/>" onclick="petModal()" >
		
			<!-- 비닐류 -->
			<img alt="recycle1" src="<c:url value="/img/main/cat5.jpg"/>" onclick="vinylModal()" >
		
			<!-- 스티로폼 -->
			<img alt="recycle1" src="<c:url value="/img/main/cat6.jpg"/>" onclick="styrofoamModal()" >
		</div>
	</div>
	
	
	<!---------------------------------------- Modal -------------------------------------------------->
	<!-- paper Modal -->
		<div class="modal fade" id="paperModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">종이류, 종이팩</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <img alt="paper" src="<c:url value="/img/recycle/paper.jpg"/>" style="width:100%;" >
		        <h6>[출처]내 손안에 분리배출 app</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- paper Modal 끝 -->
		
		<!-- canModal -->
		<div class="modal fade" id="canModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">금속캔, 고철류</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <img alt="can" src="<c:url value="/img/recycle/can.jpg"/>" style="width:100%;" >
		        <h6>[출처]내 손안에 분리배출 app</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- canModal 끝 -->
		
		<!-- glassModal -->
		<div class="modal fade" id="glassModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">유리병류</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <img alt="can" src="<c:url value="/img/recycle/glass.jpg"/>" style="width:100%;" >
		        <h6>[출처]내 손안에 분리배출 app</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- glassModal 끝 -->
		
		<!-- petModal -->
		<div class="modal fade" id="petModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">플라스틱 용기류</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <img alt="can" src="<c:url value="/img/recycle/pet.jpg"/>" style="width:100%;" >
		        <h6 >[출처]내 손안에 분리배출 app</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- petModal 끝 -->
		
		<!-- vinylModal -->
		<div class="modal fade" id="vinylModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">비닐류</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <img alt="can" src="<c:url value="/img/recycle/vinyl.jpg"/>" style="width:100%;" >
		        <h6 >[출처]내 손안에 분리배출 app</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- vinylModal 끝 -->
		
		<!-- styrofoamModal -->
		<div class="modal fade" id="styrofoamModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="exampleModalLabel">스티로폼(발포합성수지)</h2>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <img alt="can" src="<c:url value="/img/recycle/Styrofoam.jpg"/>" style="width:100%;" >
		        <h6 >[출처]내 손안에 분리배출 app</h6>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="button special" data-dismiss="modal">확인</button>
		      </div>
		    </div>
		  </div>
		</div> <!-- styrofoamModal 끝 -->
	
		<div class="footerCss">
		
		</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	 
	
	
	<script>
	var myModal = document.getElementById('myModal')
	var myInput = document.getElementById('myInput')

	/* myModal.addEventListener('shown.bs.modal', function () {
	  myInput.focus()
	}) */
	
	function paperModal(){
		$('#paperModal').modal('show');		
	}
	
	function canModal(){
    	$('#canModal').modal('show');
	}
	
	function glassModal(){
    	$('#glassModal').modal('show');
	}
	
	function petModal(){
    	$('#petModal').modal('show');
	}
	
	function vinylModal(){
    	$('#vinylModal').modal('show');
	}
	
	function styrofoamModal(){
    	$('#styrofoamModal').modal('show');
	}
	
	</script>
	
	

</body>


</html>