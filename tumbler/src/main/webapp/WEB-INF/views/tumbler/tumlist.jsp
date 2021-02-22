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
</style>



</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">

    
      
		<div class="head_orderlist">
			<!-- Table -->
			<h3>텀블러 인증 내역</h3>

			
			<div class="table-wrapper">
				<table>
					<thead>

						<tr>
							<th>NO</th>
							<th>적립일자</th>
							<th>이용 매장</th>
							<th>적립포인트</th>
						</tr>
					</thead>
					<tbody calss="tbody">
						<c:forEach items="${listView.tumlist}" var="tumbler"
							varStatus="status">
							<tr>
								<td>${tumbler.tum_idx}</td>
								<td><fmt:formatDate value="${tumbler.tum_date}"
									pattern="yyyy.MM.dd" /></td>
								<td>${tumbler.cafe_name}</td>
								<td>${tumbler.tum_point}p</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<%-- <div class="paging">
				<c:if test="${listView.totalTpointCount>0}">
					<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
				    [<a href="<c:url value="/tumbler/tumlist"/>?p=${num}"
							class="${listView.pageNumber eq num ? 'nowpage' : ''}">${num}</a> ] 
				  </c:forEach>
				</c:if>
			</div> --%>

			<nav aria-label="..." style="text-align: center;"> 
			<ul class="pagination"> 
			<c:if test="${listView.totalTpointCount>0}">
					<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
				    [<a href="<c:url value="/tumbler/tumlist"/>?p=${num}"
							class="${listView.pageNumber eq num ? 'nowpage' : ''}">${num}</a> ] 
				  </c:forEach>
				</c:if>
			 </ul> 
			 </nav>


		</div>

	</section>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

<script>
	
</script>