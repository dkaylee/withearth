<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

<style>
.3u$ 12u$(small){
	flaot: left;
}
img{
	display:block; 
    margin:auto;
}
</style>


</head>





<!--  맛집정보 수정 view-->

<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section id="three" class="wrapper">
	<div class="inner">
			<header class="align-center">
				<h2>맛집 정보 수정</h2>
				<hr class="major"/>
			</header>
	
	<!-- 맛집 수정 Form -->	
	<div class="row uniform">
		<form method="post" enctype="multipart/form-data" id="editForm">
			<div class="row uniform">
				<div class="row uniform" id="editInfo"></div>
				
				<%-- <div class="6u 12u$(xsmall)">
					상호명<input type="text" name="mTitle" id="mTitle" value="${editmat.matTitle}" placeholder="${editmat.matTitle}"/>	
				</div>
				<div class="6u 12u$(xsmall)">
					주소<input type="text" name="mAddr" id="mAddr" value="${editmat.matAddr}" placeholder="${editmat.matAddr}"/>
				</div>
				<div class="6u 12u$(xsmall)">
					시간<input type="text" name="mTime" id="mTime" value="${editmat.matTime}" placeholder="${editmat.matTime}"/>
				</div>
				<div class="6u 12u$(xsmall)">
					전화번호<input type="text" name="mNum" id="mNum" value="${editmat.matNum}" placeholder="${editmat.matNum}"/>
				</div>
				
				<div class="12u$">
					소개글<textarea name="mCont" id="mCont" placeholder="${editmat.matCont}" rows="6"></textarea>
					<!-- 소개글<input type="text" name="mCont" id="mCont" value="" style="height: 300px;" /> -->
				</div> --%>
				
				<!-- 파일업로 -->
				<div class="6u$ 12u$(xsmall)" id="file-group">
					이미지추가<input type="file" multiple="multiple" id="mImg" name="mImg" />
				</div>
				
				<!-- 미리보기 -->
				<div class="previewBox">
				<div id="preview"></div>
				</div>
				
				
				<div class="12u$">
					<ul class="actions">
					<li><input type="submit" value="수정하기" class="editbtn"/></li>
					<li><input type="reset" value="목록" onclick="javascript:goMatlist();"/></li>
					</ul>
				</div>
			</div>
		</form>		
	</div>

	</div>
	
	<script>

//파라미터로 페이지 번호 받기
function getParameterByName(name) {
name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 	
var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);	
	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
}

var matIdx = getParameterByName('matIdx'); 

var url = "'http://localhost:8080/setEdit";

$(document).ready(function(){        
	
	getEditMat();

	
	$('.editbtn').click(function(){
		
		var photoFiles = $('#mImg');
		
		var formData = new FormData();
		
		var files = photoFile[0].files;
		
		
		for(var i=0; i<files.length; i++){
			formData.append("mImg", $('#mImg')[i].files);
		}
		
		formData.append("mTitle", $('#mTitle').val()),
		formData.append("mAddr", $('#mAddr').val()),
		formData.append("mTime", $('#mTime').val()),
		formData.append("mNum", $('#mNum').val()),
		formData.append("mCont", $('#mCont').val());
		
		console.log(files);
		
		
		console.log(formData);

		
		$.ajax({
			url : 'https://www.withearthcomm.tk/community/matzip/setEdit'+matIdx,
			type : 'POST',
			data : formData,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false ,
			success : function (result){
			console.log('data result::'+result);
				
				if(result == 1){
					
					alert("게시물 수정이 완료되었습니다.");
					location.href="/matDetailView?matIdx="+matIdx;
					
				}	
			},
				error :
				alert("다시시도해주세요.")
			});
	}); 
	
	
	
	/* 맛집 수정 Form & Data*/	
	function getEditMat(){
		
		$.ajax({
			url:'https://www.withearthcomm.tk/community/matzip/getEdit?matIdx='+matIdx,
			type: "GET",
			dataType: "JSON",
			success : function(data){
				console.log(data);
				
				matIdx = data.matIdx;
				
				var html ="";
				
				html += '<div class="6u 12u$(xsmall)">'
				html += '<div class="imgpart">';
				html += '<img src="/community/fileupload/matzip/'+data.matImg+'" style="width:50%">';
				html += '</div>';
				html +='상호명<input type="text" name="mTitle" id="mTitle" value="'+data.matTitle+'"placeholder="'+data.matTitle+'"/>'	
				html +='</div>'
				html +='<div class="6u 12u$(xsmall)">'
				html +='주소<input type="text" name="mAddr" id="mAddr" value="'+data.matAddr+'" placeholder="'+data.matAddr+'"/>'
				html +='</div>'
				html +='<div class="6u 12u$(xsmall)">'
				html +='시간<input type="text" name="mTime" id="mTime" value="'+data.matTime+'" placeholder="'+data.matTime+'"/>'
				html +='</div>'
				html +='<div class="6u 12u$(xsmall)">'
				html +='전화번호<input type="text" name="mNum" id="mNum" value="'+data.matNum+'" placeholder="'+data.matNum+'"/>'
				html +='</div>'
			
				html +='<div class="12u$">'
				html +='소개글<textarea name="mCont" id="mCont" placeholder="'+data.matCont+'" rows="6"></textarea>'
				html +='</div>'
				
				console.log(html);
				$('#editInfo').append(html);
				
			},
			error : function(){
				alert("오류가 발생했습니다");
			}
		});
		
	}
	

	/* 맛집 목록이동 */
	function goMatlist(){
		location.href = "/community/matzip/matlist?p=1";
	}
	
	// image preview 기능 구현
    // input = file object[]
     function addPreview(input) {
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
                var file = input[0].files[fileIndex];
                var reader = new FileReader();
 
                reader.onload = function (img) {
                    //div id="preview" 내에 동적코드추가.
                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                    $("#preview").append(
                        "<img src=\"" + img.target.result + "\"\/>"
                    );
                };
                
                reader.readAsDataURL(file);
            }
        } else alert('invalid file input');
    }  

	

});
	
	
</script>
	
	
		
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
</body>
</html>