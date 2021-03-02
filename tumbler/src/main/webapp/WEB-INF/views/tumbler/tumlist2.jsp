<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial=scale=1.0">
<title>텀블러 인증</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

<style>
.nowpage {
	font-size: 1.5em;
	font-weight: bold;
}
#addpoint{
    margin: 30px 0px 30px;
	display: block;
	text-align: center;

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

.button special {
	width: 200px;
    height: 50px;
	
}
</style>



</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">
	
	<h1 class="addpoint"></h1>



 	<div class="head_orderlist">
			<!-- Table -->
			<h3>QR코드 생성</h3>



	</section>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
<script>


   
function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");

var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
}

//var idx = getParameterByName("idx");
var cafe_idx = getParameterByName("cafe_idx");


$(document).ready(function(){
	   
	   $.ajax({
		   
		   url : 'http://localhost:8080/rest/qr/'+cafe_idx,
		   type : 'GET',
		   data : 'cafe_idx='+cafe_idx,
		   success : function(data){
			   console.log(data);

		   }, error : function(e){
			   console.log(e);
		   }
		   	   
	   });
	   
});

































</script>
</html>
