<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>WithEarth</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/dona/detail.css"/>" />
<style>
</style>

</head>

<body id="page-top">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section id="banner"></section>

	<section id="three" class="wrapper special">
		<div class="inner">

			<div id="myCarousel" class="carousel slide" data-bs-interval="false">

				<div class="carousel-inner"></div>


				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#myCarousel"> <span
					class="carousel-control-prev-icon">&lt;</span>
				</a> <a class="carousel-control-next" href="#myCarousel"> <span
					class="carousel-control-next-icon">&gt;</span>
				</a>

			</div>
			<div class="wrap-profile">
				<!-- 회원 idx로 회원 정보를 받아오는 ajax 필요함! -->
				<div class="profileImage">
					<img alt="프로필 사진" width="50px" height="50px" class="profile">
				</div>
				<div class="userInfo">
					<div class="userId"></div>
				</div>
				<br>
				<hr class="seperate">
				<div class="postDetails"></div>

				<div class="post" id="heart-div">
					<c:choose>
						<c:when test="${idx ne null}">
							<!-- 회원 번호가 null이 아닐 때(세션값 받아서 확인하기)-->
							<span class="icon"> <a href='javascript: click_heart();'><img
									width="25px" src='<c:url value="/img/dona/unlike.png" />'
									id='like_img'></a></span>
						</c:when>
						<c:otherwise>
							<span class="icon"><a href='javascript: login_need();'><img
									width="25px" src='<c:url value="/img/dona/unlike.png"/>'></a></span>
						</c:otherwise>
					</c:choose>

					<span style="float: left;" id="heart"></span><span id="heartCnt"></span>
					<br>
					<div id="chatBtn"></div>
				</div>
			</div>

		</div>

	</section>


	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
		// 게시물 idx 받기
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), 
			results = regex.exec(location.search);
			return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		};

		// 게시물 idx
		var donaIdx = getParameterByName('idx');
		// 회원 idx
		var idx = '<c:out value="${idx}"/>';

		// 좋아요 클릭 시 처리
		function click_heart() {
			console.log('게시물IDX : ' + donaIdx + ', idx : ' + idx);

			$.ajax({
				url : 'http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com:8080/dona/rest/user/heart',
				type : 'GET',
				data : 'donaIdx=' + donaIdx + '&idx=' + idx,
				success : function(data) {
					console.log(data);
					if (data.userCnt == 0) {
						like_img = '<c:url value="/img/dona/unlike.png"/>';
					} else {
						like_img = '<c:url value="/img/dona/like.png"/>';
					}

					$('#like_img').attr('src', like_img);
					$('#heartCnt').html(data.allHeartCnt);

				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}

			});
		};

		// 좋아요 페이지 기본 노출값 처리						
		$.ajax({
			url : 'http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com:8080/dona/rest/user/heart/list',
			type : 'GET',
			data : 'donaIdx=' + donaIdx + '&idx=' + idx,
			success : function(data) {
				console.log(data);
				if (data.userCnt == 0) {
					like_img = '<c:url value="/img/dona/unlike.png"/>';
				} else {
					like_img = '<c:url value="/img/dona/like.png"/>';
				}

				$('#like_img').attr('src', like_img);
				$('#heartCnt').html(data.allHeartCnt);

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});

		// 컨트롤러로 값 넘기기 (회원 게시물 데이터 받기)
		$.ajax({
			url : "http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com:8080/dona/rest/user/post/detail?idx=" + donaIdx,
			type : 'GET',
			asycn : false,
			success : function(data) {
				//console.log(data.postTitle);
				var html = '<h2 class="post" id="postTitle">'+ data.postTitle + '</h2>';
				    html += '<h5 class="post" id="postCategory">카테고리 : '+ data.category + ' ∙ 작성일 : ' + data.writedate + '</h5>';
				    html += '<p class="post" id="postContent">'+ data.postContent + '</p>';

					$('.postDetails').append(html);
					
					var ownerIdx = data.idx;
                    console.log(ownerIdx);
                    
					// 채팅으로 이동 (파라미터 넘기기)
					var cHtml = '<input type="button" name="cBtn" id="chatBtn" value="작성자와 채팅하기">';
					chatBtn.onclick = function() {
					// 방번호 랜덤하게 생성해서 넘기기 (1~100까지)
					var roomIdx = Math.floor(Math.random() * 100) + 1;

					child1 = window.open("<c:url value='/post/chat?donaIdx="+ donaIdx + "&uid=" + idx + "&to="+ data.idx + "&rid=" + roomIdx+ "'/>", "child1","width=330,height=600");					
					};

					$('#chatBtn').append(cHtml);
					},
					error : function(e) {
						console.log(e);
					}
				});

		// 컨트롤러로 값 넘기기(회원 게시물 이미지 데이터 받기)
		$.ajax({
			url : "http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com:8080/dona/rest/user/post/detail/image?idx="+ donaIdx,
			type : 'GET',
			success : function(data) {

				var firstImg = $(data).first();

				$.each(firstImg,function(index, item) {
				console.log(firstImg);

				  var html = '<div class="carousel-item active">';
				  // html +='<img src="<c:url value="/fileupload/post/'+item.fileName+'"/>" id="postImages" style="height : 500px; "alt="postImages">';										
				  html += '<img src="http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com:8080/dona/fileupload/post/'+item.fileName+'" id="postImages" style="height : 500px; "alt="postImages">';
				  html += '</div>';
				  $('.carousel-inner').append(html);
				})

				  var anotherImg = $(data).not(firstImg);

				  $.each(anotherImg,function(index, item) {
					console.log(anotherImg);

					var html2 = '<div class="carousel-item">';
						//html2 += '<img src="<c:url value="/fileupload/post/'+item.fileName+'"/>" id="postImages" style="height : 500px; alt="postImages">';
						html2 += '<img src="http://ec2-13-125-219-44.ap-northeast-2.compute.amazonaws.com:8080/dona/fileupload/post/'+item.fileName+'" id="postImages" style="height : 500px; alt="postImages">';
						html2 += '</div>'
						$('.carousel-inner').append(html2);
						})

					},
					error : function(e) {
						console.log(e);
					}
				});
		

		// Activate Carousel
		$("#myCarousel").carousel();
		$("#myCarousel").carousel({
			interval : false
		});

		// Enable Carousel Indicators
		$(".item1").click(function() {
			$("#myCarousel").carousel(0);
		});
		$(".item2").click(function() {
			$("#myCarousel").carousel(1);
		});
		$(".item3").click(function() {
			$("#myCarousel").carousel(2);
		});

		// Enable Carousel Controls
		$(".carousel-control-prev").click(function() {
			$("#myCarousel").carousel("prev");
		});
		$(".carousel-control-next").click(function() {
			$("#myCarousel").carousel("next");
		});
	</script>
	<script src="<c:url value="/js/bootstrap/bootstrap.bundle.js" />"></script>
</body>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</html>
