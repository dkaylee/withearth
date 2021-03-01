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
<script>
	
	/* 맛집 수정 */
	
	var matTitle = $("#mTitle").val();
	var matAddr = $("#mAddr").val();
	var matTime = $("#mTime").val();
	var matNum = $("#mNum").val();
	var matCont = $("#mCont").val();
	var matImg = photoFile[0],files[0];
	
	if(matTitle == ""){
		alert("제목을 입력해주세요.");
		$("#mTitle").focus();
		return;
	}
	if(matAddr == ""){
		alert("주소를 입력해주세요.");
		$("#mAddr").focus();
		return;
	}
	if(matTime == ""){
		alert("영업시간을 입력해주세요.");
		$("#mTime").focus();
		return;
	}
	if(matNum == ""){
		alert("연락처를 입력해주세요.");
		$("#mNum").focus();
		return;
	}
	if(matCont == ""){
		alert("내용을 입력해주세요.");
		$("#mCont").focus();
		return;
	}
	
	var editmsg = confirm("맛집정보를 수정하시겠습니까?");
	
	if(editmsg) {
		$.ajax({
			url : "http://localhost:8080/community/matzip/editmat?matIdx=${matzip.matIdx}",
			data : $("#editForm").serialize(),
			dataType:"JSON",
			cache : false,
			async : true,
			type : "POST",
			success : function(obj) {
				console.log(obj);
			},
			error : function(xhr, status, error){}
		
		});
	}
	
	function updateMatCall(obj){
		if(obj != null){
			var result = obj.result;
			
			if(result == "SUCCESS"){
				alert("맛집정보 수정을 성공하였습니다.");
				goMatlist();
			} else{
				alert("게시글 수정 실패");
				return;
			}
		}
	}

</script>


</head>

<body class="subpage">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section id="three" class="wrapper">
	<div class="inner">
			<header class="align-center">
				<h2>맛집 정보 수정하기</h2>
			</header>
	
	<!-- 글 수 폼 -->	
	<div class="row uniform">
		<form method="post" enctype="multipart/form-data" id="editForm">
			<div class="row uniform">
				<div class="6u 12u$(xsmall)">
					상호명<input type="text" name="mTitle" id="mTitle" value="${editmat.matTitle}" placeholder="${editmat.matTitle}"/>
					${editmat.matTitle}
				</div>
				<div class="6u 12u$(xsmall)">
					주소<input type="text" name="mAddr" id="mAddr" value="${editmat.matAddr}" placeholder="${editmat.matAddr}"/>
					${editmat.matAddr}
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
				</div>
				
				<!-- 파일업로 -->
				<div class="6u$ 12u$(xsmall)" id="file-group">
				이미지 업로드<input type="file" multiple="multiple" id="mImg" name="mImg" />
					<a href="javaScript:" class="my_button" onclick="submitAction();">업로드</a>
				<!-- 미리보기 -->
				<div class="uploadResult">
					<img id ="img"/>
				</div>
					<a href="#this" onclick="filDelete()">삭제</a>
					<a href="#this" onclick="addFile()">파일추가</a>
				</div>
				
				<div class="12u$">
					<ul class="actions">
					<li><input type="button" value="수정하기" id="editmsg" /></li>
					<li><input type="reset" value="목록" onclick="javascript:goMatlist();" /></li>
					</ul>
				</div>
				<!-- <div class="3u$ 12u$(small)">
					<input type="submit" value="등록하기"><input type="button" value="목록"><input type="button" value="글쓰기">
				</div> -->
			</div>
		</form>
	</div>

	</div>
		
	</section>
	
	<script>
	
	/* 맛집 목록이동 */
	function goMatlist(){
		location.href = "/community/matzip/matlist";
	}
	</script>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	
</body>
</html>