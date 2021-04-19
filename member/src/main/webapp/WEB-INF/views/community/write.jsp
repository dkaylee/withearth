<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</head>
<body>

<form method="post" enctype="multipart/form-data" name="submitok">
<div class="input-group mb-3">
  <span class="input-group-text">아이디</span>
  <input type="text" class="form-control" placeholder="Username" aria-label="Username" id="username" name="username">
  <span class="input-group-text">비밀번호</span>
  <input type="text" class="form-control" placeholder="password" aria-label="password" id="password" name="password">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control" placeholder="subject" aria-label="subject" aria-describedby="basic-addon1" id="subject" name="subject">
</div>
<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" aria-label="With textarea" id="contents" name="contents"></textarea>
</div>
</form>
<button type="submit" class="btn btn-light" id="submit" onclick="subcheck()">제출</button>
<button type="button" class="btn btn-light">초기화</button>
</body>
<script>

function subcheck(){
	if(confirm("등록하시겠습니까?")==true){
		document.submitok.submit();
	} else {
		return ;
	}
	
}

</script>
</html>