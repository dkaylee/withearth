package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;

@Service
public class AjaxTestTwoService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public Member ajaxTest(int idx) {
		dao = template.getMapper(MemberDAO.class);
		Member member = dao.selectLoginIdx(idx);
		return  member;
		
	}
}
