package com.withearth.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;

@Service
public class MemberIdPwCheckService {
	
	private MemberDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder cryptPasswordEncoder;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public String checkIdPw(String id,String pw) {
		String check = "N";
		
		dao = template.getMapper(MemberDAO.class);
		
		//로그인 할때 아이디가 db에 없으면 오류가 남
		if(dao.selectMemberByIdCount(id)==0) {
			 check = "N"; 
		}else {
		
			//암호화된 pw와 비교
			Member member = dao.compareSecretpw(id);
			String dbpw = member.getPw();
			boolean pwMatch = cryptPasswordEncoder.matches(pw, dbpw);
			
			if(pwMatch) {
				check = "Y";
			}else {
				check = "N";
			}
		}
		return check;
	}
}
