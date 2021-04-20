<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/mycomm.css"/>" />
<title>Insert title here</title>
</head>
<body>
   <!-- <body id="page-top"> -->
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       <section id="one" class="wrapper">	
		</section>
<form method="post" enctype="multipart/form-data" name="submitok">
<input type="hidden" id="idx" name="idx" value="${editview.idx}">
<div class="input-group mb-3">
  <span class="input-group-text">아이디</span>
  <input type="text" class="form-control"  aria-label="Username" id="writer" name="writer" value="${editview.writer}">
 </div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  aria-label="subject" aria-describedby="basic-addon1" id="title" name="title" value="${editview.title}">
</div>
<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" aria-label="With textarea" id="contents" name="contents">${editview.contents}</textarea>
</div>
</form>
<button type="submit" class="btn btn-light" id="submit" onclick="subcheck()">제출</button>
<button type="button" class="btn btn-light">초기화</button>


	 <div id="footer1">
	 <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	 </div>

</body>
<script>


function subcheck(){

</script>
</html>