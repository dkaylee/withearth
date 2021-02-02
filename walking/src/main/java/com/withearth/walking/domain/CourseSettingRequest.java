package com.withearth.walking.domain;

public class CourseSettingRequest {
	
	private String loc_start;	// 출발지
	private String loc_end;
	
	// getter/setter
	public String getLoc_start() {
		return loc_start;
	}
	public void setLoc_start(String loc_start) {
		this.loc_start = loc_start;
	}
	public String getLoc_end() {
		return loc_end;
	}
	public void setLoc_end(String loc_end) {
		this.loc_end = loc_end;
	}
	
	// method 생성
	public Course toCourse() {
		Course course = new Course();
		course.setStart(loc_start);
		course.setEnd(loc_end);
		
		return course;
	}
	
	// toString
	@Override
	public String toString() {
		return "CourseSettingRequest [loc_start=" + loc_start + ", loc_end=" + loc_end + "]";
	}
	
	
	
	
	

}
