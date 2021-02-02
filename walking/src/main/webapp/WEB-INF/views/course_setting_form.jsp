<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<%@ include file="/WEB-INF/views/include/walking_nav.jsp" %>
	
	
	<div class="course_contents">
		<h2>코스 설정</h2>
		<hr>
		<div class="course_content">
			<form id="courseSettingForm" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th>출발지</th>
						<td>
							<input type="text" name="start" id="start">
						</td>
					</tr>
					
					<tr>
						<th>도착지</th>
						<td>
							<input type="text" name="end" id="end">
						</td>
					</tr>
					
					<tr>
						<th></th>
						<td><input type="submit" value="완료"></td>
					</tr>
				</table>
			
			</form>
		
		
		</div>
	</div>
	
	
	
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	


</body>
</html>
    