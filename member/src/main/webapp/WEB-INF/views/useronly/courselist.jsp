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

.container{	
	margin-left: 15%;
	margin-right: 5%;	
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
	margin: 0 20px;
	padding: 10px 20px;
	background-color: #EEE;
	float: left;
	vertical-align: middle;
}

#searchType{
	width: 320px;
	margin: 0 20px;
	float: left;
}

#keyword{
	width: 300px;
	margin-left: 1%;
	float: left;
}

#searchBtn{margin-left: 1%;}

#totalCourseCount{
	float: right;
}

h3{
	margin: 0;
	float: left;
}

#nav{
	margin-left: 50%;
}

#nav>li{
	list-style: none;
	float:left;
	text-align: center;
}

#nav>li>a{
	text-decoration: none;
	font-size: 1.5em;
	color: #d4e0ef;
}

#nav>li>a:hover{
	
	font-size: 1.5em;
	color: #5385c1;
	
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
<%-- 	<%@ include file="/WEB-INF/views/include/nav.jsp" %> --%>
	
	<main class="container">
		<h2 style="margin:50px 0; font-weight: bolder;">나의 코스</h2>
		<div class="searcontents">
			<div class="searcontent">
				<!-- <div class="searchBox"> -->
				<form><h3>검색 타입</h3>  
					<select name="searchType" id="searchType">
						<option value="both">저장일자(ex.YYYY-MM-DD) + 목적지</option>
						<option value="date">저장 일자(ex.YYYY-MM-DD)</option>
						<option value="end">목적지</option>
					</select> <h3>검색 키워드</h3> <input type="text" name="keyword" id="keyword"> <input
						type="submit" value="검색" id="searchBtn">
				</form>
				<!-- 	</div> -->
			</div>
		</div>


		<div class="contents">
			<h3 class="listinfo">코스 리스트</h3>
			<h4 id="totalCourseCount">전체 코스 개수:  ${courseCnt} 개</h4>
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
						<c:set var="i" value="${i+1}"/>
							<tr >
								<%-- <td>${course.course_idx}</td> --%> <!-- 카운팅으로 처리 forEach..? -->
								<td>${i}</td>
								<td><fmt:formatDate value="${course.course_date}"
										pattern="yyyy-MM-dd  HH:mm:ss" /></td>
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

				<ul  id="nav">
					<c:if test="${listView.totalCourseCount>0}">
						<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
							<li class="page-item"  ${listView.pageNumber eq num ? 'active' : '' }>
								<a class="page-link" 
								href="<c:url value="/loc/courselist"/>?p=${num}&searchType=${param.searchType}&keyword=${param.keyword}" >${num}
								</a>
							</li>
						</c:forEach>
					</c:if>
				</ul>

			</div>
			
				

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