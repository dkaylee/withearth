package com.withearth.member.walking.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.walking.dao.WalkingDao;
import com.withearth.member.walking.domain.Course;
import com.withearth.member.walking.domain.CourseListView;
import com.withearth.member.walking.domain.SearchParam;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CourseListService {
	
	
	private WalkingDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public CourseListView getListView(SearchParam param, int idx) {
		
		System.out.println("service list: " + idx);
		
		CourseListView listView = null;
		
		try {
			
			// WalkingDao 구현체 생성
			dao = template.getMapper(WalkingDao.class);
			
			System.out.println("pageNumber: " + param.getP());
			
			int cntPerPage = 5;
			
			int startRow = (param.getP() - 1) * cntPerPage;
			int endRow = startRow + cntPerPage - 1;

			Map<String, Object> listMap = new HashMap<String, Object>();
			listMap.put("index", startRow);
			listMap.put("count", cntPerPage);
			listMap.put("searchParam", param);
			listMap.put("idx", idx);

			// int totalCourseCount = dao.selectTotalCount();
			int totalCourseCount = dao.selectSearchCourseCount(listMap);
			System.out.println("courseTotalCount : " + totalCourseCount);

			List<Course> courseList = dao.selectCourseList(listMap);
			System.out.println(courseList);

			listView = new CourseListView(param.getP(), totalCourseCount, cntPerPage, courseList, startRow, endRow);

			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return listView;
		
	}
	
	public List<Course> getListView() {

		List<Course> list = null;

		try {
			// MemberDao 구현체 생성
			dao = template.getMapper(WalkingDao.class);

			list = dao.selectAllCourseList();
			System.out.println(list);
			log.info(list);


		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getCourseTotalCount(int idx) {
		
		dao = template.getMapper(WalkingDao.class);
		return dao.selectTotalCount(idx);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}