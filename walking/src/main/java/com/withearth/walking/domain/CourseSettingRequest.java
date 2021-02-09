package com.withearth.walking.domain;

import java.math.BigDecimal;

public class CourseSettingRequest {
	
	private BigDecimal nowLat; 	// 현재 위치의 위도
	private BigDecimal nowLon;	// 현재 위치의 경도
	private BigDecimal newLat;	// 검색한 위치의 위도
	private BigDecimal newLon;	// 검색한 위치의 경도
	private BigDecimal tDistance; // 총 거리
	private BigDecimal tTime; 	// 총 시간
	
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
	public BigDecimal gettTime() {
		return tTime;
	}
	public void settTime(BigDecimal tTime) {
		this.tTime = tTime;
	}
	
	
	// method 생성
	public Course toCourse() {
		Course course = new Course();
		course.setNew_lat(newLat);
		course.setNew_lon(newLon);
		course.setNow_lat(nowLat);
		course.setNow_lon(nowLon);
		course.setLoc_km(tDistance);
		
		return course;
	}
	
	// toString
	@Override
	public String toString() {
		return "CourseSettingRequest [nowLat=" + nowLat + ", nowLon=" + nowLon + ", newLat=" + newLat + ", newLon="
				+ newLon + ", tDistance=" + tDistance + ", tTime=" + tTime + "]";
	}
	  
	
	
	
	
	
	
	

}
