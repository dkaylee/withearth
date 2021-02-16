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
</style>

</head>

<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section id="three" class="wrapper">
	<div class="inner">
			<header class="align-center">
				<h2>새로운 맛집 추가</h2>
			</header>
		
	<div class="row uniform">
		<form method="post" enctype="multipart/form-data">
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
				
				
				<div class="6u$ 12u$(xsmall)" id="file-group">
				이미지첨부 <input type="file" multiple="multiple" id="mfile" name="mfile" />
				<a href='#this' onclick="file-delete">삭제</a>
				<a href="#this" onclick="addFile()">파일추가</a>
				</div>
				<div class="uploadResult">
				<ul></ul>
				</div>
				
				<div class="12u$">
					<ul class="actions">
					<li><input type="submit" value="등록하기" /></li>
					<li><input type="reset" value="목록" class="alt" /></li>
					</ul>
				</div>
				<!-- <div class="3u$ 12u$(small)">
					<input type="submit" value="등록하기"><input type="button" value="목록"><input type="button" value="글쓰기">
				</div> -->
			</div>
		</form>
	</div>
				
	<script>
	
	var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr){
			var str="";
			$(uploadResultArr).each(function(i,obj){
				str += "<li>"+obj.fileName+"</li>";
			});
			uploadResult.append(str);
		}
	
	
   	 $(document).ready(function() {
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    })
 
    function addFile() {
        var str = "<div class='6u$ 12u$(xsmall)' id='file-group'>이미지첨부<input type='file' multiple='multiple' id='mfile' name='mfile' /><a href='#this' name='file-delete'>삭제</a></div>";
        $("#file-list").append(str);
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    }
 
    function deleteFile(obj) {
        obj.parent().remove();
    }
	</script>

	</div>
		
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
</body>
</html>