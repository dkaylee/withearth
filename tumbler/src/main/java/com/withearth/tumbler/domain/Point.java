package com.withearth.tumbler.domain;

import java.sql.Timestamp;

public class Point {
	//savint_point, saving_system, saving_date, idx, tum_idx, course_idx
	private int point; 
	private int savint_point;
	private String saving_system;
	private Timestamp saving_date; 
	private int idx; 
	private int tum_idx;
	private int course_idx;
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSavint_point() {
		return savint_point;
	}
	public void setSavint_point(int savint_point) {
		this.savint_point = savint_point;
	}
	public String getSaving_system() {
		return saving_system;
	}
	public void setSaving_system(String saving_system) {
		this.saving_system = saving_system;
	}
	public Timestamp getSaving_date() {
		return saving_date;
	}
	public void setSaving_date(Timestamp saving_date) {
		this.saving_date = saving_date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getTum_idx() {
		return tum_idx;
	}
	public void setTum_idx(int tum_idx) {
		this.tum_idx = tum_idx;
	}
	public int getCourse_idx() {
		return course_idx;
	}
	public void setCourse_idx(int course_idx) {
		this.course_idx = course_idx;
	}
	@Override
	public String toString() {
		return "Point [point=" + point + ", savint_point=" + savint_point + ", saving_system=" + saving_system
				+ ", saving_date=" + saving_date + ", idx=" + idx + ", tum_idx=" + tum_idx + ", course_idx="
				+ course_idx + "]";
	}
		
}