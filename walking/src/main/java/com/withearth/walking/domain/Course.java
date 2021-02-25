package com.withearth.walking.domain;

import java.sql.Timestamp;


public class Course {
	
	// DB (타입 주의 - 타입 오류 시 400 에러 발생)
	private int course_idx; // 코스 idx
	private Timestamp course_date; // 코스 생성 일자
	private float loc_km; // 코스 총 거리
	private long about_time;// 예상 도보 시간
	private String start_point;// 출발지
	private String end_point;// 목적지
	private String walking_time; // 소요 시간 -> String으로 처리, 시간계산이 필요하다면 Time으로 처리
	
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

	public float getLoc_km() {
		return loc_km;
	}

	public void setLoc_km(float loc_km) {
		this.loc_km = loc_km;
	}

	public long getAbout_time() {
		return about_time;
	}

	public void setAbout_time(long about_time) {
		this.about_time = about_time;
	}

	public String getStart_point() {
		return start_point;
	}

	public void setStart_point(String start_point) {
		this.start_point = start_point;
	}

	public String getEnd_point() {
		return end_point;
	}

	public void setEnd_point(String end_point) {
		this.end_point = end_point;
	}

	public String getWalking_time() {
		return walking_time;
	}

	public void setWalking_time(String walking_time) {
		this.walking_time = walking_time;
	}

	// tostring
	@Override
	public String toString() {
		return "Course [course_idx=" + course_idx + ", course_date=" + course_date + ", loc_km=" + loc_km
				+ ", about_time=" + about_time + ", start_point=" + start_point + ", end_point=" + end_point
				+ ", walking_time=" + walking_time + "]";
	}


	
	
	

}
