package com.withearth.tumbler.domain;

import java.sql.Timestamp;

public class Tumbler {
	
	private int tum_idx; //텀블러 idx
	private Timestamp tum_date; // 텀블러 이용 날짜
	private int cafe_idx; //카페 인덱스
	private String cafe_name; 
	private int idx; //회원 인덱스
	private int tum_point;// 텀블러 포인트
	
	
	public int getTum_idx() {
		return tum_idx;
	}
	public void setTum_idx(int tum_idx) {
		this.tum_idx = tum_idx;
	}
	public Timestamp getTum_date() {
		return tum_date;
	}
	public void setTum_date(Timestamp tum_date) {
		this.tum_date = tum_date;
	}
	public int getCafe_idx() {
		return cafe_idx;
	}
	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getTum_point() {
		return tum_point;
	}
	public void setTum_point(int tum_point) {
		this.tum_point = tum_point;
	}
	@Override
	public String toString() {
		return "Tumbler [tum_idx=" + tum_idx + ", tum_date=" + tum_date + ", cafe_idx=" + cafe_idx + ", cafe_name="
				+ cafe_name + ", idx=" + idx + ", tum_point=" + tum_point + "]";
	}
	

	
	
	

}