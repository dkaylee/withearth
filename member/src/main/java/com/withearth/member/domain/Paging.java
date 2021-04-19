package com.withearth.member.domain;

public class Paging {

	//현재 페이지 번호
	private int num;
	//게시글 총 개수
	private int count;
	//한페이지에 출력할 게시물 개수
	private int postNum=10;
	//하단 페이지 번호 ([게시물 총 갯수 / 한페이지에 출력할 개수]의 올림)
	private int pageNum;
	//출력할 게시물 (idx부터 10개~느낌)
	private int displayPost;
	//한번에 표시할 페이징 번호의 갯수
	private int pageNum_cnt = 10;
	//표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;
	//표시되는 페이지 번호 중 첫 번째 번호
	private int startPageNum;
	//다음/이전 표시 여부
	private boolean prev;
	private boolean next;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		
		//게시물의 총 갯수를 알아야 계산가능 하므로 여기서 호출
		dataCal();
		
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPageNum_cnt() {
		return pageNum_cnt;
	}
	public void setPageNum_cnt(int pageNum_cnt) {
		this.pageNum_cnt = pageNum_cnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void dataCal() {
		
		//하단 페이지 번호 ([게시물 총 갯수 / 한페이지에 출력할 개수]의 올림)
		pageNum = (int)Math.ceil((double)count/postNum);
		//출력할 게시물 (idx부터 10개)
		displayPost = (num-1)*postNum;
		//표시되는 페이지 번호 중 마지막 번호
		endPageNum = (int) (Math.ceil((double)num / (double)pageNum_cnt)*pageNum_cnt);
		//표시되는 페이지 번호 중 첫번째 번호
		startPageNum = endPageNum - (pageNum_cnt -1);
		//마지막 페이지 다시 계산 (1~13의 경우 14~20까지도 출력됨)
		int endPageNum_tmp = (int)(Math.ceil((double)count/(double)pageNum_cnt));
		
		if(endPageNum>endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		//이전 다음
		//1페이지가 아닌이상 prev가 출력
		prev = startPageNum ==1 ? false : true;
		//다음페이지가 존재하면 true로 next 출력
		next = endPageNum * pageNum_cnt >= count ? false : true;

	}
	
	
	
}
