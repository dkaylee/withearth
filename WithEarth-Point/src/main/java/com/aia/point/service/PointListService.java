package com.aia.point.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.point.dao.PointDao;
import com.aia.point.domain.Point;

@Service
public class PointListService {
	
	private PointDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<Point> getPointList(int idx) {
		
		dao = template.getMapper(PointDao.class);
				
		return dao.selectPointList(idx);
	}

}
