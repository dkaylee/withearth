package com.withearth.tumbler.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.CafeDao;
import com.withearth.tumbler.domain.Cafe;
import com.withearth.tumbler.domain.CafeRequest;

import lombok.extern.log4j.Log4j;

@Service
@Log4j	
public class CafeListSerivce {

	private CafeDao dao;
	private CafeRequest cdao;

	@Autowired
	private SqlSessionTemplate template;

	
	public List<Cafe> cafeView() {

		List<Cafe> cafelist = null; // 변수 만들어서 초기화
		dao = template.getMapper(CafeDao.class);
		cafelist = dao.selectCafeList();
		// System.out.println("카페리스트"+list);
		// log.info(list);

		return cafelist;

	}


	

	public List<Cafe> cafeInfo() {

		List<Cafe> list = null; // 변수 만들어서 초기화
		dao = template.getMapper(CafeDao.class);
		list = dao.selectLaglng();
		//System.out.println("카페좌표!!!!!"+list);
		// log.info(list);

		return list;

	}


}
