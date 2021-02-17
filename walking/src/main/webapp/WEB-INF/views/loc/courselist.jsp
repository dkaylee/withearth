<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course list</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
	.table{
		border: 1px solid #DDD;
	}
	
	tr {
		border-bottom: 1px solid #eee;
	}
	

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="contents">
		<h2 class="content_title">Course List</h2>
		<hr>
		<div class="content">
			
			<table class="table">
				<tr>
					<th>idx</th>
					<th>저장 일자</th>
					<th>출발지</th>
					<th>목적지</th>
					<th>이동 거리</th>
					<th>소요 시간</th>
				</tr>
				
				
				<tr>
					<td>${course.course_idx}</td>
					<td>${course.course_date}</td>
					<td>${course.start_point}</td>
					<td>${course.end_point}</td>
					<td>${course.loc_km}</td>
					<td>${course.walking_time}</td>
				</tr>
			</table>
		
		</div>
	
	</div>

</body>
</html>