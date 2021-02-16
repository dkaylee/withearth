package com.withearth.community.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.MatzipVo;

@Service
public class DetailViewService {
	
	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public MatzipVo getMatzip(int matIdx) {
		
		dao = template.getMapper(MatDao.class);
		
		return dao.selectMatByIdx(matIdx);
	}
	

}
