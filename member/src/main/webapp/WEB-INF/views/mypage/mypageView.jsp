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
 .person{
   background-color: white !important;
   border-radius: 20px !important;
 }
 
 h3{
  color : #404040 !important; 
  font-weight: bold;
 }
 
 .round{
  cursor:pointer !important;
 }

</style>
    </head>
    
    <body id="page-top">
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       
		<section id="one" class="wrapper">	
		</section>	
		
	<!-- Two -->
			<section id="two" class="wrapper style1 special">
				<div class="inner">
					<header>
						<h2>마이페이지</h2>
						<div class="profile">
						
            </div>
					</header>
					<div class="flex flex-4">
						<div class="box person" onclick="location.href='<c:url value='/member/mypage'/>'">
							<div class="image round">
							<img src="<c:url value="/img/point/profile.png"/>" alt="mypage-pic1">
							</div>
							<h3><a>프로필 조회</a></h3>
						</div>
						<div class="box person">				 	
							<div class="image round">
							<a href="<c:url value="/user/point/view"/>">
							<img src="<c:url value="/img/point/mypoint.png"/>" alt="mypage-pic2">
							</a>
						  </div>													
							<h3><a href="<c:url value="/user/point/view"/>">포인트 조회</a></h3>
						</div>
						<div class="box person">
							<div class="image round">
							<img src="<c:url value="/img/point/myactivity.png"/>" alt="mypage-pic3">
							</div>
							<h3><a>활동 현황 조회</a></h3>
						</div>
						<div class="box person">
							<div class="image round">							
							<a href="<c:url value="/dona/main/post/mypost?idx=${loginInfo.idx}"/>">
							<img src="<c:url value="/img/point/mypost.png"/>" alt="mypage-pic4">
							</a>
							</div>
							<h3><a>내가 쓴 글 조회</a></h3>
						</div>
					</div>
				</div>
			</section>
		
    </body>
    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>