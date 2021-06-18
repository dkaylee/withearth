package com.aia.dona.domain;

public class Heart {
	
	private int heartIdx;
	private int heartCnt;
	private int idx;
	private int donaIdx;
	
	public int getHeartIdx() {
		return heartIdx;
	}
	public void setHeartIdx(int heartIdx) {
		this.heartIdx = heartIdx;
	}
	public int getHeartCnt() {
		return heartCnt;
	}
	public void setHeartCnt(int heartCnt) {
		this.heartCnt = heartCnt;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getDonaIdx() {
		return donaIdx;
	}
	public void setDonaIdx(int donaIdx) {
		this.donaIdx = donaIdx;
	}
	
	@Override
	public String toString() {
		return "Heart [heartIdx=" + heartIdx + ", heartCnt=" + heartCnt + ", idx=" + idx + ", donaIdx=" + donaIdx + "]";
	}
	
	
}	
	
	