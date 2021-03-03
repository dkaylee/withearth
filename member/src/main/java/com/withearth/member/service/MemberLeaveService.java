/*
package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;

@Service
public class MemberLeaveService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String checkId(int idx) {
		dao = template.getMapper(MemberDAO.class);
		return dao.leaveUser(idx)>0?"N":"Y";
	}
	
	
}
*/