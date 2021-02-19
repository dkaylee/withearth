<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 리스트</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
.table {
	/* border: 1px solid #DDD; */
	width: 100%;
}
td, th {
	border-bottom: 1px solid #DDD;
	text-align: center;
	padding: 10px 0;
}
.nowpage {
	font-size: 1.5em;
}
.paging {
	text-align: center;
}
div.searchBox {
	border: 1px solid #CCC;
	margin: 15px 0;
	padding: 10px 20px;
	background-color: #EEE;
}

.container{
	margin: 100px 50px;
}

#searchType{
	width: 200px;
}

#keyword{
	width: 300px;
}

ul, li{
	list-sytle: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<main class="container">
				<h1 class="listHeader">Course</h1>


		<div class="searcontents">
			<div class="searcontent">
				<!-- <div class="searchBox"> -->
				<form>
					검색 타입 <select name="searchType" id="searchType">
						<option value="date">저장 일자</option>
						<option value="end">목적지</option>
						<option value="both">설정일자+목적지</option>
					</select> 검색 키워드 <input type="text" name="keyword" id="keyword"> <input
						type="submit" value="검색">
				</form>
				<!-- 	</div> -->
			</div>
		</div>


		<div class="contents">
			<h3 class="listinfo">코스 리스트</h3>
			<div class="content">
				<table class="listTable">
					<tr>
						<th>idx</th>
						<th>저장 일자</th>
						<th>출발지</th>
						<th>목적지</th>
						<th>이동 거리(km)</th>
						<!-- <th>예상 시간(분)</th> -->
						<th>소요 시간</th>
						<th>Manage</th>
					</tr>

					<c:forEach items="${listView.courseList}" var="course">
						<tr>
							<td>${course.course_idx}</td>
							<td><fmt:formatDate value="${course.course_date}"
									pattern="yyyy.MM.dd." /></td>
							<td>${course.start_point}</td>
							<td>${course.end_point}</td>
							<td>${course.loc_km} km</td>
							<%-- <td>${course.about_time} 분</td> --%>
							<td>${course.walking_time}</td>
							<%--<td><a href="<c:url value="/course/edit?idx=${course.course_idx}"/>">수정</a> --%> 
						    <td><a href="javascript:deleteCourse(${course.course_idx});">삭제</a></td>
						</tr>
					</c:forEach>

				</table>


			</div>
			
			<nav class="listNav" >
				<ul class="listUl" >
					<c:if test="${listView.totalCourseCount>0}">
						<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
							<li class="page-item"  ${listView.pageNumber eq num ? 'active' : '' }><a class="page-link" href="<c:url value="/loc/courselist"/>?p=${num}&searchType=${param.searchType}&keyword=${param.keyword}" >${num}" ></a></li>
						</c:forEach>
					</c:if>
					
				
				</ul>
			
			</nav>





<%-- 			<div class="paging">
				<c:if test="${listView.totalMemberCount>0}">
					<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
				[ <a
							href="<c:url value="/member/list"/>?p=${num}&searchType=${param.searchType}&keyword=${param.keyword}"
							class="${listView.pageNumber eq num ? 'nowpage' : ''}">${num}</a> ] 				
				</c:forEach>
				</c:if>
			</div> --%>


		</div>
	</main>


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>



	<script>
	//  deleteCourse function이 없으면 삭제 기능이 실행이 안됨. 
		function deleteCourse(course_idx) {
			if (confirm('정말로 삭제하시겠습니까?')) {
				location.href = '<c:url value="/loc/coursedelete?course_idx="/>' + course_idx;
			} // /op/member/delete?idx
		}
	</script>







</body>
</html>