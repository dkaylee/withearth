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

	@Autowired
	private SqlSessionTemplate template;

	/*
	public CafeRequest cafelistView() {

		CafeRequest cafelistView = null;

		dao = template.getMapper(CafeDao.class);

		List<Cafe> cafeList = dao.selectCafeList();
		// System.out.println("cafeList!!!!!!"+cafeList);

		cafelistView = new CafeRequest(cafeList);

		return cafelistView;

	}
	*/

	public List<Cafe> cafeView() {

		List<Cafe> list = null; // 변수 만들어서 초기화
		dao = template.getMapper(CafeDao.class);
		list = dao.selectCafeList();
		// System.out.println("카페리스트"+list);
		// log.info(list);

		return list;

	}
	

	/*
	 * public List<Cafe> cafeView () {
	 * 
	 * List<Cafe> list = null; // 변수 만들어서 초기화
	 * 
	 * dao = template.getMapper(CafeDao.class);
	 * 
	 * list =dao.selectCafeList(); System.out.println("카페리스트"+list);
	 * //log.info(list);
	 * 
	 * return list ;
	 * 
	 * }
	 */

}
