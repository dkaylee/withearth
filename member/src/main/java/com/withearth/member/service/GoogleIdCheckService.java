package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;


@Service
public class GoogleIdCheckService {

private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String checkId(String id) {
		dao = template.getMapper(MemberDAO.class);
		return dao.googleRegCheckCount(id)>0?"Y":"N";
	}
	
	
}
