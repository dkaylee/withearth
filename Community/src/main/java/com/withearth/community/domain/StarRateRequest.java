package com.withearth.community.domain;

import java.sql.Timestamp;

public class StarRateRequest {
	private int sIdx;
	private int matIdx;
	private int idx;
	private int star;
	private String sCont;
	private Timestamp sDate;
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getmatIdx() {
		return matIdx;
	}
	public void setmatIdx(int matIdx) {
		this.matIdx = matIdx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getsCont() {
		return sCont;
	}
	public void setsCont(String sCont) {
		this.sCont = sCont;
	}
	public Timestamp getsDate() {
		return sDate;
	}
	public void setsDate(Timestamp sDate) {
		this.sDate = sDate;
	}
	
	
	@Override
	public String toString() {
		return "StarRateRequest [sIdx=" + sIdx + ", mIdx=" + matIdx + ", idx=" + idx + ", star=" + star + ", sCont="
				+ sCont + ", sDate=" + sDate + "]";
	}
	
	

}
