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
			 <div id = "addpoint">
			<div id="point">
			 <img alt="point2" src="<c:url value="/img/point2.jpg"/>" style="width: 35%;">
				<!-- <img src="/img/point2.png" style="width: 25%;"> -->
			</div>

			<div id="card">

				<h3 style="text-align: center">100point 적립되었습니다.</h3>
			</div>
             </div>

			<div id="modal_btn">
				<!-- <button id="open"onclick="location.href='#'"></button>
				<button id="open" onclick="location.href='/tumbler/tumlist'">텀블러 이용내역</button> -->
				<a href="http://ec2-3-35-16-20.ap-northeast-2.compute.amazonaws.com:8080/" class="button special" >메인 화면</a>
				<a href="/tumbler/tumlist" class="button special">텀블러 조회</a>
			</div> 
			</div> 




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
var idx = 1;

$(document).ready(function(){
	   
	   $.ajax({
		   
		   url : 'http://localhost:8080/rest/tumbler/'+idx+'/'+cafe_idx,
		   type : 'GET',
		   data : 'idx='+idx+'cafe_idx='+cafe_idx,
		   success : function(data){
			   console.log(data);

		   }, error : function(e){
			   console.log(e);
		   }
		   	   
	   });
	   
});

































</script>
</html>
