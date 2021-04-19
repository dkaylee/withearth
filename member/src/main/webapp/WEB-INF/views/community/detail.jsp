<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>
<body>

<form method="post" enctype="multipart/form-data" name="submitok">
<div class="input-group mb-3">
  <span class="input-group-text">아이디</span>
  <input type="text" class="form-control "aria-label="Username" id="username" name="username" value='${view.writer}' readonly="readonly">
  <span class="input-group-text">글번호</span>
  <input type="text" class="form-control" aria-label="bno" id="bno" name="bno" value='${view.idx}' readonly="readonly">
  <span class="input-group-text">작성일자</span>
  <input type="text" class="form-control" aria-label="date" id="date" name="date" value='${view.inserttime}' readonly="readonly">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  aria-label="subject" aria-describedby="basic-addon1" id="subject" name="subject" value='${view.title}' readonly="readonly">
</div>
<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" aria-label="With textarea" id="contents" name="contents" readonly="readonly">${view.contents}</textarea>
</div>
</form>
<button type="button" class="btn btn-light" onClick="location.href='/board/list'">뒤로가기</button>
<button type="button" class="btn btn-light" onClick="location.href='/board/modify?bno=${view.idx}'">수정</button>
<button type="button" class="btn btn-light" onClick="subcheck()">삭제</button>

</body>
<script>
function subcheck(){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='/board/delete?bno=${view.idx}'
	} else {
		return ;
	}
	
}
</script>
</html>