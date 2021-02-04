package com.aia.point.domain;

public class CoursePoint {
	
	private int idx;  // 회원idx
	private int course_idx; // 코스idx
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCourse_idx() {
		return course_idx;
	}
	public void setCourse_idx(int course_idx) {
		this.course_idx = course_idx;
	}
	
	//CoursePoint -> Point
	public Point toPoint() {
		Point point = new Point();
		point.setIdx(idx);
		point.setCourse_idx(course_idx);
		return point;
	}
	
	@Override
	public String toString() {
		return "CoursePoint [idx=" + idx + ", course_idx=" + course_idx + "]";
	}
	
	
	

}
