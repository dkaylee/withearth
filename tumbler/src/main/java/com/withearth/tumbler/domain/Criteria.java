package com.withearth.tumbler.domain;

public class Criteria {
	
	private int page; //보여줄 페이지 번호
	private int perPageNum; // 페이지당 보여줄 게시글의 개수
	
	
	//기본 값 설정
	public Criteria() {
		this.page=1;
		this.perPageNum=10;
	
	}
	


	public int getPage() {
		return page;
	}



	public void setPage(int page) {
		this.page = page;
	}


	public int getPerPageNum() {
		return perPageNum;
	}


	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}


	public int getPageStart() {
		return(this.page -1) * perPageNum;
	}



	@Override
	public String toString() {
		return "Tumpaging [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	

}
