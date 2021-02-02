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
	font-weight: bold;
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
</style>
</head>
<body id="page-top">
	 <%@ include file="/WEB-INF/views/include/header.jsp"%>
     <%@ include file="/WEB-INF/views/include/nav.jsp"%>
	
     <div class="container">
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
        
      <%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>