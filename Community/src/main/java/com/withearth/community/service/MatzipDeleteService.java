package com.withearth.community.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.community.dao.MatDao;

@Service
public class MatzipDeleteService {

	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public int deleteMatzip(int matIdx) {
		
		int result = 0 ;
		
		dao = template.getMapper(MatDao.class);
		result = dao.deleteMatzipByIdx(matIdx);
		
		return result;
	}
	
	
}
