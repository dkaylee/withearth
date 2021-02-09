package com.withearth.walking.domain;

import java.math.BigDecimal;

public class CourseSettingRequest {
	
	// beans 객체
	private BigDecimal nowLat; 	// 현재 위치의 위도
	private BigDecimal nowLon;	// 현재 위치의 경도
	private BigDecimal newLat;	// 검색한 위치의 위도
	private BigDecimal newLon;	// 검색한 위치의 경도
	private BigDecimal tDistance; // 총 거리
	private int tTime; 	// 총 시간
	private String endAdd;		// 목적지 주소
	
	
	// getter/setter
	public BigDecimal getNowLat() {
		return nowLat;
	}
	public void setNowLat(BigDecimal nowLat) {
		this.nowLat = nowLat;
	}
	public BigDecimal getNowLon() {
		return nowLon;
	}
	public void setNowLon(BigDecimal nowLon) {
		this.nowLon = nowLon;
	}
	public BigDecimal getNewLat() {
		return newLat;
	}
	public void setNewLat(BigDecimal newLat) {
		this.newLat = newLat;
	}
	public BigDecimal getNewLon() {
		return newLon;
	}
	public void setNewLon(BigDecimal newLon) {
		this.newLon = newLon;
	}
	public BigDecimal gettDistance() {
		return tDistance;
	}
	public void settDistance(BigDecimal tDistance) {
		this.tDistance = tDistance;
	}
	public int gettTime() {
		return tTime;
	}
	public void settTime(int tTime) {
		this.tTime = tTime;
	}
	
	public String getEndAdd() {
		return endAdd;
	}
	public void setEndAdd(String endAdd) {
		this.endAdd = endAdd;
	}
	// method 생성
	public Course toCourse() {
		Course course = new Course();
		course.setNew_lat(newLat); // 현위치 위도
		course.setNew_lon(newLon); // 현위치 경도
		course.setNow_lat(nowLat); // 목적지 위도
		course.setNow_lon(nowLon); // 목적지 경도
		course.setLoc_km(tDistance); // 총 거리
		course.setEnd_add(endAdd); // 목적지 주소
		course.setTotal_time(tTime); // 총 소요 시간
		
		return course;
	}
	
	
	// toString
	
	@Override
	public String toString() {
		return "CourseSettingRequest [nowLat=" + nowLat + ", nowLon=" + nowLon + ", newLat=" + newLat + ", newLon="
				+ newLon + ", tDistance=" + tDistance + ", tTime=" + tTime +  ", endAdd="
				+ endAdd + "]";
	}
	
	
	
	
	
	
	

}
