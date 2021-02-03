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
public class CafelistService {

	private CafeDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<Cafe> getListView() {

		List<Cafe> cafelist = null;

		try {

			dao = template.getMapper(CafeDao.class);

			cafelist = dao.selectAllCafeList();
			log.info(cafelist);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cafelist;
	}
}
