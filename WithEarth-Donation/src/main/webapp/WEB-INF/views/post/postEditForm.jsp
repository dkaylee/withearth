<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
 <head>
<meta charset="utf-8" />
<title>WithEarth</title>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js?"></script>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>
<style>
    
.title{
 text-align: center;
 font-size : 30px;
 font-weight: bold;
 }
 
 .p-images{
   float : left;
 }
</style>    
</head>
    
<body id="page-top">
      
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       
 	<section id="banner"></section>

	<form method="post" enctype="multipart/form-data" action="<c:url value="/rest/user/post/edit"/>">
		<h3 class="title">게시글 수정</h3>
		<br>
		<div class="row uniform" id="editForm">
		
			<!-- Break -->
			<div class="12u$">
				<ul class="actions">
					<li><input type="submit" value="Send Message" /></li>
					<li><input type="reset" value="Reset" class="alt" /></li>
				</ul>
			</div>
		</div>
	</form>
	
	<script>
	 
	$(document).ready(function(){
		
		 // 회원idx 받기
		 function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
			return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
		   }
		 
		 var donaIdx = getParameterByName('idx');
		 
			
		$.ajax({
			
			  url : "http://localhost:8080/dona/rest/user/post/detail?idx="+donaIdx,
		    type : 'GET',
		    success : function(data){
		    	
		       var html = '<div class="6u 12u$(xsmall)">';
			         html += '<input type="hidden" name="idx" value="'+data.idx+'"/>';
			         html += '<input type="hidden" name="donaIdx" value="'+data.donaIdx+'">';
				       html += '<input type="text" name="postTitle" id="postTitle" placeholder="제목" value="'+data.postTitle+'" />';				       
				       html += '<div class="oldImages"></div>';				       
				       html += '<input multiple="multiple" type="file" name="postImage" id="postImage">';		
			         html += '</div>';

		    	     html += '<div class="6u 12u$(xsmall)">';
		    	     html += '<div class="select-wrapper">';
		    	     html += '<select name="category" id="category">';
		    	     html += '<option value="">'+data.category+' </option>';
		    	     html += '<option value="">- Category -</option>';
		    	     html += '<option value="디지털/가전">디지털/가전</option>';
		    	     html += '<option value="가구/인테리어">가구/인테리어</option>';
		    	     html += '<option value="유아동/유아도서">유아동/유아도서</option>';					
		    	     html += '<option value="생활/가공식품">생활/가공식품</option>';
		    	     html += '<option value="스포츠/레저">스포츠/레저</option>';
		    	     html += '<option value="의류/잡화">의류/잡화</option>';
		    	     html += '<option value="도서/티켓/음반">도서/티켓/음반</option>';
		    	     html += '<option value="기타 물품">기타 물품</option>';
		    	     html += '</select>';
		    	     html += '</div>';
		    	     html += '</div>';
		    	     html += '<div class="12u$">';
					     html += '<textarea name="postContent" id="postContent" placeholder="Enter your message" rows="6">'+data.postContent+'</textarea>';
					     html += '</div>';
					     
					     $('#editForm').prepend(html);
		    },
		    error : function(e){
		    	console.log(e);
		    }
			
		});
		
	       $.ajax({
	    	   
	    	   url : "http://localhost:8080/dona/rest/user/post/detail/image?idx=" + donaIdx,
	    	   type : 'GET',
	    	   success : function(data){
	    		   
	    		   $.each(data, function(index, item){
	    			   
	    			   var html2 = '<div class="p-images">';
	    			      html2 += '<img src="<c:url value="/fileupload/post/'+item.fileName+'"/>" style=width:100px; alt="postImages">';
	    			      html2 += '<input type="hidden" value="'+item.fileName+'" name="oldPostImage">';
	    			      html2 += '</div>';
	    			      $('.oldImages').append(html2);
	    		   })
	    		   
	    		   	    		   
	    	   },error : function(e){
	    		   console.log(e);
	    	   }
	        	 	        		 	
	       });
	       
	      
	  });
	
	   
</script>	

</body>
<script>

   window.onload = function(){
	   	   	   
	   $(document).ready(function(){
					 		   
		   $('#postImage').on("change",handleImgFileSelect);
		   
		});	 
	   
	   function handleImgFileSelect(e){
		   
		   var sel_files = [];
			  
			  var files = e.target.files;
			  console.log(files);
			  var filesArr = Array.prototype.slice.call(files);
			  
			  filesArr.forEach(function(f){
				  if(!f.type.match("image.*")){
					  alert('이미지 파일만 가능합니다.')
					  return;
				  }
				  
				  sel_files.push(f);
				  
				   var reader = new FileReader();
				   reader.onload =function(e){
					   var img_html = "<img src =\""+e.target.result+"\" style=\"width:100px;\" />";
					   $('.oldImages').append(img_html);			   
				   }
				   reader.readAsDataURL(f);
			  });
	}
	   
   }
  
</script>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    
</html>
