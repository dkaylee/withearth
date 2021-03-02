package com.withearth.walking.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.walking.dao.WalkingDao;

@Service
public class CourseDeleteService {

	private WalkingDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int deleteCourse(int course_idx) {
		dao = template.getMapper(WalkingDao.class);
		
		return dao.deleteCourseByIdx(course_idx);
				
	}
	
	
	
}
