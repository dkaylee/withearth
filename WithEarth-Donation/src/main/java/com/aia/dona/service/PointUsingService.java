package com.aia.dona.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.PointDao;
import com.aia.dona.domain.Point;

@Service
public class PointUsingService {

	private PointDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int usePoint(int idx, int usepoint) {
		
		dao = template.getMapper(PointDao.class);
		
		int sum = dao.selectPointSum(idx);
		
		Point point = new Point();
		point.setIdx(idx);
		point.setSaving_point(-usepoint);
		point.setSaving_system("포인트 사용");
		point.setPointsum(sum-usepoint);
				
		return dao.insertUsingPoint(point);		
	}
}
