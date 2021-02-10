package com.withearth.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.community.domain.MatzipVo;
import com.withearth.community.matdao.MatDao;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MatzipListService {

	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<MatzipVo> getListView(){
	
		List<MatzipVo> matlist = null;
		
		dao = template.getMapper(MatDao.class);
		
		matlist = dao.selectAllMatList();
		
		// log.info(matlist);
		
		
		return matlist;
	}
	
	
	
}
