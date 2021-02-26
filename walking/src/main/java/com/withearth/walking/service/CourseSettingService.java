package com.withearth.walking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.walking.dao.WalkingDao;
import com.withearth.walking.domain.Course;
import com.withearth.walking.domain.CourseSettingRequest;

@Service
public class CourseSettingService {

	private WalkingDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	// 데이터베이스 저장
	//@Transactional
	public int courseSet(CourseSettingRequest setRequest, HttpServletRequest request) {
		int result = 0;
		int point = 0;
		
		Course course = setRequest.toCourse();
		System.out.println(course);
		
		try {
			// 데이터 베이스 입력
			dao = template.getMapper(WalkingDao.class);
			
			//course_count -> courseCount +1 update
			//dao.courseCountUpdate();
			
			// 코스 DB insert
			result = dao.insertCourse(course);
			
			System.out.println("course"+course);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	// point 적립을 위한 course_idx, loc_km 전달
	public List<Course> pointCourse(){
		dao = template.getMapper(WalkingDao.class);
		
		return dao.pointCourse();
	}
	
}
