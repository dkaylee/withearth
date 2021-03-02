package com.withearth.member.walking.domain;

import java.util.List;

public class CourseListView {
	
	private int pageNumber; 			// 현재 페이지 번호
	private int totalCourseCount;		// 전체 게시물의 개수
	private int cntPerPage;				// 한 페이지에 표시되는 게시물의 개수
	private List<Course> courseList;	// 페이지에 노출할 코스의 정보를 담는 리스트
	private int startRow;				//	
	private int endRow;					//
	private int totalPageCount;			// 전체 페이지의 개수
	
	// 생성자 생성
	public CourseListView(int pageNumber, int totalCourseCount, int cntPerPage, List<Course> courseList, int startRow,
			int endRow) {

		this.pageNumber = pageNumber;
		this.totalCourseCount = totalCourseCount;
		this.cntPerPage = cntPerPage;
		this.courseList = courseList;
		this.startRow = startRow;
		this.endRow = endRow;
		
		calToTalPageCount();
	}
	
	private void calToTalPageCount() {
		totalPageCount = totalCourseCount/cntPerPage;
		
		if(totalCourseCount%cntPerPage>0) {
			totalPageCount++;	//	나머지가 1이상일 경우 페이지를 하나 더 추가
		}
	}

	// getter
	public int getPageNumber() {
		return pageNumber;
	}

	public int getTotalCourseCount() {
		return totalCourseCount;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	// toString
	@Override
	public String toString() {
		return "CourseListView [pageNumber=" + pageNumber + ", totalCourseCount=" + totalCourseCount + ", cntPerPage="
				+ cntPerPage + ", courseList=" + courseList + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", totalPageCount=" + totalPageCount + "]";
	}
	
	
	
	

}
