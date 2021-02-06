package com.withearth.tumbler.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.CafeDao;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CafelistService {

	private CafeDao dao;

	@Autowired
	private SqlSessionTemplate template;
	
	//CafeListView cafelist;

	public String getListView(HttpServletRequest request) {

		return "cafelist";
	}
}
