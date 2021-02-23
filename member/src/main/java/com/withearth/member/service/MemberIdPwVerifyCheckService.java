package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;

@Service
public class MemberIdPwVerifyCheckService {
	
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder cryptPasswordEncoder;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String checkIdPw(String id,String pw) {
		
		String check = null;
		dao = template.getMapper(MemberDAO.class);
		Member member = dao.compareSecretpw(id);
		String dbpw = member.getPw();
		boolean pwMatch = cryptPasswordEncoder.matches(pw, dbpw);
		
		if(pwMatch) {
			check = dao.selectMemberByIdPwVerifyCount(id,dbpw)>0?"N":"Y";
		}
		
		return check;
	}
}
