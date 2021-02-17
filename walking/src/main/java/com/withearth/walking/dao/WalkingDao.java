package com.withearth.walking.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.withearth.walking.domain.Course;

public interface WalkingDao {

	// 코스 등록
	int insertCourse();


	// 코스의 총 개수
	int selectTotalCount();

	// 코스 리스트(페이지 번호에 맞는 코스 리스트 구하기)
	//List<Course> selectCourseList(int startRow, int cntPerPage);
	List<Course> selectCourseList(Map<String, Object> param);

	//Rest API - GET
	List<Course> selectAllCourseList();

	// 검색한 코스의 수
	int selectSearchCourseCount(Map<String, Object> listMap);

	// 코스 정보 삭제
	int deleteCourseByIdx(int idx);

	// 코스 정보 조회 : idx로 조회
	Course selectCourseByIdx(int idx);

	// 코스 정보 update
	int updateCourse(Course Course);

	// id 존재 유무 확인
	int selectCourseByIdCount(String id);

	// idx, verify 조건으로 조회
	int selectCourseByIdxVerify(int index);

	// 인증처리 verify = 'Y'
	int updateCourseVerify(int idx, String code);

}
