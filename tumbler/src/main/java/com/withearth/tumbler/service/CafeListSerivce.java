package com.withearth.tumbler.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.CafeDao;
import com.withearth.tumbler.domain.Cafe;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CafeListSerivce {

	private CafeDao dao;
	
//	@Autowired
//	private SqlSessionTemplate template; 
//	
//	public List<Cafe> cafeView () {
//		
//		List<Cafe> list = null; // 변수 만들어서 초기화
//		
//		
//		try {
//		dao = template.getMapper(CafeDao.class);
//		
//		
//		list =dao.selectCafeList();
//		//System.out.println("카페리스트"+list);
//		//log.info(list);
//		
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return list ;
//
//	}
	
	
	
}
