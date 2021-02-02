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
 #nowPoint{
   font-size: 30px;
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
					    <div>
						<div id="nowPoint">현재 보유 포인트</div>
						</div>
					</header>
					<div class="flex flex-4">
						<div class="box person">
							<div class="image round">
							</div>
							<h3><a>프로필 조회</a></h3>
						</div>
						<div class="box person">
							<div class="image round">
							</div>
							<h3><a href="/rest/user/point">포인트 조회</a></h3>
						</div>
						<div class="box person">
							<div class="image round">
							</div>
							<h3><a>활동 현황</a></h3>
						</div>
						<div class="box person">
							<div class="image round">
							</div>
							<h3><a>내가 쓴 글 조회</a></h3>
						</div>
					</div>
				</div>
			</section>
	<h3 id="point_list">포인트 적립 내역 확인<input type="button" id="btn1" value="확인"></h3> 
<h3 id="coupon_list">쿠폰 보유 현황<input type="button" id="btn2" value="확인"></h3>

			
			
	<script>
  $(document).ready(function(){
	  
	  $.ajax({
			 url : 'http://localhost:8080/dona/rest/user/point/list/1',
			 type : 'GET',
			 success : function(data){
				 //console.log(data);
				// alert(JSON.stringify(data));
						
					var sum = $(data).last();
					console.log(sum);
					
					$.each(sum, function(index, item){
						
						var html = '<div>';
					    html+= item.pointsum;
	                    html+= '</div>';	                    
	                    $('#nowPoint').append(html);
			
					})
									
			 },
			 error : function(e){
				 console.log("에러 발생 : "+e);
			 }
		  });
		 
	  	  	 
	  $('#btn1').click(function(){
		 	
	  $.ajax({
		 url : 'http://localhost:8080/dona/rest/user/point/list/1',
		 type : 'GET',
		 success : function(data){
			 console.log(data);
			// alert(JSON.stringify(data));
			
			$.each(data, function(index, item){
				var html = '<div style="border : 1px solid black; width : 200px; ">';
                    html+= '<h5> 회원idx : '+item.idx +'</h5>';
                    html+= '<h5> 적립내용 : '+item.saving_system+'</h5>';
                    html+= '<h5> 포인트 : '+item.saving_point+'</h5>';
                    html+= '<h5> 적립일자 : '+ item.saving_date+'</h5>';
                    html+= '<h5> 포인트합계 : '+item.pointsum+'</h5>';
                    html+= '</div>';
                    
                    $('#point_list').append(html);
			})
		 },
		 error : function(e){
			 console.log("에러 발생 : "+e);
		 }
	  })	  
	  
	  });
	  
	  
	  $('#btn2').click(function(){
		 	
		  $.ajax({
			 url : 'http://localhost:8080/dona/rest/user/coupon/list/2',
			 type : 'GET',
			 success : function(data){
				 console.log(data);
				// alert(JSON.stringify(data));
				
				$.each(data, function(index, item){
					var html = '<div style="border : 1px solid black;">';
	                    html+= '<h5> 회원idx : '+item.idx +'</h5>';
	                    html+= '<h5> 쿠폰QRcode : <img alt="QrImage" src="<c:url value="/resources/coupon/'+item.couponQr+'png"/>"></h5>';
	                    html+= '<h5> 내역 : '+item.couponHistory+'</h5>';
	                    html+= '<h5> 일자 : '+ item.historyDate+'</h5>';	                    
	                    html+= '</div>';
	                    
	                    $('#coupon_list').append(html);
				})
			 },
			 error : function(e){
				 console.log("에러 발생 : "+e);
			 }
		  })	  
		  
		  });
	  
  });  
</script>		
   </body>    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>   
</html>