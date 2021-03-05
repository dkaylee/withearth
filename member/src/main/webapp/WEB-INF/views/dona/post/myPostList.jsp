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
<link rel="stylesheet" href="<c:url value="/css/dona/postlist.css"/>"/>
<style>
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

			<div class="table-wrapper">
			<h2>나눔장터</h2>
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
			
			<div class="table-wrapper">
			<h2>커뮤니티</h2>
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
				<tbody class="tBodyM">
				
				</tbody>
			</table>
			</div>
			
			
			
		</div>
	</section>


	<script>
	
	function deletePost(idx){
		
		console.log('테스트1');
		 var delConfirm = confirm('정말 삭제하시겠습니까?');
		 
		 if(delConfirm){
			  $.ajax({
				 
				 url : "https://www.withearthdona.tk/dona/rest/user/post/delete?idx="+ idx,
				 type : 'GET',
				 success : function(data){					 
					 location.reload();				 
					 console.log(idx+'번 게시물 삭제완료!');
				 }
				 
			 });		
		 }		
	};
	
	
function deleteMatzip(idx) {
		
		$.ajax({
					url:"https://www.withearthcomm.tk/community/matzip/deleteMpost?Idx="+Idx,
					type:"POST",
					cache : false,
					success : function(result3){	
						console.log(result3);
						
						if(result == "1" ) {
							alert("게시글 삭제 했습니다.");  
								// deleteFiles();	
							 location.reload();	
							}
					},
					error: function(){
						alert('삭제를 실패했습니다.');
					}
				});
		} 
	
	
	
	
	

	
		$(document).ready(function() {
		
			// 뷰컨트롤러 통해서 게시물 idx 받기
			function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
				var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
				return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
			}
			
			var idx = getParameterByName('idx');
			
				$.ajax({					
					url : "https://www.withearthdona.tk/dona/rest/user/post/mypost?idx=" + idx,
					type : 'GET',
					success : function(data) {

						$.each(data, function(index, item) {
													
							       var html = '<tr>';	
							           html += '<td>'+(index+1)+'</td>';
							           html += '<td>'+item.postTitle+'</td>';
							           html += '<td>'+item.category+'</td>';
							           html += '<td>'+item.writedate+'</td>';					                               
							           html += '<td><input type="button" value="수정" onClick="location.href=\'<c:url value="/dona/main/post/edit?idx='+item.donaIdx+'"/>\'">';
							           html += '<input type="button" value="삭제" onclick="deletePost('+item.donaIdx+');"></td>';
							           html += '</tr>';
																						
						        	$('.tBody').append(html);						        
					  	
						})
					},
					error : function(e) {
						console.log("에러 발생 : " + e);
					}

				});
				
				
				
				$.ajax({					
					url : "https://www.withearthcomm.tk/community/matzip/mypost?idx=" + idx,
					type : 'GET',
					success : function(data) {
						console.log(data);
						console.log(data.idx);
						console.log(data.matTitle);

						$.each(data, function(index, item) {
													
							       var html = '<tr>';	
							           html += '<td>'+(index+1)+'</td>';
							           html += '<td>'+item.matTitle+'</td>';
							           html += '<td>'+item.matCont+'</td>';
							           html += '<td>'+item.matDate+'</td>';					                               
							           html += '<td><input type="button" value="수정" onClick="location.href=\'<c:url value="/member/matzip/editmatForm?matIdx='+item.matIdx+'"/>\'">';
							           html += '<input type="button" value="삭제" onclick="deleteMatzip('+item.matIdx+');"></td>';
							           html += '</tr>';
																						
						        	$('.tBodyM').append(html);						        
					  	
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
