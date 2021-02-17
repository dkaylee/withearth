/*
package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;

@Service
public class MemberFindPwService {

	private MemberDAO dao;

	@Autowired
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String CheckId(String id) {
		dao = template.getMapper(MemberDAO.class);
		return dao.selectMemberByIdCount(id)>0?"Y":"N";
	}

}
*/