package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;

@Service
public class MemberIdPwCheckService {
	
	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String checkIdPw(String id,String pw) {
		dao = template.getMapper(MemberDAO.class);
		return dao.selectMemberByIdPwCount(id,pw)>0?"Y":"N";
	}
}
