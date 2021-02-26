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
<title>텀블러 인증</title>


<style>
.nowpage {
	font-size: 1.5em;
	font-weight: bold;
}

p{
    text-align: center;
    font-size: 35px;



}
</style>



</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">
	</section>

    
      
			<!-- Table -->
			<p>텀블러 인증 내역</p>

			
		    <div class="head_orderlist"id="tum_list">  
		    
			</div>
			
 
		<nav aria-label="..." style="text-align: center;"> 
			<ul class="pagination"> 
			<c:if test="${listView.totalTpointCount>0}">
					<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
				    [<a href="<c:url value="/tumbler/tumlist"/>?p=${num}"
							class="${listView.pageNumber eq num ? 'nowpage' : ''}">${num}</a> ] 
				  </c:forEach>
				</c:if>
			 </ul> 
			 </nav> 


		

	



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

<script>

$(document).ready(function(){
	
	$.ajax({
		url : 'http://localhost:8080/tumbler/tumlist/rest/1',
		type : 'GET',
		success : function(data){
			console.log(data);
			//alert(JSON.stringify(data));
			
		
		        var html ='<table>';
		        html += '<thead>';
			    html+='<tr>';
			    html+='	<th>NO</th>';
			    html+='<th>적립일자</th>';
			    html+='<th>이용 매장</th>';
			    html+='<th>적립포인트</th>';
			    html+='</tr>';
			    html+= '</thead>';
			    html+='<tbody class="tbody" id="ttbody">';
			    html+='</tbody>';
			    html+='</table>';
			  
			    
			    $('#tum_list').append(html); 
			    html =

			$.each(data, function(index, item){
				
				 html2 =  '<tr>';
                 html2 += '<td>'+item.tum_idx+'</td>';
                 html2 += '<td>'+item.tum_date+'</td>';
                 html2 += '<td>'+item.cafe_name+'</td>';
                 html2 += '<td>'+item.tum_point+'</td>';
                 html2 += '</tr>';                  
				  
  		    
  		    $('#ttbody').append(html2);

			});
			
	
			
		},
		error : function(e){
			console.log("에러발생!! : ", e);
		}
	});
	
	
	
});

	
</script>