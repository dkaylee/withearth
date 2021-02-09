<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>WithEarth</title>
		<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<style>
	
	#banner{
	  margin-bottom : -100px;
	}
	
	.article{	
	 width : 500px;
	 height : 250px;	 
	 padding : 20px;
	 
	 text-align : center;
	 margin-bottom : 30px;
	 border : 1px solid #EEE;
	 background-color: #EEE;
	 border-radius: 10px;
	}
	
	.article-img{		
	 float : left;
	 width : 200px;
	 height :200px;
	}
	
	.img{
	width : 200px;
	 height :200px;
	border-radius: 10px;
	}
	
	.article-content{
	  float : left;
	  	  
	  margin-left : 8px;
	}
	
	.article-title{
	  float : left;
	  width : 250px;
	  	 	  
	  white-space: nowrap;  
	  overflow: hidden;
	  text-overflow: ellipsis;
	  
	  text-align: left;
	  font-size : 23px;
	}
	
	.article-heart{
	text-align: left;
	font-size : 15px;
	
	}
	
	.title{
	  font-size : 50px;
	  font-weight: bold;
	}
	
	.pBtn{
	  float : right;
	}
	
	
	</style>	
    </head>
    
    <body id="page-top">
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       
 			<section id="banner">
			</section>
			
		<section id="three" class="wrapper special">
				<div class="inner">
					<header class="align-center">
						<div class="title">나눔장</div>
						<p> 환경을 위해 나눔에 동참해보세요! </p>
					</header>
			
					<div class="flex flex-2" id="wrapContent" >				   						
						 
				   </div>
							   
				   </div>
			</section>			
	
						
   <a href="<c:url value="/main/post/mypost?idx=1"/>"><input type="button" class="pBtn" id="updateBtn" value="내 글 보기"></a> 
	<a href="<c:url value="/main/post/upload"/>"><input type="button" class="pBtn" value="글쓰기"></a>	
  
  
   
   	<script>
		$(document).ready(function() {


				$.ajax({

					url : "http://localhost:8080/dona/rest/user/post/list",
					type : 'GET',
					success : function(data) {

						$.each(data, function(index, item) {
													
							var html ='<div class="article" onClick="location.href=\'<c:url value="/main/post/detail?idx='+item.donaIdx+'"/>\'">';
							html += '<div class="article-img">';
							html += '<img alt="thumbnail" class="img" src="<c:url value="/fileupload/post/s_'+item.files.fileName+'"/>">';	
							html += '</div>';
							html += '<div class="article-content">';
							html += '<div class="article-title">';
							html += item.postTitle+'</div>';
							html += '<div class="article-heart">';
							html += '관심 3</div>';
							html += '</div></div>';
							
							$('#wrapContent').append(html);
					  	
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
