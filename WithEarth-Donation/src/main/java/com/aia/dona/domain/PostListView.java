package com.aia.dona.domain;

import java.util.List;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PostListView {
	
	private List<Post> postList; // 한 페이지에 노출할 게시물 정보 리스트
	private int pageNumber;  // 현재 페이지 번호
	private int totalPostCount;  // 전체 게시물의 개수
	private int cntPerPage;  // 한 페이지에 노출할 게시물의 개수
	private int startRow; // 시작 행 
	private int endRow;   // 마지막 
	private int totalPageCount; // 전체 페이지의 개수
	
	
	public PostListView(int pageNumber, int totalPostCount, int cntPerPage, List<Post> postList, int startRow,
			int endRow) {
		this.pageNumber = pageNumber;
		this.totalPostCount = totalPostCount;
		this.cntPerPage = cntPerPage;
		this.postList = postList;
		this.startRow = startRow;
		this.endRow = endRow;
		calTotalPageCount();
	}


	private void calTotalPageCount() {
		
		totalPageCount = totalPostCount/cntPerPage; 
		if(totalPostCount%cntPerPage>0) {
			totalPageCount++;
		}
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public int getTotalPostCount() {
		return totalPostCount;
	}


	public int getCntPerPage() {
		return cntPerPage;
	}


	public List<Post> getPostList() {
		return postList;
	}


	public int getStartRow() {
		return startRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public int getTotalPageCount() {
		return totalPageCount;
	}


	@Override
	public String toString() {
		return "PostListView [postList=" + postList + ", pageNumber=" + pageNumber + ", totalPostCount="
				+ totalPostCount + ", cntPerPage=" + cntPerPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", totalPageCount=" + totalPageCount + "]";
	}




}
