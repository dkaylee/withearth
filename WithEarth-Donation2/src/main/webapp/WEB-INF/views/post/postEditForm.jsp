<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>WithEarth</title>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  -->
<script src="https://code.jquery.com/jquery-3.1.0.min.js?"></script>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
.title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.p-images {
	float: left;
}

.notice{
  font-size: 13px;
  color : #D91828;
  font-weight: bold;
}
</style>
</head>

<body id="page-top">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="banner"></section>

<%-- action="<c:url value="/rest/user/post/edit"/>" --%>
	<form method="post" enctype="multipart/form-data" id="uploadForm" >
		<h3 class="title">게시글 수정</h3>
		<br>
		<div class="row uniform" id="editForm">


			<!-- Break -->
			<div class="12u$">
				<ul class="actions">
					<li><input type="submit" value="Send Message" /></li>
					<li><a href="javascript:" onclick="javascript:actionForm();">업로드</a></li>
					<li><input type="reset" id="test" value="Reset" class="alt" /></li>
				</ul>
			</div>
		</div>
	</form>

	<script>
		console.log('테스트 1');
		
		var oldImage_list = [];
		
		var deleteImage_list = [];

		$(document).ready(function() {
				console.log('테스트 2');

							// 회원idx 받기
							function getParameterByName(name) {
								name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
								var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
								return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
							}

							var donaIdx = getParameterByName('idx');

							$.ajax({

										url : "http://localhost:8080/dona/rest/user/post/detail?idx="+ donaIdx,
										type : 'GET',
										success : function(data) {

											var html = '<div class="6u 12u$(xsmall)">';
											html += '<input type="hidden" name="idx" id="idx" value="'+data.idx+'"/>';
											html += '<input type="hidden" name="donaIdx" value="'+data.donaIdx+'">';								
											html += '<input type="text" name="postTitle" id="postTitle" placeholder="제목" value="'+data.postTitle+'" />';
											html += '<h4 class="notice">이미지 클릭 시 삭제 가능</h4>';
											html += '<div class="oldImages"></div>';
											html += '<input multiple="multiple" type="file" id="postImage">';
											html += '</div>';

											html += '<div class="6u 12u$(xsmall)">';
											html += '<div class="select-wrapper">';
											html += '<select name="category" id="category">';
											html += '<option value="'+data.category+'">'+ data.category+ ' </option>';
											html += '<option value="">- Category -</option>';
											html += '<option value="디지털/가전">디지털/가전</option>';
											html += '<option value="가구/인테리어">가구/인테리어</option>';
											html += '<option value="유아동/유아도서">유아동/유아도서</option>';
											html += '<option value="생활/가공식품">생활/가공식품</option>';
											html += '<option value="스포츠/레저">스포츠/레저</option>';
											html += '<option value="의류/잡화">의류/잡화</option>';
											html += '<option value="도서/티켓/음반">도서/티켓/음반</option>';
											html += '<option value="기타 물품">기타 물품</option>';
											html += '</select>';
											html += '</div>';
											html += '</div>';
											html += '<div class="12u$">';
											html += '<textarea name="postContent" id="postContent" placeholder="Enter your message" rows="6">'+ data.postContent+ '</textarea>';
											html += '</div>';

											$('#editForm').prepend(html);
										},
										error : function(e) {
											console.log(e);
										}

									});

												
							
							$.ajax({
										url : "http://localhost:8080/dona/rest/user/post/detail/image?idx="+ donaIdx,
										type : 'GET',
										success : function(data) {																					

											$.each(data,function(index,item) {

																var html2 = '<div class="p-images">';
																//html2 += '<input type="hidden" name="oldPostImage" id="oldPostImage" value="'+item.fileName+'">';
															  html2 += '<a href="javascript:void(0);" onclick=\"deleteOldImageAction('+ index+ ');\" id="img_id_'+ index+ '" class="img_event" >';
																html2 += '<img src="<c:url value="/fileupload/post/'+item.fileName+'"/>" style=\"width:100px; height:100px;\" id="post-images" alt="postImages"></a>';
																html2 += '</div>';
																
																oldImage_list.push(item.fileName);
																
																$('.oldImages').append(html2);
															})

										},
										error : function(e) {
											console.log(e);
										}

									});
							
							
						});
	</script>

</body>
<script type="text/javascript">

	console.log('테스트 3');
	
	var image_list = []; // 새롭게 추가,삭제한 파일들의 배열
	
		
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
	
	// 뷰에서 선택한 이미지를 삭제 (기존 이미지)
	function deleteOldImageAction(index) {
		console.log('테스트 4-2');
		
		console.log("index :" + index);
		
		deleteImage_list.push(oldImage_list[index]);
		console.log(deleteImage_list);
		
		var target = $('#img_id_' + index);
		console.log(target);

		$(target).remove();
			
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
		for(var i=0; i<deleteImage_list.length; i++){
			formData.append("deleteImage", deleteImage_list)
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
				url : 'http://localhost:8080/dona/rest/user/post/edit',
				type : 'POST',
				data : formData,
				processData: false,
				contentType: false,
				success : function(data){
		 		 console.log(data);		 		
         if(data==1){
        	 alert('수정이 완료되었습니다.');
        	 history.back();
         }  
				},error: function(e){
					console.log(e);
				}
			   });				
				
	};
	
	
	window.onload = function() {		
		console.log('테스트 5');
				
		$(document).ready(function() {
			console.log('테스트 6');
			
			// 이미지 추가 시 메서드 호출
			$('#postImage').on("change", handleImgFileSelect);
			
		});	
		
					
		// 이미지 추가 시 미리보기 기능

		function handleImgFileSelect(e) {
			console.log('테스트 7');

			var files = e.target.files;
			//console.log(files);

			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
						if (!f.type.match("image.*")) {
							alert('이미지 파일만 가능합니다.')
							return;
						}

						image_list.push(f);
             
						var reader = new FileReader();
						reader.onload = function(e) {

							var index = 0;

							var img_html = '<div class="p-images">';
							img_html += '<a href="javascript:void(0);" onclick=\"deleteNewImageAction('+ index+ ');\" id="img_id_'+ index+ '" class="img_event" >';
							img_html += '<img src="'+e.target.result+'" data-file="'+f.name+'" style="width:100px; height:100px;"></a>';
							img_html += '</div>';

							index++;

							$('.oldImages').append(img_html);

						}
						reader.readAsDataURL(f);
												
					});
					
		};		
	
						

	};
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>


</html>
