package com.withearth.walking.domain;

public class CourseSettingRequest {
	
	// beans 객체
	
	private float tdistance; // 총 거리
	private long ttime; 	// 소요 시간
	private String startAdd;// 출발지 주소
	private String endAdd;		// 목적지 주소
	
	// getter/setter
	
	
	
	
	public float getTdistance() {
		return tdistance;
	}

	public void setTdistance(float tdistance) {
		this.tdistance = tdistance;
	}

	public long getTtime() {
		return ttime;
	}

	public void setTtime(long ttime) {
		this.ttime = ttime;
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
			course.setLoc_km(tdistance);
			course.setWalking_time(ttime);
			course.setStart_point(startAdd);
			course.setEnd_point(endAdd);
			
			return course;
		}
	
	//toString
	@Override
	public String toString() {
		return "CourseSettingRequest [tdistance=" + tdistance + ", ttime=" + ttime + ", startAdd=" + startAdd
				+ ", endAdd=" + endAdd + "]";
	}
	
	
	
	
	
	
	
	
	

}
