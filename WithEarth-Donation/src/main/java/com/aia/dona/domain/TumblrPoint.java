package com.aia.dona.domain;

public class TumblrPoint {
	
	private int idx;  // 회원idx
	private int tum_idx;  // 텀블러idx
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getTum_idx() {
		return tum_idx;
	}
	public void setTum_idx(int tum_idx) {
		this.tum_idx = tum_idx;
	}
	
	//TumblrPoint -> Point
	public Point toPoint() {
		Point point = new Point();
		point.setIdx(idx);
		point.setTum_idx(tum_idx);		
		return point;
	}
	
	@Override
	public String toString() {
		return "TumblrPoint [idx=" + idx + ", tum_idx=" + tum_idx + "]";
	}
	
	
	

	
}
