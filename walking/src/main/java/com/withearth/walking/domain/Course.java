package com.withearth.walking.domain;

import java.sql.Timestamp;

public class Course {
	
	private int course_idx;
	private Timestamp course_date;
	private Timestamp walking_date;
	private int real_km;
	private int loc_km;
	private String start;
	private String end;
	
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
	public Timestamp getWalking_date() {
		return walking_date;
	}
	public void setWalking_date(Timestamp walking_date) {
		this.walking_date = walking_date;
	}
	public int getReal_km() {
		return real_km;
	}
	public void setReal_km(int real_km) {
		this.real_km = real_km;
	}
	public int getLoc_km() {
		return loc_km;
	}
	public void setLoc_km(int loc_km) {
		this.loc_km = loc_km;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	// toString
	@Override
	public String toString() {
		return "Course [course_idx=" + course_idx + ", course_date=" + course_date + ", walking_date=" + walking_date
				+ ", real_km=" + real_km + ", loc_km=" + loc_km + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	

}
