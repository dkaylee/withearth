<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/mycomm.css"/>" />
<title>Insert title here</title>
</head>
<body class="subpage">
   <!-- <body id="page-top"> -->
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
		<div id="wrap">
		<table class="table">
		<colgroup>
		<col style="width:70%;">
		<col style="width:15%;">
		<col style="width:15%;">
		</colgroup>
		<tr class="table">
			<td class="table">${view.title}</td>
			<td class="table" width="150">글쓴이 : ${view.writer} </td>
			<td class="table" width="150">글번호 : ${view.idx}</td>
		</tr>	
		<tr class="table">
			<td colspan="3" class="table">${view.contents}</td>
		</tr>	
		</table>
 <!--그저 데이터 보내기 위해 존재할 뿐 -->      
<form method="post" enctype="multipart/form-data" name="submitok">
  <input type="hidden" id="useridx" name="useridx" value='${view.useridx}' readonly="readonly">
  <input type="hidden" id="username" name="username" value='${view.writer}' readonly="readonly">
  <input type="hidden" id="bno" name="bno" value='${view.idx}' readonly="readonly">
  <input type="hidden" id="date" name="date" value='${view.inserttime}' readonly="readonly">
  <input type="hidden" aria-describedby="basic-addon1" id="subject" name="subject" value='${view.title}' readonly="readonly">
  <textarea style= display:none id="contents" name="contents" readonly="readonly">${view.contents}</textarea>
</form>
	<div id="two">	
<div id="debt">
<button type="button" class="btn btn-secondary" onClick="editcheck()">수정</button>
<button type="button" class="btn btn-secondary" onClick="subcheck()">삭제</button>
</div>
</div>
	</div>
	 <div id="footer1">
	 <%@ include file="/WEB-INF/views/include/footer.jsp"%>
	 </div>

</body>
<script>
function subcheck(){
	var yourid = ${view.useridx};
	var myid = ${loginInfo.idx};
	if(yourid==myid){
	if(confirm("정말 삭제하시겠습니까?")==true){
		location.href='/member/board/delete?bno=${view.idx}'
	} else {
		return ;
	}
	} else {
		alert("본인이 작성한 글만 삭제할 수 있습니다.")
	}
	
}

function editcheck(){
	var yourid = ${view.useridx};
	var myid = ${loginInfo.idx};
	if(yourid==myid){
		location.href='/member/board/modify?bno=${view.idx}'
	} else {
		alert("본인이 작성한 글만 수정할 수 있습니다.")
	}
	
}


</script>
</html>