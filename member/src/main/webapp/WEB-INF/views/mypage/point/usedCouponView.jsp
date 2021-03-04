<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>WithEarth</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
  .notice{
   margin : 0 auto !important;
   margin-left : 300px !important;
  }
  
  .msg{
    font-size : 30px;
  }
</style>
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       
<section id="one" class="wrapper">	
</section>	
		<h1 class="notice"></h1>

		
</body>
<script>
  // 경로에서 파라미터 받기
	function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	
  var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);

  return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
  }
  
  var idx = getParameterByName("idx");
  console.log(idx);
  var cIdx = getParameterByName("cIdx");

   $(document).ready(function(){
	   
	   $.ajax({
		   
		   url : 'https://www.withearthdona.tkamazonaws.com:8080/point/rest/user/coupon/use',
		   type : 'GET',
		   data : 'idx='+idx+'&cIdx='+cIdx,
		   success : function(data){
			   console.log(data);
			   var html = "";
			   
			   if(data==1){			   
				   html += '<img alt="QrImage" width="40px" src="<c:url value="/img/point/success.png"/>"><h1 class="msg">쿠폰 사용이 완료되었습니다.</h1>';
			   } else {
				   html += '<img alt="QrImage" width="40px" src="<c:url value="/img/point/notice.png"/>"><p class="msg">이미 사용하신 쿠폰입니다.</p>';
			   }
			   
			   $('.notice').append(html);
			   
		   }, error : function(e){
			   console.log(e);
		   }
		   	   
	   });
	   
   });
   
</script>	
<%@ include file="/WEB-INF/views/include/footer.jsp"%> 
</html>