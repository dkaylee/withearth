package com.withearth.tumbler.domain;

//카페테이블
public class Cafe {
	
	private int cafe_idx; //카페 idx
	private String cafe_name; // 카페 상호
	private String location; // 카페 위치
	private String qrcode; //QR코드
	private int tum_lat; //위도
	private int tum_lon; //경도
	
	public int getTum_lat() {
		return tum_lat;
	}
	public void setTum_lat(int tum_lat) {
		this.tum_lat = tum_lat;
	}
	public int getTum_lon() {
		return tum_lon;
	}
	public void setTum_lon(int tum_lon) {
		this.tum_lon = tum_lon;
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
	@Override
	public String toString() {
		return "Cafe [cafe_idx=" + cafe_idx + ", cafe_name=" + cafe_name + ", location=" + location + ", qrcode="
				+ qrcode + ", tum_lat=" + tum_lat + ", tum_lon=" + tum_lon + "]";
	}

	

}