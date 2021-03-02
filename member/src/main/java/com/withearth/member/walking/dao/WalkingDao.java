package com.withearth.member.walking.dao;

import java.util.List;
import java.util.Map;

import com.withearth.member.walking.domain.Course;

public interface WalkingDao {

	// 1. 코스 등록 ->	()를 빈 칸으로 두면 loc_km등 데이터 값을 못 불러온다.
	int insertCourse(Course course);
	
	// 1-2. 포인트 전달을 위한 idx, 이동 거리 불러오기
	List<Course> pointCourse();
	
	// 2. 전체 회원의 수
	int courseCountUpdate();

	// 3. 코스의 총 개수
	int selectTotalCount();

	// 4. 코스 리스트(페이지 번호에 맞는 코스 리스트 구하기)
	//List<Course> selectCourseList(int startRow, int cntPerPage);
	List<Course> selectCourseList(Map<String, Object> param);

	// 5. Rest API - GET
	List<Course> selectAllCourseList();

	// 6. 검색한 코스의 수
	int selectSearchCourseCount(Map<String, Object> listMap);

	// 7. 코스 정보 삭제
	int deleteCourseByIdx(int course_idx);

	// 8. 코스 정보 조회 : idx로 조회
	Course selectCourseByIdx(int course_idx);

	// 코스 정보 update
	//int updateCourse(Course Course);

	// id 존재 유무 확인
	//int selectCourseByIdCount(String id);

	// 9. idx, verify 조건으로 조회
	int selectCourseByIdxVerify(int course_index);

	// 인증처리 verify = 'Y'
	//int updateCourseVerify(int idx, String code);

}
