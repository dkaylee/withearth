<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Earth</title>
<style>
	.text_right {
		text-align: right;
	}
	
	.text_left {
		text-align: left;
	}
	.chattingBox {
		padding : 15px;
		border : 1px solid #AAA;
		margin: 10px 0;
	}
</style>
<link rel="stylesheet" href="<c:url value="/css/style.css"/>" />
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.1.js"></script>
<script type="text/javascript">

  var donaIdx = '<c:out value="${donaIdx}"/>';
  var uid = '<c:out value="${uid}"/>';
  var to = '<c:out value="${to}"/>';
  var roomIdx = '<c:out value="${rid}"/>';
  
  console.log(donaIdx +':'+ uid +':'+ to +':' + roomIdx);
  
	//웸소켓을 지정한 url로 연결한다.
	var sock = new SockJS("<c:url value="/chat"/>");
		
	//자바스크립트 안에 function을 집어넣을 수 있음.
	//데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
	sock.onmessage = onMessage;

	//데이터를 끊고싶을때 실행하는 메소드
	sock.onclose = onClose;
	
	$(document).ready(function() {
		
		
	 //기존 대화가 있다면 불러오기
		$.ajax({
			
			url : 'http://localhost:8080/dona/rest/user/post/chat/check',
			type : 'GET',
			data : 'donaIdx=' + donaIdx +'&rid=' + roomIdx,
			success : function(data){
				
				var headHtml = '대화상대 : '+to;
				$('.user-container').append(headHtml);
															
			$.each(data, function(index, item){       	
			if (item.userIdx != to ) {
			  
				var printHTML = "<div class='well text_right'>";
				printHTML += "<div class='alert alert-info'>";
				printHTML += "<strong>"+item.chatWritetime+"[" + item.userIdx + "] -> " + item.chatMessage + "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";				

				$('.chatting-list').append(printHTML);
			} else {
				var printHTML = "<div class='well text_left'>";
				printHTML += "<div class='alert alert-warning'>";
				printHTML += "<strong>"+item.chatWritetime+"[" + item.userIdx + "] -> " + item.chatMessage + "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
								
				$('.chatting-list').append(printHTML);
			
			}	   
			
      });
			
			 var footHtml = '------------------이전 대화------------------';
			    $('.chatting-list').append(footHtml);
										 				
			},error : function(e){
				console.log(e);
			}
			
		});
		
	 		
		// 접속했다는 메세지 추가하기
		$("#send-button").click(function() {
			console.log('send message...');
			sendMessage();
			
			$('.chatting-input').val('');
			$('.chatting-input').focus();
			
			return false;			
		});
	});
		
		$(function(){			
		});
		
		// 채팅창에 보여줄 시간 데이터 처리
		var now = new Date();	
		var nowTime;
		
	  theHours = now.getHours();
	  theMinutes = now.getMinutes();
	  
	  if(theHours > 12){		  
		  theHours = theHours - 12;		
		  
		  nowTime = "오후 " + theHours + ":" + theMinutes
	  } else{
		  nowTime = "오전 " + theHours + ":" + theMinutes 
	  }
		
		
		function sendMessage() {						
			
			/*소켓으로 메세지 보내기*/	
			  var msg = {		
					userIdx: uid,
					donaIdx : donaIdx,	
					to : to,
					roomIdx : roomIdx,
					chatWritetime : nowTime,
					chatMessage : $(".chatting-input").val()	
			}; 
			  sock.send(JSON.stringify(msg));
			  console.log(JSON.stringify(msg));
		}
		
		
		//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
		function onMessage(evt) { //변수 안에 function자체를 넣음.
			console.log(evt.data);
			var data = evt.data; // 전달 받은 데이터
			
			msgData = JSON.parse(data);
			
			console.log(msgData);
			
			var sessionid = null;
			var message = null;
			
			var currentUser = $('#sessionUserid').val();
			console.log('current session id:' + currentUser);
			
			var target = $('.chatting-list');
			
			if(target.length==0){
				$('.chatting-list').append('<li><h3>'+uid+' : 게시물 작성자-'+msgData.ownerIdx+'</h3></li>');
				$('.chatting-list').append('<hr>');
			}
			
			
			// 나와 상대방이 보낸 메세지를 구분하여 출력
			if (msgData.userIdx == currentUser) {
			  console.log(msgData.userIdx);
			  
				var printHTML = "<div class='well text_right'>";
				printHTML += "<div class='alert alert-info'>";
				printHTML += "<strong>"+msgData.chatWritetime+"[" + msgData.userIdx + "] -> " + msgData.chatMessage + "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";

				$('.chatting-list').append(printHTML);
			} else {
			
				var printHTML = "<div class='well text_left'>";
				printHTML += "<div class='alert alert-warning'>";
				printHTML += "<strong>"+msgData.chatWritetime+"[" + msgData.userIdx + "] -> " + msgData.chatMessage + "</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
								
				$('.chatting-list').append(printHTML);					
				
			}

			console.log('chatting data: ' + data);

			/* sock.close(); */						
		}

	
		function onClose(evt) {
			$(".chatting-list").append("연결 끊김");
		}


</script>

</head>
<body>
	<div class="wrapper">
		<div class="user-container">

		</div>
		<div class="display-container">
			<ul class="chatting-list">

			</ul>
		</div>
		<div class="input-container">
			<span> <input type="text" class="chatting-input">
			<input type="button" id="send-button" class="send-button" value="전송">
				<input type="hidden" value="${user}" id="sessionUserid"> 유저 : ${user}
			</span>
		</div>
	</div>
</body>
</html>