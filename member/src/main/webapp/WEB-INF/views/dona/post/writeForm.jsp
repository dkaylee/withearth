<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>WithEarth</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js?"></script>
<link rel="stylesheet" href="<c:url value="/css/dona/write.css"/>" />
<style>
</style>
</head>

<body id="page-top">

<%@ include file="/WEB-INF/views/include/header.jsp"%>

<section id="banner"></section>
 <div class="writeForm">
	<form method="post" enctype="multipart/form-data" id="uploadForm">
		<h3 class="title">무료나눔 글쓰기</h3>
		<br>
		<div class="row uniform">
			<div class="6u 12u$(xsmall)">
				<input type="hidden" name="idx" id="idx"  value="${loginInfo.idx}" /> 
				<input type="text" name="postTitle" id="postTitle" placeholder="제목" /> 		
				<div class="imageList"></div>		
				<div class="uploadFileBtn" onclick="document.all.file.click()">
				<img src="<c:url value="/img/dona/photo2.png"/>" width="50px" id="galleryIcon">
				<input multiple="multiple" type="file" id="postImage" name="file" style="display:none"/>				
				</div>
			</div>
			<!-- Break -->
			<div class="6u 12u$(xsmall)">
				<div class="select-wrapper">
					<select name="category" id="category">
						<option value="">- Category -</option>
						<option value="디지털/가전">디지털/가전</option>
						<option value="가구/인테리어">가구/인테리어</option>
						<option value="유아동/유아도서">유아동/유아도서</option>
						<option value="생활/가공식품">생활/가공식품</option>
						<option value="스포츠/레저">스포츠/레저</option>
						<option value="의류/잡화">의류/잡화</option>
						<option value="도서/티켓/음반">도서/티켓/음반</option>
						<option value="기타 물품">기타 물품</option>
					</select>
				</div>
			</div>
			<div class="12u$">
				<textarea name="postContent" id="postContent"
					placeholder="Enter your message" rows="6"></textarea>
			</div>
			<!-- Break -->
			<div class="12u$">
				<ul class="actions">
					<li><input type="button" value="업로드" onclick="javascript:actionForm(); history.go(-1);" /></li> 
					<li><input type="reset" onClick="window.location.reload()" value="취소" class="alt" /></li>
				</ul>
			</div>
		</div>
	</form>
</div>
<script>
	
	var image_list = [];
	
	 // 뷰에서 선택한 이미지를 삭제 (추가한 이미지)
	function deleteNewImageAction(index) {
		console.log('테스트 4');

		console.log("index :" + index);
		image_list.splice(index, 1);

		var target = $('#img_id_' + index);
		console.log(target);

		$(target).remove();
		console.log(image_list);

	}; 
	
	//폼 데이터 전송 메서드
	function actionForm(){		
		
		//var uploadForm = document.getElementById("#uploadForm");
		console.log(image_list);
		var uploadForm = $('#uploadForm')[0];
			
		var formData = new FormData(uploadForm);
		
		for(var i=0; i<image_list.length; i++){			
			formData.append("postImage", image_list[i]);
								
		}				
		   // 폼 데이터 확인
		  for (var key of formData.keys()) {
			  console.log(key);
			}
			for (var value of formData.values()) {
			  console.log(value);
			}			
			
			 //ajax로 폼데이터 전송
		 	 $.ajax({
				url : 'https://www.withearthdona.tk/dona/rest/user/post/upload',
				type : 'POST',
				data : formData,
				processData: false,
				contentType: false,
				success : function(data){
					
					console.log(data);
		 	   	//window.location.href="http://localhost:8080/dona/main/list";
					
				},error: function(e){
					console.log(e);
				}
			   });				
				
	};
	
		window.onload = function() {

			$(document).ready(function() {

				$('#postImage').on("change", handleImgFileSelect);
				//$('.uploadFileBtn').on("click", handleImgFileSelect)
				
				/* $('.uploadFileBtn').click(function(){
					  $(this).addClass('display_none');
				}); */

			});


			function handleImgFileSelect(e) {
				console.log('테스트 7');

				var files = e.target.files;
				//console.log(files);

				var filesArr = Array.prototype.slice.call(files);
							
				var index = 0;

				filesArr.forEach(function(f) {
							if (!f.type.match("image.*")) {
								alert('이미지 파일만 가능합니다.')
								return;
							}

							image_list.push(f);
	            console.log(image_list); 
							
							var reader = new FileReader();
							reader.onload = function(e) {
								
								var img_html = '<a href="javascript:void(0);" onclick=\"deleteNewImageAction('+ index + ');\" id="img_id_'+ index+ '" class="img_event" >';								
								img_html += '<img src="'+e.target.result+'" data-file="'+f.name+'" style="width:100px; height:100px;">';
                                img_html += '<img src="<c:url value="/img/dona/xbtn.jpg"/>" width="15px;" id="xBtn"></a>';
								index++;

								$('.imageList').append(img_html);
								//var target = $('.imageList');
								//$('.uploadFileBtn').prepend(target);

							}
							reader.readAsDataURL(f);
													
						});
						
			};		
			
		}
	</script>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</html>
