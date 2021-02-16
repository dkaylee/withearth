package com.withearth.community.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.domain.MatzipVo;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class AddMatzipService {
	
	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Transactional
	public int addMatzip(
			MatAddRequest matRequest, 
			HttpServletRequest request) {
		
		int result = 0;
		
		MatzipVo matzip = matRequest.toMatzip();
		
		// 데이터 베이스 입력
		dao = template.getMapper(MatDao.class);
		
		// 게시물 카운트
		dao.matUpdateCnt();
		
		// 맛집 DB insert
		result = dao.insertMatzip(matzip);
		
		//log.info(result);
		
		return result;
	}
	

}
