package com.aia.dona.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Post { // 게시물 빈즈 객체
	
	private int donaIdx;  // 게시글idx
	private String postTitle;  // 게시글 제목
	private String postImage;  // 게시글 이미지
	private String postContent;  // 게시글 내용
	private String category;  // 카테고리
	private Timestamp writedate;  // 게시글 작성일자
	private int idx;  // 회원idx
	
	// getter & setter
	public int getDonaIdx() {
		return donaIdx;
	}
	public void setDonaIdx(int donaIdx) {
		this.donaIdx = donaIdx;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostImage() {
		return postImage;
	}
	public void setPostImage(String postImage) {
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
	public String getWritedate() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return date.format(writedate);
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}

	
	public String toString() {
		return "Post [donaIdx=" + donaIdx + ", postTitle=" + postTitle + ", postImage=" + postImage + ", postContent="
				+ postContent + ", category=" + category + ", writedate=" + writedate + ", idx=" + idx + "]";
	}
	
	
	
	

}
