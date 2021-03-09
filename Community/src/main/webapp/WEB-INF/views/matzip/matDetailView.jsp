<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matzip</title>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>

<style>

/* Rating Star Widgets Style */
.rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2.5em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
}

</style>

</head>

<body class="subpage">
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script>
	
	//var matIdx=${matzip.matIdx};
	
	// 파라미터로 페이지 번호 받기
 	function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 	
    var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);	
  	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var matIdx = getParameterByName('matIdx');
	
	console.log(matIdx);
	
	 $(document).ready(function(){
		
		getMatDetail();	
		getUploadFiles();
		

	}); 
	
	/* go edit Form */
	function goEdit(){
		location.href = "/community/matzip/editmatForm?matIdx="+matIdx;
	}
	

	/* get Matzip data */
	function getMatDetail(){
		
		$.ajax({
			url:"https://www.withearthcomm.tk/community/matzip/matDetail?matIdx="+matIdx,
			type: "GET",
			success : function(data) {
				console.log(data);	
				
				var html = "";
				html += '<h2>'
				html += data.matTitle
				html += '</h2>';
				html += '<hr class="major"/>';
				html += '<div>';
				html += '<div id="matImg"></div>'
				html += '<img src="http://localhost:8080/community/fileupload/matzip/'+data.matImg+'" style="width:60%">';
				html += '</div>';
				html += '<hr class="major"/>';
				html += '<div>'
				html += data.matAddr
				html += '</div>';
				html += '<div>'
				html += data.matTime
				html += '</div>';
				html += '<div>'
				html += data.matNum
				html += '</div>';
				
				 console.log(html);
				$('#matDetail').append(html);
				
			},
			error : function(){
				alert("오류가 발생했습니다.");
			}
		});	
	}
	
	
	/* get UploadFiles */
	function getUploadFiles(){
		
		var filelist= [];
		
		$.ajax({
			url:"https://www.withearthcomm.tk/community/matzip/filelist?matIdx="+matIdx,
			type: "GET",
			success : function(data) {
				console.log(data);
				var files = "";
				
				for(var i=0; i<data.length; i++){
				files +='<div>'
				files +='<img src="https://www.withearthcomm.tk/community/fileupload/matzip/'+data[i].newFName+'" style="width:60%">';
				files +='</div>'
				filelist.push(files);			
				}
				
				$('#matImg').append(files);
				
				console.log(matImg);
				console.log(filelist);
	
			},
			error : function(data){
				alert("파일 못불러옴^^");
	
			}
		});
	}
	


	function deleteMatzip() {
		
		$.ajax({
					url:"https://www.withearthcomm.tk/community/matzip/deleteMat?matIdx="+matIdx,
					type:"POST",
					cache : false,
					success : function(result){	
						console.log(result);
						
						if(result == "1" ) {
							alert("게시글 삭제 했습니다.");  
								deleteFiles();	
								goMatlist();
							}
					},
					error: function(){
						alert('삭제를 실패했습니다.');
					}
				});
		} 
	
	
/* 파일삭제 */
function deleteFiles(){
	$.ajax({
		url:"https://www.withearthcomm.tk/community/matzip/deleteFiles?matIdx="+matIdx,
		type:"POST",
		cache : false,
		success : function(result2){	
			console.log(result2);	
		},
		error: function(){
			alert('파일 삭제를 실패했습니다.');
		}
	});
}	





/* 맛집 목록이동 */
function goMatlist(){
	location.href = "/community/matzip/matlist?p=1";
}
  
/* 스타 점수 */
var onStar = 0;
	  
/* 별점 리뷰 구현 */
$(document).ready(function(){
	  
	  /* 1. Visualizing things on Hover - See next part for action on click */
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
	   
	    // Now highlight all the stars that's not after the current hovered star
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  
	  /* 2. Action to perform on click */
	 $('#stars li').on('click', function(){
	    onStar = parseInt($(this).data('value'), 10); // The star currently selected
	    var stars = $(this).parent().children('li.star');
	    
	    for (i = 0; i < stars.length; i++) {
	      $(stars[i]).removeClass('selected');
	    }
	    
	    for (i = 0; i < onStar; i++) {
	      $(stars[i]).addClass('selected');
	    }
	    
	    console.log("star value::::"+onStar);

	  });
	  
	  
	 /* 별점 리뷰 Form*/
		 
 		 $('#saveReview').click(function(){
			 e.preventDefault();
			 
			// var form = $("form")[0];   
			// var formData = new FormData(form);
			 
			// formData.set("star", onStar);
			// formData.set("matIdx", matIdx);
			// formData.append("idx", $("#idx").val());
			// formData.append("sCont", $("#sCont").val());
			 
			 console.log(formData);
			 
			 $ajax({
					url:"http://localhost:8080/community/community/matzip/starRate",
					type:"POST",
					data : formData,
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					cache : false,
					success : function (data){
						console.log(data);
						
					}, error : function(){
						alert("후기를 다시 작성해주세요!");
					}
					
				});  
		 });
	   
	
		 
		 $ajax({
				url:"http://localhost:8080/community/community/matzip/starRate",
				type:"GET",
				data : $("#ratingForm").serialize(),
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				success : function (data){
					console.log(data);
					
					var html = "";
					html += "<tr>"
					/* <td>dk</td>
					<td>4점 </td>
					<td>맛집이라구요!!!! 여기 샐러드 존맛탱!!!!</td>
					<td>2021.03.07</td>
				</tr> */
					
					
					
				}, error : function(){
					alert("후기를 다시 작성해주세요!");
				}
				
			});  
  
	 
	  
	});

 

</script>


<section id="three" class="wrapper special">
	
		<%-- <span class="image fit" style="width: 1480px; height: 200px;"><img src="${matzip.matImg}"></span> --%>
		
		
		<div class="inner">

			
			
			<header class="align-center">
			
				<div id="matDetail">  </div>	
			</header>
		</div>
		
		<ul class="actions">
			<li><a href="#" class="button alt" onclick="javascript:goEdit();">수정</a></li>
			<li><a href="#" class="button alt" onclick="javascript:deleteMatzip();">삭제</a></li>
			<li><a href="#" class="button alt" onclick="javascript:goMatlist();">목록</a></li>
		</ul>

		<hr class="major"/>';

<!-- Star Rating -->
		<div class="inner">
			<div class="col-sm-12">
				<form id="ratingForm" method="POST" enctype="multipart/form-data">
					<div class="rating-stars text-center">
						<p><strong>후기를 남겨주세요!</strong></p>
						<section class='rating-widget'>
						
							<!-- Rating Stars Box -->
							<div class='rating-stars text-center'>
								<ul id='stars'>
									<li class='star' title='Poor' data-value='1'>
									<i class='fa fa-star fa-fw'></i></li>
									<li class='star' title='Fair' data-value='2'>
									<i class='fa fa-star fa-fw'></i></li>
									<li class='star' title='Good' data-value='3'>
									<i class='fa fa-star fa-fw'></i></li>
									<li class='star' title='Excellent' data-value='4'>
									<i class='fa fa-star fa-fw'></i></li>
									<li class='star' title='WOW!!!' data-value='5'>
									<i class='fa fa-star fa-fw'></i></li>
								</ul>
							</div>
						</section>	
						
				<input type="hidden" class="form-control" id="idx" name="idx" value="${loginInfo.idx}">
				</div>
				<div class="form-group">
						<label for="comment">Comment</label>
						<textarea class="form-control" rows="5" id="sCont" name="sCont" required></textarea>
				</div>

						<button type="submit" class="btn btn-info"  id="saveReview">저장</button>
						<button type="button" class="btn btn-info" id="cancelReview">취소</button>

				</form>
			</div>
			
			<hr class="major"/>';
		
		
		<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>작성자 </th>
												<th> 별점</th>
												<th>내용</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody id="starResult">
											
										</tbody>
										</table>
			</div>
			 -->
		</div>
		
		
		
	
	</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>





</body>
</html>