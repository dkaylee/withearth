package com.withearth.walking.domain;

public class CourseSettingRequest {
	
	// beans 객체
	
	private int tDistance; // 총 거리
	private int tTime; 	// 소요 시간
	private String startAdd;// 출발지 주소
	private String endAdd;		// 목적지 주소
	
	// getter/setter
	public int gettDistance() {
		return tDistance;
	}
	public void settDistance(int tDistance) {
		this.tDistance = tDistance;
	}
	public int gettTime() {
		return tTime;
	}
	public void settTime(int tTime) {
		this.tTime = tTime;
	}
	public String getStartAdd() {
		return startAdd;
	}
	public void setStartAdd(String startAdd) {
		this.startAdd = startAdd;
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
		course.setLoc_km(tDistance);
		course.setWalking_time(tTime);
		course.setStart_point(startAdd);
		course.setEnd_point(endAdd);
		
		return course;
	}
	
	//toString
	@Override
	public String toString() {
		return "CourseSettingRequest [tDistance=" + tDistance + ", tTime=" + tTime + ", startAdd=" + startAdd
				+ ", endAdd=" + endAdd + "]";
	}
	
	
	
	
	
	
	
	
	

}
