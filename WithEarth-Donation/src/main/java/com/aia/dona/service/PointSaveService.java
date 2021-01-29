package com.aia.dona.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.PointDao;
import com.aia.dona.domain.CoursePoint;
import com.aia.dona.domain.Point;
import com.aia.dona.domain.TumblrPoint;

@Service
public class PointSaveService { // 포인트를 저장하는 서비스

	private PointDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public int userTumPoint(TumblrPoint tumPoint) {

		int tumblrPoint = 100;

		dao = template.getMapper(PointDao.class);

			int sum = dao.selectPointSum(tumPoint.getIdx());

			Point point = tumPoint.toPoint();
			point.setSaving_point(tumblrPoint);
			point.setSaving_system("텀블러사용 인증");
			point.setPointsum(sum + tumblrPoint);

			
			
		return dao.addTumPoint(point);
	}
	

	public int userCoursePoint(CoursePoint curPoint) {

		int coursePoint = 100;

		dao = template.getMapper(PointDao.class);
		
		int sum = dao.selectPointSum(curPoint.getIdx());

		Point point = curPoint.toPoint();
		point.setSaving_point(coursePoint);
		point.setSaving_system("도보 인증");
		point.setPointsum(sum + coursePoint);
		
		return dao.addCoursePoint(point);
	}

}
