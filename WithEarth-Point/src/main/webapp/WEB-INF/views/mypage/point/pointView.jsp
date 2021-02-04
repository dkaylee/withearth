<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
 
 .layer-wrap{  
    display : none;
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    text-align: center;
    background-color: rgba(0, 0, 0, 0.5);
 
 }
 
 .layer-wrap:before {
    content: "";
    display: inline-block;
    height: 100%;
    vertical-align: middle;
    margin-right: -.25em;
}
.pop-layer {
    display: inline-block;
    vertical-align: middle;
    width: 500px;
    height: auto;
    background-color: #fff;
    border: 5px solid #3571B5;
    z-index: 10;
    font-family:Tahoma;
}
.pop-layer .pop-container {
    padding: 20px 25px;
}
.pop-layer .btn-r {
    width: 100%;
    margin: 10px 0 20px;
    padding-top: 10px;
    border-top: 1px solid #DDD;
    text-align: right;   
}
a.btn-layerClose {
    display: inline-block;
    height: 25px;
    padding: 0 14px 0;
    border: 1px solid #304a8a;
    background-color: #3f5a9d;
    font-size: 13px;
    color: #fff;
    line-height: 25px;
     text-decoration: none;
}

.table-wrapper{
  margin-top : 10px;
}

 #wrapTable3{
 text-align: center;
  display : none; 
}

 .presentList{
   margin: 20px;
   overflow: hidden;
 }
 
 .wrapList{
   float :right;
   margin-right : 300px;
 }
 
 .ableList{
  font-size: 30px;
  font-weight: bold;
 }
 
 .showPoint{
   margin-left : 10px;
   padding : 1px 2px;
   background-color : #EEE;
   border-radius: 5px 5px;
   float : right;
 }
 
 #trans-btn{
  padding : -5px;
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
						<input type="button" id="btn2" value="내 보유 선물쿠폰">	
						<input type="button" id="btn3" value="포인트 선물 교환">	
						</div>			
					</header>
				</div>
			</section>             
			                 
				<div class="table-wrapper" id="wrapTable1">
				</div>
				<div class="table-wrapper" id="wrapTable2">
				</div>
				<div class="table-wrapper" id="wrapTable3">
				
				   <div class="presentList">
				   <div class="ableList">교환 가능한 선물 리스트</div>
				   <div class="wrapList">교환 가능 포인트</div>				    
				  </div>		
				  	  				   			
				   <a><img src="images/pic01.jpg" alt="Pic 01"/></a>
                   <a><img src="images/pic02.jpg" alt="Pic 02" /></a>
                   <a><img src="images/pic03.jpg" alt="Pic 03" /></a>
                   <br>	                  
                   <div>필요포인트<div class="showPoint"></div></div>
                   <input type="button" id="trans-btn" value="교환">	
                   	
				</div>
			
	<div id="layer" class="layer-wrap">
    <div class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <p class="ctxt mb20">
                   <h3>포인트 선물 교환</h3>
                   <h4>이 선물로 교환하시겠습니까?</h4>
                   <h5>(교환 후 취소가 불가합니다.)</h5>
                   <img src="images/pic01.jpg" alt="Pic 01" />
                </p>
                <div class="btn-r">
                    <a href="<c:url value="/user/point/view"/>" class="btn-layerClose">취소</a>
                    <a href="<c:url value="/user/point/view"/>" class="btn-layerClose">확인</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>
					
	<script>
  $(document).ready(function(){
	  
	  // 팝업창 보이게 하기
	  $('#btn3').click(function(){
		//  $('.layer-wrap').css('display', 'block');	
		  $('.table-wrapper').css('display', 'block');
		  		  
	  });
	  
	  // 팝업창 안보이게 하기
	  $('btn-layerClose').click(function(){
		  $('.layer-wrap').css('display', 'none');	
	  })
	  
	  
	  // ajax로 현재 보유 보인트 출력
	  $.ajax({
			 url : 'http://localhost:8080/point/rest/user/point/list/1',
			 type : 'GET',
			 success : function(data){
				 //console.log(data);
				// alert(JSON.stringify(data));
						
					var sum = $(data).last();
					console.log(sum);
					
					$.each(sum, function(index, item){
						// 포인트 조회 메인에 노출
						var html = '<div class="nowPoint">';
					    html+= item.pointsum;
	                    html+= ' p</div>';	                    
	                    $('#nowP').append(html);	
	                   
	                    // 포인트 선물 교환 시 노출
	                   var html2 = '<h4 class="showPoint">'+item.pointsum+'p</h4>'; 
	                    $('.wrapList').append(html2);
					})
									
			 },
			 error : function(e){
				 console.log("에러 발생 : "+e);
			 }
		  });
		 
	  // 버튼 이벤트와 ajax: 포인트 내역 출력
	 $('#btn1').click(function(){
		 
		 $('#wrapTable1').empty();
		 		 
		 var table1 = $('#wrapTable1');
		  table1.removeClass('display_none');
		 
		 var table1 = $('#wrapTable1');
		 table1.addClass('display_block');
		
		  var table2 = $('#wrapTable2');
		  table2.addClass('display_none');
			  			 			  			  		  			  		 	
	  $.ajax({
		 url : 'http://localhost:8080/point/rest/user/point/list/1',
		 type : 'GET',
		 success : function(data){
			 console.log(data);
			// alert(JSON.stringify(data));
			
			 var html = '<table>';
			    html += '<thead>';
			    html += '<tr>';
			    html += '<th>No.</th>';			   
			    html += '<th>적립내용</th>';
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
                    html2 += '<td>'+(index+1)+'</td>';
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

	  // 버튼 이벤트와 ajax : 보유 쿠폰 내역 출력
	  $('#btn2').click(function(){
		  
		  $('#wrapTable2').empty();
		 
		  var table2 = $('#wrapTable2');
		  table2.removeClass('display_none');
		  
		  var table2 = $('#wrapTable2');
		  table2.addClass('display_block');
		  
		  var table1 = $('#wrapTable1');
		  table1.addClass('display_none');
		  		 	
		  $.ajax({
			 url : 'http://localhost:8080/point/rest/user/coupon/list/1',
			 type : 'GET',
			 success : function(data){
				 console.log(data);
				// alert(JSON.stringify(data));
				
				 var html = '<table>';
			    html += '<thead>';
			    html += '<tr>';
			    html += '<th>No.</th>';
		        html += '<th>교환권QR</th>';
			    html += '<th>내역</th>';
			    html += '<th>발급일자</th>';
			    html += '</tr>';
			    html += '</thead>';
			    html += '<tbody id="tbody2">';
			    html += '</tbody>';
			    html += '</table>';
			    
			    $('#wrapTable2').append(html);
				
				$.each(data, function(index, item){
					var html = '<tr>';
	                    html+= '<td> '+(index+1) +'</td>';
	                    html+= '<td><img alt="QrImage" width="100px" src="<c:url value="/resources/coupon/'+item.couponQr+'png"/>"></td>';
	                    html+= '<td> '+ item.couponHistory+'</td>';
	                    html+= '<td>'+item.historyDate+'</td>';	                    
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