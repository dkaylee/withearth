package com.aia.dona.domain;

public class SearchParam {
	
	private int p; // 페이지 넘버
    private String keyword; // 검색어
    private String searchType; // 검색 타입
    
	public SearchParam(int p, String keyword, String searchType) {
		this.p = p;
		this.keyword = keyword;
		this.searchType = searchType;
		
		if(this.p<1) {
			this.p = 1;
		}
	}
	
	public SearchParam() {
		this.p = 1;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return "SearchParam [p=" + p + ", keyword=" + keyword + ", searchType=" + searchType + "]";
	}
    
	
    
}
