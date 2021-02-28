package com.aia.dona.domain;


import org.springframework.web.multipart.MultipartFile;

public class RequestPost {
	
	private int idx; // 회원idx
	private String postTitle;  // 게시글 제목
	private MultipartFile postImage[];  // 게시글 이미지
	private String category;  // 카테고리
	private String postContent;  // 게시글 내용
	
	
	
	// getter & setter
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public MultipartFile[] getPostImage() {
		return postImage;
	}
	public void setPostImage(MultipartFile[] postImage) {
		this.postImage = postImage;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	// RequestPost -> Post
	public Post toPost() {
		Post post = new Post();
		post.setPostTitle(postTitle);
		post.setPostContent(postContent);
		post.setCategory(category);
		post.setIdx(idx);
		return post;
	}
	

	

	
	
	
	

}
