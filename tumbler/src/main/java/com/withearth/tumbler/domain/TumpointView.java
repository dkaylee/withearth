package com.withearth.tumbler.domain;

import java.util.List;

public class TumpointView {
	
	private int pageNumber; // 현재 페이지 번호
	private int totalTpointCount; //전체 텀블러 포인트 적립 개수
	private int cntPerPage; // 한페이지에 노출할 게시물의 개수
	private List<Tumbler> tumlist; //페이지에 노출할 회원의 포인트정보를 담는 리스트
	private int startRow;
	private int endRow;
	private int totalPageCount; //전체 페이지 수 
	private int idx; //회원 인덱스
	
	
	public TumpointView(int pageNumber, int totalTpointCount, int cntPerPage, int idx, List<Tumbler> tumlist, int startPow,
			int endRow) {
		
		this.pageNumber = pageNumber;
		this.totalTpointCount = totalTpointCount;
		this.cntPerPage = cntPerPage;
		this.tumlist = tumlist;
		this.startRow = startPow;
		this.endRow = endRow;
		this.totalPageCount = totalPageCount;
		this.idx = idx;
		calTotalPageCount();
	}
	


	private void calTotalPageCount() {
		
		totalPageCount = totalTpointCount/cntPerPage;
		if(totalTpointCount % cntPerPage >0) {
			totalPageCount++;
		}
		
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getTotalTpointCount() {
		return totalTpointCount;
	}
	public void setTotalTpointCount(int totalTpointCount) {
		this.totalTpointCount = totalTpointCount;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public List<Tumbler> getTumlist() {
		return tumlist;
	}
	public void setTumlist(List<Tumbler> tumlist) {
		this.tumlist = tumlist;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartPow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	
	@Override
	public String toString() {
		return "TumpointView [pageNumber=" + pageNumber + ", totalTpointCount=" + totalTpointCount + ", cntPerPage="
				+ cntPerPage + ", tumlist=" + tumlist + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", totalPageCount=" + totalPageCount + "]";
	}

	

}
