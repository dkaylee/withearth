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
	
	public int deleteFiles(int matIdx) {
		
		int result2 = 0;
		
		dao = template.getMapper(MatDao.class);
	
		result2 = dao.fileDelete(matIdx);
		
		return result2;
		
	}

	public int deleteMatpost(int idx) {
		
		int result3 = 0 ;
		
		dao = template.getMapper(MatDao.class);
		
		result3 = dao.deleteMatpostByIdx(idx);
		
		
		return result3;
	}
	
	
}
