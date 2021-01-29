package com.aia.dona.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.PointDao;
import com.aia.dona.domain.Point;

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
