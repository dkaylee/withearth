package com.withearth.community.domain;

import java.util.List;

public class MatListView {
	
	private int pageNumber;
	private int totalMatzipCount;
	private int cntPerPage;
	private List<MatzipVo> matzipList;
	private int startRow;
	private int endRow;
	private int totalPageCount;
	
	
	public MatListView(int pageNumber, int totalMatzipCount, int cntPerPage, List<MatzipVo> matzipList, int startRow,
			int endRow) {
		
		this.pageNumber = pageNumber;
		this.totalMatzipCount = totalMatzipCount;
		this.cntPerPage = cntPerPage;
		this.matzipList = matzipList;
		this.startRow = startRow;
		this.endRow = endRow;
		calTotalPageCount();
	}
	
	private void calTotalPageCount() {
		totalPageCount = totalMatzipCount/cntPerPage;
		if(totalMatzipCount%cntPerPage>0) {
			totalPageCount++;
		}
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public int getTotalMatzipCount() {
		return totalMatzipCount;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public List<MatzipVo> getMatzipList() {
		return matzipList;
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
	
	

}
