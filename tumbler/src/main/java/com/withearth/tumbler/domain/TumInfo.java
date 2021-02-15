package com.withearth.tumbler.domain;

import java.sql.Timestamp;

public class TumInfo {
	
	private String idx;
	private Timestamp tum_date;
	private String cafe_name;
	private String location;
	private int tum_point;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public Timestamp getTum_date() {
		return tum_date;
	}
	public void setTum_date(Timestamp tum_date) {
		this.tum_date = tum_date;
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
	public int getTum_point() {
		return tum_point;
	}
	public void setTum_point(int tum_point) {
		this.tum_point = tum_point;
	}
	@Override
	public String toString() {
		return "TumInfo [idx=" + idx + ", tum_date=" + tum_date + ", cafe_name=" + cafe_name + ", location=" + location
				+ ", tum_point=" + tum_point + "]";
	}
	
	
	

}
