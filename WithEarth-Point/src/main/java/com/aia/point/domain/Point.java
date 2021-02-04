package com.aia.point.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Point {  // 포인트 객체
		
	private int point_idx;  // 포인트 idx
	private int saving_point;  // 적립포인트
	private int pointsum; // 포인트 합계
	private String saving_system;  // 적립방식
	private Timestamp saving_date;  // 적립일자
	private int idx; // 회원 idx
	private int tum_idx; // 텀블러 idx
	private int course_idx;	// 코스idx
		
	// getter / setter
	public int getPoint_idx() {
		return point_idx;
	}
	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}
	public int getSaving_point() {
		return saving_point;
	}
	public void setSaving_point(int saving_point) {
		this.saving_point = saving_point;
	}
	public String getSaving_system() {
		return saving_system;
	}
	public void setSaving_system(String saving_system) {
		this.saving_system = saving_system;
	}
	public String getSaving_date() {		
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return date.format(saving_date);
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
	
	public int getPointsum() {
		return pointsum;
	}
	public void setPointsum(int pointsum) {
		this.pointsum = pointsum;
	}
	
	@Override
	public String toString() {
		return "Point [point_idx=" + point_idx + ", saving_point=" + saving_point + ", pointsum=" + pointsum
				+ ", saving_system=" + saving_system + ", saving_date=" + saving_date + ", idx=" + idx + ", tum_idx="
				+ tum_idx + ", course_idx=" + course_idx + "]";
	}
	

	
	

	
	

}
