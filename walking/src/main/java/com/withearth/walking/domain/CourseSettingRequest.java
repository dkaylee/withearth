package com.withearth.walking.domain;

import java.sql.Time;

public class CourseSettingRequest {

	// beans 객체

	private float tdistance; // 총 거리
	private long atime; // 예상 시간
	private String startAdd; // 출발지 주소
	private String endAdd; // 목적지 주소
	private long ttime; // 소요 시간

	// getter/setter
	public float getTdistance() {
		return tdistance;
	}

	public void setTdistance(float tdistance) {
		this.tdistance = tdistance;
	}

	public long getAtime() {
		return atime;
	}

	public void setAtime(long atime) {
		this.atime = atime;
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

	public long getTtime() {
		return ttime;
	}

	public void setTtime(long ttime) {
		this.ttime = ttime;
	}

	// method 생성
	public Course toCourse() {
		Course course = new Course();
		course.setLoc_km(tdistance);
		course.setAbout_time(atime);
		course.setStart_point(startAdd);
		course.setEnd_point(endAdd);
		course.setWalking_time(new Time(ttime));

		return course;
	}

	// toString
	@Override
	public String toString() {
		return "CourseSettingRequest [tdistance=" + tdistance + ", atime=" + atime + ", startAdd=" + startAdd
				+ ", endAdd=" + endAdd + ", ttime=" + ttime + "]";
	}

}
