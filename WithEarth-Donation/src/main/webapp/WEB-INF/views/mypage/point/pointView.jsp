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

.findPoint{
  float : left;
  font-size: 35px;
}

 #nowP{
 
   font-size: 30px; 
   text-align:center;
   line-height:  130%;
   margin-top : 5px;
   padding : 5px;   
   color : white;
 }
 
 .nowPoint{  
 
  float : right;
  
  margin-left : 30px;
  margin-top : -5px;
  padding : 10px;  
  line-height:  100%; 
  border-radius : 10px 10px; 
  font-size: 30px; 
  font-weight: bold; 
  background-color: white;
  color : #5385c1;
 }
 
 .now{
   float : left;
 }
 
 .wrapPoint{
 overflow : hidden;
   clear : both;
 }

 .inner{
   margin-top : -50px;
   margin-bottom: -60px;
 }
 
 .btn{
 float : left;
 margin-left : 20px;
 }
 
 .btn input[type=button]{
  border-radius : 10px 10px;
 
 }
 
 .display_block{
    display : block;
 }
 
 .display_none{
   display : none;
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
				    <h3 class="findPoint">내 포인트 조회</h3>
					<header class="wrapPoint">
					    <div class="now">
						<div id="nowP">현재 보유 포인트</div>																	
						</div>	
						<div class="btn">
						<input type="button" id="btn1" value="포인트 적립 내역">
						<input type="button" id="btn2" value="내 보유 쿠폰">		
						</div>			
					</header>
				</div>
			</section>                              
				<div class="table-wrapper" id="wrapTable1">
				</div>
				<div class="table-wrapper" id="wrapTable2">
				</div>
					
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
						
						var html = '<div class="nowPoint">';
					    html+= item.pointsum;
	                    html+= ' p</div>';	                    
	                    $('#nowP').append(html);	                    
					})
									
			 },
			 error : function(e){
				 console.log("에러 발생 : "+e);
			 }
		  });
		 
	  
	 $('#btn1').one('click',function(){
		
			 var table2 = $('#wrapTable2');
			  table2.addClass('display_none');
			 			  			  		  
			  var table1 = $('#wrapTable1');
			  table1.removeClass('display_none');
			  		 	
	  $.ajax({
		 url : 'http://localhost:8080/dona/rest/user/point/list/1',
		 type : 'GET',
		 success : function(data){
			 console.log(data);
			// alert(JSON.stringify(data));
			
			 var html = '<table>';
			    html += '<thead>';
			    html += '<tr>';
			    html += '<th>No.</th>';
			    html += '<th>포인트</th>';
			    html += '<th>적립일자</th>';
			    html += '<th>합계</th>';
			    html += '</tr>';
			    html += '</thead>';
			    html += '<tbody id="tbody1">';
			    html += '</tbody>';
			    html += '</table>';
			    
			    $('#wrapTable1').append(html);
			
			$.each(data, function(index, item){
                
                    html2 = '<tr>';
                    html2 += '<td>'+index+'</td>';
                    html2 += '<td>'+item.saving_system+'</td>';
                    html2 += '<td>'+item.saving_point+'</td>';
                    html2 +=	'<td>'+item.saving_date+'</td>';
                    html2 +=	'<td>'+item.pointsum+'</td>';
                    html2 += '</tr>';                 
				               
                    $('#tbody1').append(html2);
			})
		 },
		 error : function(e){
			 console.log("에러 발생 : "+e);
		 }
	  })	  
	  
	  });

	  
	  $('#btn2').one('click',function(){
		  
		  var table1 = $('#wrapTable1');
		  table1.addClass('display_none');
		  
		  var table2 = $('#wrapTable2');
		  table2.removeClass('display_none');
		 	
		  $.ajax({
			 url : 'http://localhost:8080/dona/rest/user/coupon/list/2',
			 type : 'GET',
			 success : function(data){
				 console.log(data);
				// alert(JSON.stringify(data));
				
				 var html = '<table>';
			    html += '<thead>';
			    html += '<tr>';
			    html += '<th>No.</th>';
			    html += '<th>포인트</th>';
			    html += '<th>적립일자</th>';
			    html += '<th>합계</th>';
			    html += '</tr>';
			    html += '</thead>';
			    html += '<tbody id="tbody2">';
			    html += '</tbody>';
			    html += '</table>';
			    
			    $('#wrapTable2').append(html);
				
				$.each(data, function(index, item){
					var html = '<tr>';
	                    html+= '<td> 회원idx : '+item.idx +'</td>';
	                    html+= '<td> 쿠폰QRcode : <img alt="QrImage" src="<c:url value="/resources/coupon/'+item.couponQr+'png"/>"></td>';
	                    html+= '<td> 내역 : '+ item.couponHistory+'</td>';
	                    html+= '<td> 일자 : '+ item.historyDate+'</td>';	                    
	                    html+= '</tr>';
	                    
	                    $('#tbody2').append(html);
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