package com.withearth.tumbler.domain;

//카페테이블
public class Cafe {
	
	private int cafe_idx; //카페 idx
	private String cafe_name; // 카페 상호
	private String location; // 카페 위치
	private String qrcode; //QR코드
	private int cafe_lat; //위도
	private int cafe_lon; //경도
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
	public int getCafe_lat() {
		return cafe_lat;
	}
	public void setCafe_lat(int cafe_lat) {
		this.cafe_lat = cafe_lat;
	}
	public int getCafe_lon() {
		return cafe_lon;
	}
	public void setCafe_lon(int cafe_lon) {
		this.cafe_lon = cafe_lon;
	}
	@Override
	public String toString() {
		return "Cafe [cafe_idx=" + cafe_idx + ", cafe_name=" + cafe_name + ", location=" + location + ", qrcode="
				+ qrcode + ", cafe_lat=" + cafe_lat + ", cafe_lon=" + cafe_lon + "]";
	}
	
	
	

}