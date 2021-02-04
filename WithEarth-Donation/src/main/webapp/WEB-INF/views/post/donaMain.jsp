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
	
	#banner{
	  margin-bottom : -70px;
	}
	
	div.article{
	 margin : 10px auto;
	}
	
	div.unit{
	float : left;
	
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
						<h2>나눔장</h2>
						<p> 환경을 위해 나눔에 동참해보세요! </p>
					</header>
					<div class="flex flex-2">				   
						<article>
						  <div class="article">							
							<div class="unit">
								<img src="images/pic01.jpg" alt="Pic 01" />
							</div>
							<div class="unit">
							<header>
								<h3>Praesent placerat magna</h3>
							</header>
							<p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor lorem ipsum.</p>
						   </div>
						   </div>	
						</article>	
						<article>
						  <div class="article">							
							<div class="unit">
								<img src="images/pic01.jpg" alt="Pic 01" />
							</div>
							<div class="unit">
							<header>
								<h3>Praesent placerat magna</h3>
							</header>
							<p>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor lorem ipsum.</p>
						   </div>
						   </div>	
						</article>					
					</div>
				</div>
			</section>			
		<a href="<c:url value="/main/post/upload"/>"><input type="button" value="글쓰기"/></a>
    </body>
    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>
