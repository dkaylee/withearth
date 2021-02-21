<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>WithEarth</title>
		<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<style>
	
	#banner{
	  margin-bottom : -200px;
	}
	
	#subTitle{
	 font-weight : bold;
	 color : #737373;
	
	}
	
	.article{	
	 width : 250px;
	 height : 320px;	 
	 padding : 15px;
	 
	 text-align : center;
	 margin-bottom : 30px;
	/*  border : 5px solid #EEE; */
	 border-radius: 20px;
	}
	
	.article-img{		
	 float : left;
	 width : 200px;
	 height :200px;
	}
	
	.img{
	 margin-left : 4px;
	 width : 200px;
	 height :200px;
	 border-radius: 10px;
	 border : 1px solid #EEE;
	}
	
	.article-title{
	  width : 200px;	  	 	
	  white-space: nowrap;  
	  overflow: hidden;
	  text-overflow: ellipsis;
	  
	  text-align: left;
	  font-size : 20px;
	  color : #02060D;
	}
	
	.article-heart{
	text-align: left;
	font-size : 15px;
	
	}
	.title{
	  font-size : 50px;
	  font-weight: bold;	  
	 color : #404040;
	}	
	.pBtn{
	  float : right;
	}
	.searchForm{
	 overflow : hidden;
	 text-align: left;
	}
	
	#searchType{
	 width : 120px;
	}
	
	.search-unit{
	  float : left;
	}
	
	
	
	
	</style>	
    </head>
    
    <body id="page-top">
      
       <%@ include file="/WEB-INF/views/include/header.jsp"%>
       
 			<section id="banner">
			</section>
			
		<section id="three" class="wrapper special">
				<div class="inner">
					<header class="align-center">
						<div class="title">나눔장터</div>
						<h3 id="subTitle"> 환경을 위해 나눔에 동참해보세요! </h3>
					</header>
			    <form class="searchForm" action="<c:url value="/rest/user/post/list"/>">
			    <div class="search-unit">
					<select id="searchType" name="searchType">
					<option value="">검색타입  ⌵ </option>
						<option value="idx">아이디</option>
						<option value="postTitle">제목</option>
						<option value="both">아이디+제목</option>
					</select>
					</div>
					<div class="search-unit">
					<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요."> 
					</div>
					<div class="search-unit">
					 <input type="submit" id="searchBtn" value="검색">
					 </div>
				</form>
				 	<div class="flex flex-2" id="wrapContent" >				
					   	
					   	
							   						
				  </div>						   	
			    <div class="paging">
				     
			    </div>
	         
				   </div>				
		
			</section>			
	
						
   <a href="<c:url value="/main/post/mypost?idx=1"/>"><input type="button" class="pBtn" id="updateBtn" value="내 글 보기"></a> 
	<a href="<c:url value="/main/post/upload"/>"><input type="button" class="pBtn" value="글쓰기"></a>	
  
  
   
   	<script>
    // 페이지 번호 받기
 	function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
  }

    
    var p = getParameterByName('p');
    console.log(p); 
  	
   var searchType = '<c:out value="${param.searchType}"/>';
    
   var keyword = '<c:out value="${param.keyword}"/>';

  
      
		$(document).ready(function() {	
									
				$.ajax({
					  url : 'http://localhost:8080/dona/rest/user/post/list?p='+ 1 +'&searchType='+searchType+'&keyword='+ keyword,
					  type : 'GET',
					  async : false,
					  success : function(data){				
						console.log(data);	
						 						 						 
						var list = $(data.postList);
						console.log(list);
						
						$.each(list, function(index, item){
																															
							  var html =	'<div class="article" onClick="location.href=\'<c:url value="/main/post/detail?idx='+item.donaIdx+'"/>\'">';
								html += '<input type="hidden" value="'+item.donaIdx+'">';
							  html += '<div class="article-img">';
								html += '<img alt="thumbnail" class="img" src="<c:url value="/fileupload/post/s_'+item.files.fileName+'"/>">';	
								html += '</div>';
								html += '<div class="article-content">';
								html += '<div class="article-title">';
								html += item.postTitle+'</div>';
								html += '<div class="article-heart">';							
								html += '관심 '+item.heartCnt+'</div>';
								html += '</div></div>'			
																
								$('#wrapContent').append(html);		 
																																						
						 });
												
						   // 페이징 처리
							 if (data.totalPostCount>0){
								 console.log('totalPageCount :' + data.totalPageCount);
								for(var i=1; i <= data.totalPageCount; i++){				
									var html2 =' [ <a href="<c:url value="/rest/user/post/list"/>?p='+i+'&searchType='+searchType+'&keyword='+keyword+'">'+i+'</a> ] ';				
									 //var html2 =' [ <a href="javascript:void(0);" onclick="page('+i+');">'+i+'</a> ] ';	
									 $('.paging').append(html2);
								}										 
							 };								 																							    	
						  },error : function(request, status, error) {
								console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
							}
				});
				
				
				
				
				});
				
				
		
   </script>	
    </body>
    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>