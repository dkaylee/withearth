<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>WithEarth</title>
		<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
		
    <style>
    
    .title{
      text-align: center;
      font-size : 30px;
      font-weight: bold;
    }
    </style>    
    </head>
    
    <body id="page-top">
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       
 			<section id="banner">
			</section>
			
			<form method="post" enctype="multipart/form-data" action="<c:url value="/rest/user/post/upload"/>">
			<h3 class="title">무료나눔 글쓰기</h3><br>
		<div class="row uniform">		
			<div class="6u 12u$(xsmall)">
			    <input type="hidden" name="idx" id="idx" value="1"/>
				<input type="text" name="postTitle" id="postTitle" placeholder="제목" />
				<input multiple="multiple" type="file" name="postImage" id="postImage"/>				
			</div>
			<!-- Break -->
			<div class="6u 12u$(xsmall)">
				<div class="select-wrapper">
					<select name="category" id="category">
						<option value="">- Category -</option>
						<option value="디지털/가전">디지털/가전</option>
						<option value="가구/인테리어">가구/인테리어</option>
						<option value="유아동/유아도서">유아동/유아도서</option>						
						<option value="생활/가공식품">생활/가공식품</option>
						<option value="스포츠/레저">스포츠/레저</option>
						<option value="의류/잡화">의류/잡화</option>
						<option value="도서/티켓/음반">도서/티켓/음반</option>
						<option value="기타 물품">기타 물품</option>
					</select>
				</div>
			</div>
			<div class="12u$">
				<textarea name="postContent" id="postContent"
					placeholder="Enter your message" rows="6"></textarea>
			</div>
			<!-- Break -->
			<div class="12u$">
				<ul class="actions">
					<li><input type="submit" value="Send Message" /></li>
					<li><input type="reset" value="Reset" class="alt" /></li>
				</ul>
			</div>
		</div>
	</form>
	
	
	<script>
	 
	  
	
	</script>	
    </body>
    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>
