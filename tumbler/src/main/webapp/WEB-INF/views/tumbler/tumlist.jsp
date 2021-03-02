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

head_orderlist{

text-align: center;
}

table th{
   text-align: center;
 
}

table td{
   font-size:large;
   text-align: center;
 
}


.nowpage {
	font-size: 1.5em;
	font-weight: bold;
}

p{
    text-align: center;
    font-size: 35px;



}

.pagination{
  overflow : hidden;
  float : right; 
}
.paging{
overflow : hidden;
  margin-right : 550px;
}
.page-link{
 border-radius: 3px 3px;
}
 #paging > ul {
        list-style-type:none;
}
    
    #paging > ul li {
        font-size: 1.1em;
        display:inline-block;
        cursor:pointer;
        padding: 0 3px;
}
    #paging > ul > li:hover {
        /*background: #fbfbfb;*/
        /*font-weight:bold;*/
        color: #0080ff;
    }
    

    #paging > ul > li.selected {
        color: #0080ff;
        font-size:1.2em;
        font-weight:bold;
        cursor:default;

}

.pagination{
  overflow : hidden;
  float : right; 
  list-style-type:none;
}
.paging{
overflow : hidden;
  margin-right : 550px;
}
.page-link{
 border-radius: 3px 3px;
}
 #paging > ul {
        list-style-type:none;
}
ul {
        list-style-type:none;
}
ul li {
        font-size: 1.1em;
        display:inline-block;
        cursor:pointer;
        padding: 0 3px;
}
</style>



</head>
<body class="subpage">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="main" class="wrapper">
	
		<p>텀블러 인증 내역</p>
	</section>

    
      
		
			
		    <div class="head_orderlist"id="tum_list">  
		    
			</div>


		
      <div class="paging">
				<c:if test="${listView.totalTpointCount>0}">
					<c:forEach begin="1" end="${listView.totalPageCount}" var="num">
				    [<a href="<c:url value="/tumbler/tumlist"/>?p=${num}"
							class="${listView.pageNumber eq num ? 'nowpage' : ''}">${num}</a> ] 
				  </c:forEach>
				</c:if>
			 </div>
			 
			<!--  <div class="paging">
				     	<ul class="pagination"></ul>						 
			 </div>
			  -->
			  
			  

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

<script>


	// 파라미터로 페이지 번호 받기
	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
				.exec(location.search);

		return results === null ? "" : decodeURIComponent(results[1].replace(
				/\+/g, " "));
	}

	var p = getParameterByName('p');
	console.log(p);

	$(document).ready(function() {

						$('.paging').empty();

						$.ajax({
									url : 'http://localhost:8080/tumbler/tumlist/rest?p='+ p,
									type : 'GET',
									async : false,
									success : function(data) {

										console.log(data);
										//alert(JSON.stringify(data));
										console.log(data.cafe_name);

										var html = '<table>';
										html += '<thead>';
										html += '<tr>';
										html += '<th>NO</th>';
										html += '<th>적립일자</th>';
										html += '<th>이용 매장</th>';
										html += '<th>적립포인트</th>';
										html += '</tr>';
										html += '</thead>';
										html += '<tbody class="tbody" id="ttbody">';
										html += '</tbody>';
										html += '</table>';

										$('#tum_list').append(html);
										var a = '';
										var cntPerPage = data.cntPerPage;
										var startRow = data.startRow;
										var endRow = data.endRow;
										var tumlist = data.tumlist;
										var totalTpointCount = data.totalTpointCount;
										var totalPageCount = data.totalPageCount;

										$.each(tumlist, function(index, item) {
											console.log("data : "+ data.tumlist);
											console.log(tumlist);
											console.log(cntPerPage + ","+ startRow + "," + endRow);
											console.log("start : " + startRow);
											console.log("end : " + endRow);
											console.log("totalTpointCount:"+ totalTpointCount);
											console.log("totalPageCount:"+ totalPageCount)

											html2 = '<tr>';
											html2 += '<td>' + item.tum_idx+ '</td>';
											html2 += '<td>' + item.tum_date+ '</td>';
											html2 += '<td>' + item.cafe_name+ '</td>';
											html2 += '<td>' + item.tum_point+ '</td>';
											html2 += '</tr>';

											$('#ttbody').append(html2);

										});

										// 페이징 처리
										if (data.totalTpointCount > 0) {
											var pHtml = '<ul class="pagination"></ul>';
											$('.paging').append(pHtml)
											console.log('totalTpointCount :'
													+ data.totalTpointCount);

											for (var i = 1; i <= data.totalPageCount; i++) {
												var html3 = '<li class="page-item"><a class="page-link" href="<c:url value="/tumbler/tumlist"/>?p='+ i+ '">'+ i+ '</a></li>';
												$('.pagination').append(html3);
											}
										}
										;

										/* for (var num=startRow; num<=endRow; num++) {
										     if (num == cntPerPage) {
										          a += '<a class="page-link" href="<c:url value="/tumbler/tumlist"/>?p=' + num + '); return false;" class="page-btn">' + num + '</a>';
										     } else {
										          a += '<a class="page-link" href="<c:url value="/tumbler/tumlist"/>?p=' + num + '); return false;" class="page-btn">' + num + '</a>';
										     }
										  }
										
										
										
										$('.ttbody').html(a);
										 */

									},
									error : function(e) {
										console.log("에러발생!! : ", e);
									}
								});

					});
</script>