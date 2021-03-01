<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matzip</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>







</head>

<body class="subpage">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<section id="three" class="wrapper special">
	
		<%-- <span class="image fit" style="width: 1480px; height: 200px;"><img src="${matzip.matImg}"></span> --%>
		
		
		<div class="inner">
		
		
			
			<div id="matImg"></div>
			
			<header class="align-center">
			
				<div id="matDetail">
				
				
				
				
				<%-- <c:forEach items="${uploadFileList}" var="upload">
				<div class="6u$ 12u$(xsmall)">
					<img src="<c:url value="/fileupload/matzip/${uploadFileList.newFName}"/>">
				</div> 
				</c:forEach> --%>
			</div>	
			</header>
		</div>
		
		<ul class="actions">
			<li><a href="#" class="button alt" onclick="javascript:editMatzip();">수정</a></li>
			<li><a href="#" class="button alt" onclick="javascript:deleteMatzip();">삭제</a></li>
			<li><a href="#" class="button alt" onclick="javascript:goMatlist();">목록</a></li>
		</ul>
		
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	
	var matIdx=${matzip.matIdx};
	
	
	 $(document).ready(function(){
		getMatDetail();	
		getUploadFiles();
	}); 
	
	

	/* go edit Form */
	function editMatzip(){
		var matIdx = $('#mIdx').val();
		location.href = "/matzip/editmatForm?mIdx=${matzip.matIdx}";
	}
	

	/* idx-data */
	function getMatDetail(matIdx){
		$.ajax({
			url:"http://localhost:8080/community/matzip/matDetail?matIdx=${matzip.matIdx}",
			type: "GET",
			dataType: "JSON",
			success : function(data) {
				console.log(data);	
				
				var html = "";
				html += '<div>'
				html += '<img src="/fileupload/matzip/'+data.matImg+'">';
				html += '</div>'
				html += '<h2>'
				html += data.matTitle
				html += '</h2>';
				html += '<div>'
				html += data.matAddr
				html += '</div>';
				html += '<div>'
				html += data.matTime
				html += '</div>';
				html += '<div>'
				html += data.matNum
				html += '</div>';
				
				 console.log(html);
				$('#matDetail').append(html);
				
				/* if(data.matImg == ""){
					
					html +=  '<div>'data.matTitle'</div>';
					html +=  '<div>'data.matAddr'</div>';
					html +=  '<div>'data.matTime'</div>';
					html +=  '<div>'data.matNum'</div>';
					
					('#matDetail').append(html);
					
				} else {
					
					html +=  '<img src="/fileupload/matzip/'+data.matImg+'">';
					html +=  '<div>'data.matTitle'</div>';
					html +=  '<div>'data.matAddr'</div>';
					html +=  '<div>'data.matTime'</div>';
					html +=  '<div>'data.matNum'</div>';
					
					('#matDetail').append(html);
				} */

			},
			error : function(){
				alert("데이터 못 불러옴^^");
			}
		});	
	}
	
	
	
	function getUploadFiles(matIdx){
		
		var filelist= [];
		
		$.ajax({
			url:"http://localhost:8080/community/matzip/filelist?matIdx=${matzip.matIdx}",
			type: "GET",
			dataType:"JSON",
			success : function(data) {
				console.log(data);

				var files = "";
				
				for(var i=0; i<data.length; i++){
				
				files +='<img src="/fileupload/matzip/'+data[i].newFName+'">';
				filelist.push(files);
				
				}
				
				$('#matImg').append(files);
				
				console.log(matImg);
				console.log(filelist);
	
			},
			error : function(data){
				alert("데이터 못 불러옴^^");
	
			}
		});
	}
	


function deleteMatzip(matIdx) {
	
	$ajax({
		url:"/matzip/delete",
		data: $(matIdx).serialize(),
		dataType : "JSON",
		cache : false,
		async: true,
		success : function(data){
		
		if(data != null ){
			var result = data.result;
			if(confirm('정말로 삭제하시겠습니까')&&result == "1" ) {
				goMatlist();
				}
			}
		},
		error:
			alert("삭제할 수 없습니다.")
	});
	
}
	

/* 맛집 목록이동 */
function goMatlist(){
	location.href = "/community/matzip/matlist";
}

/* 맛집 수정페이지이동 */
function goEdit(){
	location.href = "/community/matzip/editmatForm";
}
 

</script>



</body>
</html>