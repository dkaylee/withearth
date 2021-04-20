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
	<div id="two">	
			<h2>know-how</h2>
	<div id="bt">
<button type="button" id="write" class="btn btn-light" onclick="location.href='http://localhost:8080/member/board/write'">글쓰기</button>			
	</div>
	<div id="tbwrap">
	<table>
		<thead>
		<tr text-align=center>
		<th width="90">글번호</th>
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
		<a href="/member/board/view?bno=${lst.idx}">${lst.title}</a>
		</td>
		<td>${lst.writer}</td>
		<td>${lst.inserttime}</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${page.prev}">
			<span>
				[<a href="/member/board/listPage?num=${page.startPageNum-1}">이전</a>]	
			</span>
		</c:if>
		
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
			<c:if test="${select!=num}">
			<a href="/member/board/listPage?num=${num}">${num}</a>
			</c:if>
			<c:if test="${select == num}">
			<b>${num}</b>
			</c:if>
		</span>		
		</c:forEach>

		<c:if test="${page.next}">
			<span>
				[<a href="/member/board/listPage?num=${page.endPageNum+1}">다음</a>]	
			</span>
		</c:if>
		</div>
	</div>
	
	<!--ver1-->
<!-- 	<c:forEach begin="1" end="${pageNum}" var="num">
		<span>
			<a href="/board/listPage?num=${num}">${num}</a>
		</span>		
		</c:forEach>
-->	
	
</div>
	 <div id="footer1">
	 <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	 </div>


</body>
</html>