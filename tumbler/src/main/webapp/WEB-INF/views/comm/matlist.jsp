<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matzip List</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

</head>
<body class="subpage">

	 <%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<section id="main" class="wrapper">
    <div class="table-wrapper">
     <table>
     	<tr>
        <th>idx</th>
        <th>이름</th>
        <th>주소</th>
        <th>운영시간</th>
        <th>전화번호</th>
        <th>작성자</th>
        <th>내용</th>
        <th>사진</th>
        <th>작성일자</th>
        <th>하트수</th>
        <th>회원아이디</th>
        </tr>
        
        <c:forEach items="${matlistView}" var="matzip">
		<tr>
		<td>{matzip.mat_idx}</td>
		<td>{matzip.mat_title}</td>
		<td>{matzip.mat_addr}</td>
		<td>{matzip.mat_time}</td>
		<td>{matzip.mat_num}</td>
		<td>{matzip.mat_wr}</td>
		<td>{matzip.mat_cont}</td>
		<td>{matzip.mat_img}</td>
		<td>{matzip.mat_date}</td>
		<td>{matzip.mat_heart}</td>
		<td>{matzip.idx}</td>
		</tr>
		</c:forEach>
	</table>
	 </div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>