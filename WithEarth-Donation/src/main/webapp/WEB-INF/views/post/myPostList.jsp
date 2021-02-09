<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>WithEarth</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
#banner {
	margin-bottom: -100px;
}

.article {
	width: 500px;
	height: 250px;
	padding: 20px;
	text-align: center;
	margin-bottom: 30px;
	border: 1px solid #EEE;
	background-color: #EEE;
	border-radius: 10px;
}

.article-img {
	float: left;
	width: 200px;
	height: 200px;
}

.img {
	width: 200px;
	height: 200px;
	border-radius: 10px;
}

.article-content {
	float: left;
	margin-left: 8px;
}

.article-title {
	float: left;
	width: 250px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-align: left;
	font-size: 23px;
}

.article-heart {
	text-align: left;
	font-size: 15px;
}

.title {
	font-size: 50px;
	font-weight: bold;
}

.pBtn {
	float: right;
}
</style>
</head>

<body id="page-top">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="banner"></section>

	<section id="three" class="wrapper special">
		<div class="inner">
			<header class="align-center">
				<div class="title">내가 쓴 글</div>
			</header>

			<div class="table-wrapper"></div>
			<table>
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>카테고리</th>
						<th>작성일자</th>	
						<th></th>				
					</tr>
				</thead>
				<tbody class="tBody">
				
				</tbody>
			</table>
		</div>
	</section>


	<a href="<c:url value="/main/post/update"/>"><input type="button"
		class="pBtn" id="updateBtn" value="수정/삭제"></a>
	<a href="<c:url value="/main/post/upload"/>"><input type="button"
		class="pBtn" value="글쓰기" /></a>



	<script>
		$(document).ready(function() {

			// 게시물 idx 받기
			function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
				var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
				return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
			}
			
			var idx = getParameterByName('idx');
			
				$.ajax({

					url : "http://localhost:8080/dona/rest/user/post/mypost?idx=" + idx,
					type : 'GET',
					success : function(data) {

						$.each(data, function(index, item) {
													
							       var html = '<tr>';	
							           html += '<td>'+item.idx+'</td>';
							           html += '<td>'+item.postTitle+'</td>';
							           html += '<td>'+item.category+'</td>';
							           html += '<td>'+item.writedate+'</td>';					                               
							           html += '<td><input type="button" value="수정" onClick="location.href=\'<c:url value="/main/post/edit?idx='+item.donaIdx+'"/>\'">';
							           html += '<input type="button" value="삭제"></td>';
							           html += '</tr>';
																						
						        	$('.tBody').append(html);
					  	
						})
					},
					error : function(e) {
						console.log("에러 발생 : " + e);
					}

				});
			
		

		});
   </script>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</html>
