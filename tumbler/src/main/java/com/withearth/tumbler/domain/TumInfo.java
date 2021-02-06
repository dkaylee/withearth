package com.withearth.tumbler.domain;

import java.sql.Timestamp;

public class TumInfo {
	
	private String idx;
	private Timestamp tumdate;
	private String cafename;
	private String location;
	private int tumpoint;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public Timestamp getTumdate() {
		return tumdate;
	}
	public void setTumdate(Timestamp tumdate) {
		this.tumdate = tumdate;
	}
	public String getCafename() {
		return cafename;
	}
	public void setCafename(String cafename) {
		this.cafename = cafename;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getTumpoint() {
		return tumpoint;
	}
	public void setTumpoint(int tumpoint) {
		this.tumpoint = tumpoint;
	}
	
	public TumInfo toTumInfo() {
		return new TumInfo();
	}
	
	
	
	@Override
	public String toString() {
		return "TumInfo [idx=" + idx + ", tumdate=" + tumdate + ", cafename=" + cafename + ", location=" + location
				+ ", tumpoint=" + tumpoint + "]";
	}
	
	

}
