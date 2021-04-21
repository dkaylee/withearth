package com.withearth.member.domain;

public class pageDTO {
	
	
	private int listSize = 10; //한페이지당 보여질 리스트 개수
	private int rangeSize = 10; //한페이지 범위에 보여질 페이지 개수
	private int page; //현재 페이지
	private int range; //현재 페이지 범위 (시작번호)
	private int listCnt; //전체 게시물 개수
	private int pageCnt; //전체 페이지 범위 개수
	private int startPage; //각 페이지 범위 시작 번호
	private int startList; //게시판 시작번호
	private int endPage; //각 페이지 범위 끝 번호
	private boolean prev;
	private boolean next;
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getStartList() {
		return startList;
	}
	public void setStartList(int startList) {
		this.startList = startList;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
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
	public void pageinfo(int page, int range, int listCnt) {
		
		this.endPage = page; //현재 페이지
		this.range = range; //현재 페이지 범위
		this.listCnt = listCnt; //총 게시물 개수
		
		//전체 페이지수
			//listSize (한 페이지당 목록 개수)
			//pageCnt (전체 페이지 개수)
		this.pageCnt = (int)Math.ceil((double)listCnt/listSize);

		
		//시작페이지 (각 페이지)
		this.startPage = (range-1)*rangeSize +1;
		
		//게시판 시작번호
		this.startList = (page -1)*listSize;
		
		//이전 버튼 상태
		this.prev = range ==1? false:true;
		
		//다음 버튼 상태
		this.next = pageCnt > endPage ? true : false;
		
		if(this.endPage>this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		
	}
	
}
