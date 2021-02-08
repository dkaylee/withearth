package com.withearth.walking.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Course {
	
	private int course_idx;
	private Timestamp course_date;
	private BigDecimal loc_km;
	private BigDecimal now_lat;
	private BigDecimal now_lon;
	private BigDecimal new_lat;
	private BigDecimal new_lon;
	
	
	
	// getter/setter
	public int getCourse_idx() {
		return course_idx;
	}
	public void setCourse_idx(int course_idx) {
		this.course_idx = course_idx;
	}
	public Timestamp getCourse_date() {
		return course_date;
	}
	public void setCourse_date(Timestamp course_date) {
		this.course_date = course_date;
	}
	public BigDecimal getLoc_km() {
		return loc_km;
	}
	public void setLoc_km(BigDecimal tDistance) {
		this.loc_km = tDistance;
	}
	public BigDecimal getNow_lat() {
		return now_lat;
	}
	public void setNow_lat(BigDecimal now_lat) {
		this.now_lat = now_lat;
	}
	public BigDecimal getNow_lon() {
		return now_lon;
	}
	public void setNow_lon(BigDecimal now_lon) {
		this.now_lon = now_lon;
	}
	public BigDecimal getNew_lat() {
		return new_lat;
	}
	public void setNew_lat(BigDecimal new_lat) {
		this.new_lat = new_lat;
	}
	public BigDecimal getNew_lon() {
		return new_lon;
	}
	public void setNew_lon(BigDecimal new_lon) {
		this.new_lon = new_lon;
	}
	
	// toString()
	@Override
	public String toString() {
		return "Course [course_idx=" + course_idx + ", course_date=" + course_date + ", loc_km=" + loc_km + ", now_lat="
				+ now_lat + ", now_lon=" + now_lon + ", new_lat=" + new_lat + ", new_lon=" + new_lon + "]";
	}
	
	
	
	
	
	
	
	

}
