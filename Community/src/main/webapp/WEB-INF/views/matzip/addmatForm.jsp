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

#previewBox {
	width: 900px;
	height: 350px;
}
</style>

<script>
	/* 맛집 목록이동 */
	function goMatlist(){
		location.href = "/matzip/matlist";
	}
	/* 맛집추가 및 파일업로드 */
	 $(document).ready(function() {
		 
		        // 태그에 onchange를 부여한다.
		        $('#mImg').change(function() {
		                addPreview($(this)); //preview form 추가하기
		        });
		        
		        $('#matzipForm').submit(function(){
					
					var photoFiles = $('#matImg');
					
					var files = photoFile[0],files;
					
					console.log(files);
					
					var formData = new FormData();
					
					formData.append("matTitle", $('#mTitle').val()),
					formData.append("matAddr", $('#mAddr').val()),
					formData.append("matTime", $('#mTime').val()),
					formData.append("matNum", $('#mNum').val()),
					formData.append("matCont", $('#mCont').val());
					
					for(var i=0; i<files.length; i++){
						formData.append("matImg", $('mImg').val());
					}
					
					console.log(formData);

					
					$.ajax({
						url : '/matzip/addmatzip',
						type : 'POST',
						data : formData,
						processData : false,
						contentType : false,
						cache : false ,
						success : function (data){
							var result = data.result;
							if(result != null){		
								if(result == "1"){
									alert("업체등록을 완료하였습니다.");
									
									goMatlist();
									
									}
								}
							},
							error :
								alert("업체등록을 다시해주세요.")
						});
		    	}); 
		   }); 
	
			
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
		        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다. 
		    }  
	
</script>



</head>

<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section id="three" class="wrapper">
	<div class="inner">
			<header class="align-center">
				<h2>새로운 맛집 추가</h2>
				<hr class="major"/>
			</header>
	
	<!-- 맛집추가 폼 -->	
	<div class="row uniform">
		<form id="matzipForm" method="post" enctype="multipart/form-data">
			<div class="row uniform">
				<div class="6u 12u$(xsmall)">
					상호명<input type="text" name="mTitle" id="mTitle" value=""/>
				</div>
				
				<div class="6u 12u$(xsmall)">
					주소<input type="text" name="mAddr" id="mAddr" value=""/>
				</div>
				
				<div class="6u 12u$(xsmall)">
					시간<input type="text" name="mTime" id="mTime" value=""/>
				</div>
				
				<div class="6u 12u$(xsmall)">
					전화번호<input type="text" name="mNum" id="mNum" value=""/>
				</div>
				
				<div class="12u$">
					소개글<textarea name="mCont" id="mCont" placeholder="Enter your message" rows="6"></textarea>
					<!-- 소개글<input type="text" name="mCont" id="mCont" value="" style="height: 300px;" /> -->
				</div>
				
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
					<li><input type="submit" value="등록하기" /></li>
					<li><input type="reset" value="목록" onclick="javascript:goMatlist();"/></li>
					</ul>
				</div>
			</div>
		</form>		
	</div>
</div>
		
</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
	<script>
		
	/* $(document).ready(function(){	
		$('#matzipForm').submit(function(){
			
			var photoFiles = $('#matImg');
			
			var files = photoFile[0],files;
			
			console.log(files);
			
			var formData = new FormData();
			formData.append("matTitle", $('#mTitle').val()),
			formData.append("matAddr", $('mAddr').val()),
			formData.append("matTime", $('mTime').val()),
			formData.append("matNum", $('mNum').val()),
			formData.append("matCont", $('mCont').val());
			
			for(var i=0; i<files.length; i++){
				formData.append("matImg", $('mImg').val());
			}
			
			console.log(formData);

			
			$.ajax({
				url : '/matzip/addmat',
				type : 'POST',
				data : formData,
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false ,
				success : function (data){
						console.log(data);
					}
				});
		}); */
		
	
			
		</script>
	
	
	
</body>
</html>