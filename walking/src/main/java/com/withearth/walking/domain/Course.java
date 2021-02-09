package com.withearth.walking.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Course {
	
	// DB
	private int course_idx; // 코스 idx
	private Timestamp course_date; // 코스 설정 일자
	private BigDecimal loc_km; // 코스 총 거리
	private BigDecimal now_lat; // 현위치 위도
	private BigDecimal now_lon; // 현위치 경도
	private BigDecimal new_lat; // 목적지 위도
	private BigDecimal new_lon; // 목적지 경도
	private String end_add; // 목적지 주소
	private int total_time; // 총 소요 시간
	
	
	
	public String getEnd_add() {
		return end_add;
	}
	public void setEnd_add(String end_add) {
		this.end_add = end_add;
	}
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
	
	
	
	public int getTotal_time() {
		return total_time;
	}
	public void setTotal_time(int total_time) {
		this.total_time = total_time;
	}
	
	// toString()
	@Override
	public String toString() {
		return "Course [course_idx=" + course_idx + ", course_date=" + course_date + ", loc_km=" + loc_km + ", now_lat="
				+ now_lat + ", now_lon=" + now_lon + ", new_lat=" + new_lat + ", new_lon=" + new_lon + ", end_add="
				+ end_add + ", total_time=" + total_time + "]";
	}
	
	
	
	
	
	
	
	

}
