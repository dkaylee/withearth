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

<style>
</style>

</head>

<body class="subpage">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	
	//var matIdx=${matzip.matIdx};
	
	// 파라미터로 페이지 번호 받기
 	function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 	
    var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);	
  	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var matIdx = getParameterByName('matIdx');
	
	console.log(matIdx);
	
	 $(document).ready(function(){
		
		getMatDetail();	
		getUploadFiles();
		

	}); 
	
	/* go edit Form */
	function goEdit(){

		location.href = "https://www.withearthcomm.tk/community/matzip/editmatForm?matIdx="+matIdx;

	}
	

	/* get Matzip data */
	function getMatDetail(){
		
		$.ajax({

			url:"https://www.withearthcomm.tk//community/matzip/matDetail?matIdx="+matIdx,

			type: "GET",
			success : function(data) {
				console.log(data);	
				
				var html = "";
				html += '<hr class="major"/>';
				html += '<div>';
				html += '<img src="/community/fileupload/matzip/'+data.matImg+'" style="width:60%">';
				html += '</div>';
				html += '<hr class="major"/>';
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
				
			},
			error : function(){
				alert("오류가 발생했습니다.");
			}
		});	
	}
	
	
	/* get UploadFiles */
	function getUploadFiles(){
		
		var filelist= [];
		
		$.ajax({
			url:"https://www.withearthcomm.tk/community/matzip/filelist?matIdx="+matIdx,

			type: "GET",
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
				alert("오류가 발생했습니다");
	
			}
		});
	}
	


 	function deleteMatzip() {
		
	$.ajax({

				url:"https://www.withearthcomm.tk/community/matzip/deleteMat?matIdx="+matIdx,

				type:"POST",
				success : function(result){	
					console.log(result);
					
					if(result == "1" ) {
						alert("게시글 삭제를 성공하였습니다.");  
						goMatlist();
						}
				},
				error: function(){
					alert('삭제를 실패했습니다.');
				}
			});
	} 
	

/* 맛집 목록이동 */
function goMatlist(){
	location.href = "/community/matzip/matlist?p=1";
}


 

</script>


<section id="three" class="wrapper special">
	
		<%-- <span class="image fit" style="width: 1480px; height: 200px;"><img src="${matzip.matImg}"></span> --%>
		
		
		<div class="inner">
		
		<h3>새로운 맛집 추가 완료!</h3>

			<div id="matImg"></div>
			
			<header class="align-center">
			
				<div id="matDetail">  </div>	
			</header>
		</div>
		
		<ul class="actions">
			<li><a href="#" class="button alt" onclick="javascript:goEdit();">수정</a></li>
			<li><a href="#" class="button alt" onclick="javascript:deleteMatzip();">삭제</a></li>
			<li><a href="#" class="button alt" onclick="javascript:goMatlist();">목록</a></li>
		</ul>
		
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>





</body>
</html>