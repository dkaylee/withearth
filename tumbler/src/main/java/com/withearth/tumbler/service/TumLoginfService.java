package com.withearth.tumbler.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.tumbler.dao.TumblerDao;
import com.withearth.tumbler.domain.Tumbler;

@Service
public class TumLoginfService {
	
	private TumblerDao dao;

	
	@Autowired
	private SqlSessionTemplate template;
	
	public void login(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("userid");
		String pw = request.getParameter("pw");
		String chk = request.getParameter("chk");
		
		dao = template.getMapper(TumblerDao.class);
		
		boolean loginCheck = false;
		
		// 1. Dao -> id, pw, 데이터로 검색 => 존재하면 로그인 처리 아니라면
				Tumbler tumbler = dao.selectTumLogin(id, pw);
				
				

		
		

		
	}
}