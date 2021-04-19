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
<link rel="stylesheet" href="<c:url value="/css/mypage.css"/>" />
<title>Insert title here</title>
</head>
<body>
   <!-- <body id="page-top"> -->
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       
		<section id="one" class="wrapper">	
		</section>
			<h1>게시판</h1>
				<table class="table table-striped">
				<thead>
					<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="lst">
					<tr>
					<td>${lst.idx}</td>
					<td>
					<a href="/board/view?bno=${lst.idx}">${lst.title}</a>
					</td>
					<td>${lst.writer}</td>
					<td>${lst.inserttime}</td>
					</tr>
					</c:forEach>
				</tbody>
			
				</table>
			
			<button type="button" class="btn btn-light" onclick="location.href='http://localhost:8080/write'">글쓰기</button>
	 <div id="footer1">
	 <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	 </div>


</body>
</html>