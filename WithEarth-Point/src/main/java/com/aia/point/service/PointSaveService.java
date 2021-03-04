package com.aia.point.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.point.dao.PointDao;
import com.aia.point.domain.Point;

@Service
public class PointSaveService { // 포인트를 저장하는 서비스

	private PointDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public int userTumPoint(int idx, int tIdx) {

		int tumblrPoint = 100;

		dao = template.getMapper(PointDao.class);

			int sum = dao.selectPointSum(idx);

			Point point = new Point();
			point.setIdx(idx);
			point.setTum_idx(tIdx);
			point.setSaving_point(tumblrPoint);
			point.setSaving_system("텀블러사용 인증");
			point.setPointsum(sum + tumblrPoint);
						
		return dao.addTumPoint(point);
	}
	

	public int userCoursePoint(int idx, int cIdx, float distance) {
        System.out.println("거리 : "+distance);
		float coursePoint =  distance * 100;

		dao = template.getMapper(PointDao.class);
		
		int sum = dao.selectPointSum(idx);

		Point point = new Point();
		point.setIdx(idx);
		point.setCourse_idx(cIdx);
		point.setSaving_point((int)coursePoint);
		point.setSaving_system("도보 인증");
		point.setPointsum(sum + (int)coursePoint);
		
		return dao.addCoursePoint(point);
	}

}
