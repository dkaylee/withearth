package com.aia.dona.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class PostEditRequest {
	
	private int idx; // 회원idx
	private String postTitle;  // 게시글 제목
	private String category;  // 카테고리
	private String postContent;  // 게시글 내용
	private String deleteImage[];  // 삭제할 기존 이미지
	private MultipartFile postImage[];  // 게시글 이미지
	private int donaIdx;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public MultipartFile[] getPostImage() {
		return postImage;
	}
	public void setPostImage(MultipartFile[] postImage) {
		this.postImage = postImage;
	}		
	public int getDonaIdx() {
		return donaIdx;
	}
	public void setDonaIdx(int donaIdx) {
		this.donaIdx = donaIdx;
	}		
	public String[] getDeleteImage() {
		return deleteImage;
	}
	public void setDeleteImage(String[] deleteImage) {
		this.deleteImage = deleteImage;
	}
	// editRequest -> post
	public PostOnly toPost() {
		PostOnly post = new PostOnly();
		post.setIdx(idx);
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
		post.setCategory(category);
		post.setDonaIdx(donaIdx);
		
		return post;
	}
	
	@Override
	public String toString() {
		return "PostEditRequest [idx=" + idx + ", postTitle=" + postTitle + ", category=" + category + ", postContent="
				+ postContent + ", deleteImage=" + Arrays.toString(deleteImage) + ", postImage="
				+ Arrays.toString(postImage) + ", donaIdx=" + donaIdx + "]";
	}
	

	

	

	
	
	
	


}
