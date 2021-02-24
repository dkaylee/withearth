<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recycle</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
	.recontents{
		margin-top: 15%;
		margin-left: 1%;
		margin-right: 1%;
	}
</style>
</head>
<body>
 <%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="recontents">
		<button class="" value="플라스틱"></button>
		<img alt="recycle1" src="<c:url value="/img/cat1.jpg"/>" >
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
	<script>
	function showModal(){
    	$('#showModal').modal("show");
	}
	</script>
</body>
</html>