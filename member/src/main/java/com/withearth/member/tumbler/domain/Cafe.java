package com.withearth.member.tumbler.domain;

import java.math.BigDecimal;

//카페테이블
public class Cafe {
	
	private int idx; //회원 idx
	private int cafe_idx; //카페 idx
	private String cafe_name; // 카페 상호
	private String location; // 카페 위치
	private String qrcode; //QR코드
	private BigDecimal cafe_lat; //위도
	private BigDecimal cafe_lon; //경도
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getQrcode() {
		return qrcode;
	}
	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}
	public BigDecimal getCafe_lat() {
		return cafe_lat;
	}
	public void setCafe_lat(BigDecimal cafe_lat) {
		this.cafe_lat = cafe_lat;
	}
	public BigDecimal getCafe_lon() {
		return cafe_lon;
	}
	public void setCafe_lon(BigDecimal cafe_lon) {
		this.cafe_lon = cafe_lon;
	}
	
	@Override
	public String toString() {
		return "Cafe [idx=" + idx + ", cafe_idx=" + cafe_idx + ", cafe_name=" + cafe_name + ", location=" + location
				+ ", qrcode=" + qrcode + ", cafe_lat=" + cafe_lat + ", cafe_lon=" + cafe_lon + "]";
	}
	
	
	

	
	

}