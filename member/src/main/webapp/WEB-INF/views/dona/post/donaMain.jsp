<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" charset="utf-8"/>
<title>WithEarth</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="<c:url value="/css/dona/main.css?ver=4"/>"/>
<link href="<c:url value="/css/main.css?ver=1"/>" rel="stylesheet">
<style>	
</style>	
</head>
<body id="page-top">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       
    <section id="banner"></section>
    
    <section id="two" class="wrapper style1 special">
    		<header class="align-center">
				<div class="title">나눔장터</div><br>
				<h3 id="subTitle"> 환경을 위해 나눔에 동참해보세요! </h3>
			</header>
    </section>
			
		<section id="three" class="wrapper special">
				<div class="inner">		
			    <form class="searchForm" action="<c:url value="/rest/user/post/list"/>">
			      <div class="search-unit">
			      	  <div class="search-unit">
					    <input type="button" id="searchBtn" value="검색">
					  </div>
					    <div class="search-unit">
					    <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요."> 
					  </div>
					  <select id="searchType" name="searchType">
					    <option value="">검색타입  ⌵ </option>
						  <option value="idx">아이디</option>
						  <option value="postTitle">제목</option>
						  <option value="both">아이디+제목</option>
					  </select>
				  	</div>								
				 </form>
				 
				 	<div class="flex flex-2" id="wrapContent" ></div>	
				 	<div class="wrap-btn">
				 	<a href="<c:url value="/dona/main/post/upload"/>" class="pBtn" id="writeBtn"> 글쓰기</a> 
				 	<a href="<c:url value="/dona/main/post/upload"/>"><img src="<c:url value="/img/dona/write.png"/>" class="pBtn" width="27px;"></a>	
				  	</div>			
				  	   	
			    <div class="paging">
				     	<ul class="pagination"></ul>						 
			    </div>
	         
		  </div>			
		  	
	    <div class="notice"></div>		
	    
	    <div class="floating">	
      </div>	
	</section>			

  
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>  
<script>

  // 파라미터로 페이지 번호 받기
 	function getParameterByName(name) {
	  
	  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 	
	  
	  var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);	
	    
	  return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
  }
    
    var p = getParameterByName('p');
    console.log(p); 
    
    var loginUser = '<c:out value="${loginInfo.idx}"/>';
    
 
     // 채팅 알림
     // 웹소켓을 지정한 url로 연결한다.
		 var sock = new SockJS("<c:url value="/chat"/>");
					
		 //데이터가 나한테 전달되었을 때 자동으로 실행되는 function
		 sock.onmessage = onMessage;

		 //데이터를 끊고싶을때 실행하는 메소드
		 //	sock.onclose = onClose;
				
		 // 대화를 요청한 상대에게서 받은 메시지				
		 function onMessage(evt) { 
			console.log(evt.data);
			var data = evt.data; // 전달 받은 데이터				
					
			msgData = JSON.parse(data);
			
			if(msgData.to==loginUser){
				
			$('.notice').css('display', 'block');					  		  
					
			var html = '<h4 class="noticeMsg"><img src="<c:url value="/img/dona/notice.png"/>" width="28px">';
				html += msgData.userIdx+'님으로부터 <br> 메세지가 도착했습니다!</h4>';
				html += '<input type="button" onclick="window.location.reload()" class="noticeBtn" id="laterBtn" value="나중에">';
				html += '<input type="button" onclick="goChatRoom(); noticeNone();" class="noticeBtn" value="보기">';				    			 
					  		    
				$('.notice').append(html);
			}	
			
		 }
		 
		  function noticeNone(){
			  
			  $('.notice').empty();
				$('.notice').css('display', 'none');
			  
		  }
    
		// 채팅룸으로 이동 (새 창 띄워줌)						
	  function goChatRoom(){
		child2 = window.open('<c:url value="/post/chat?donaIdx='+msgData.donaIdx+'&uid='+msgData.to+'&to='+msgData.userIdx+'&rid='+msgData.roomIdx+'"/>',"child2","width=330,height=600");
		}	
			
		// 연결 종료
		function onClose(evt) {
		console.log(evt);		
		}
			
		// 검색 시 페이지 번호를 받아서 이동하는 메서드		
    function goPage(i){
    	
    	$('#wrapContent').empty();
		  $('.paging').empty();
		
		var searchType = $('#searchType').val();
		var keyword = $('#keyword').val();
		  
	 
		$.ajax({
			url : 'http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com/dona/rest/user/post/list/search',
			type : 'GET',
			data : 'p='+ i + '&searchType=' +searchType + '&keyword='+keyword,
			success : function(data){
				console.log(data);
				var list = $(data.postList);
				console.log(list);
				
				$.each(list, function(index, item){
																													
					  var html =	'<div class="article" onClick="location.href=\'<c:url value="/dona/main/post/detail?idx='+item.donaIdx+'"/>\'">';
						html += '<input type="hidden" value="'+item.donaIdx+'">';
					    html += '<div class="article-img">';
						html += '<img alt="thumbnail" class="img" src="http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com/dona/fileupload/post/s_'+item.files.fileName+'">';			
						html += '</div>';
						html += '<div class="article-content">';
						html += '<div class="article-title">';
						html += item.postTitle+'</div>';
						html += '<div class="article-heart">';							z
						html += '관심 '+item.heartCnt+'</div>';
						html += '</div></div>'			
														
						$('#wrapContent').append(html);		 
																																				
				 });
										
				   // 페이징 처리
					 if (data.totalPostCount>0){
						 
						 var pHtml = '<ul class="pagination"></ul>';
						 $('.paging').append(pHtml);
						 
						 console.log('totalPageCount :' + data.totalPageCount);
						for(var i=1; i <= data.totalPageCount; i++){				
								var html2 = '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="javascript:goPage('+i+');">'+i+'</a></li>';							
								$('.pagination').append(html2);
						}					
					 };	
			}, error : function(e){
				console.log(e);
			}
		});
    }
     
			 
	$(document).ready(function() {	
		
			// 처음 리스트 로딩 시 불러올 데이터
				$.ajax({
					  url : 'http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com/dona/rest/user/post/list?p=' + p,
					  type : 'GET',
					  async : false,
					  success : function(data){				
						console.log(data);	
						 						 						  
						var list = $(data.postList);
						console.log(list);
						
						$.each(list, function(index, item){
																														
							  var html =	'<div class="article" onClick="location.href=\'<c:url value="/dona/main/post/detail?idx='+item.donaIdx+'"/>\'">';
								html += '<input type="hidden" value="'+item.donaIdx+'">';
							  html += '<div class="article-img">';
								//html += '<img alt="thumbnail" class="img" src="<c:url value="/fileupload/post/s_'+item.files.fileName+'"/>">';	
								html += '<img alt="thumbnail" class="img" src="http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com/dona/fileupload/post/s_'+item.files.fileName+'">';	
								html += '</div>';
								html += '<div class="article-content">';
								html += '<div class="article-title">';
								html += item.postTitle+'</div>';
								html += '<div class="article-heart">';							
								html += '관심 '+item.heartCnt+'</div>';
								//html += '</div>${cookie.JSESSIONID.value}</div>'			
																
								$('#wrapContent').append(html);		 
																																						
						 });
												
						   // 페이징 처리
							 if (data.totalPostCount>0){
								 console.log('totalPageCount :' + data.totalPageCount);
								 							
								for(var i=1; i <= data.totalPageCount; i++){	
								  	var html2 = '<li class="page-item"><a class="page-link" href="<c:url value="/dona/main/list"/>?p='+i+'">'+i+'</a></li>';
								  	$('.pagination').append(html2);
								}												 
							 };								 																							    	
						  },error : function(request, status, error) {
								console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
							}
				});
				
				// 검색 시 불러올 데이터
				$('#searchBtn').click(function(){
					
					$('#wrapContent').empty();
					$('.paging').empty();
					
					var searchType = $('#searchType').val();
					var keyword = $('#keyword').val();
					console.log(searchType + ':' + keyword);
					
					$.ajax({
						url : 'http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com/dona/rest/user/post/list/search',
						type : 'GET',
						data : 'p='+ p + '&searchType=' +searchType + '&keyword='+keyword,
						success : function(data){
							console.log(data);
							var list = $(data.postList);
							console.log(list);
							
							$.each(list, function(index, item){
																																
								  var html ='<div class="article" onClick="location.href=\'<c:url value="/dona/main/post/detail?idx='+item.donaIdx+'"/>\'">';
									html += '<input type="hidden" value="'+item.donaIdx+'">';
								    html += '<div class="article-img">';
									html += '<img alt="thumbnail" class="img" src="http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com/dona/fileupload/post/s_'+item.files.fileName+'">';	
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
									 										
									 var pHtml = '<ul class="pagination"></ul>';
									 $('.paging').append(pHtml);
									 
									for(var i=1; i <= data.totalPageCount; i++){				
										var html2 = '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="javascript:goPage('+i+');">'+i+'</a></li>';							
									   console.log(html2);
										 $('.pagination').append(html2);
									}			 							
								 };	
						}, error : function(e){
							console.log(e);
						}
					});
					
				});		
	});
	
   </script>	
    </body>
    	
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>