package com.withearth.member.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;
import com.withearth.member.domain.NaverInfo;

@Service
public class MemberNaverService {
	
	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Transactional
	public int memberReg(NaverInfo ninfo,HttpServletRequest request) {
		int result = 0;
		
		Member member = ninfo.toMemeberfromgoogle();
		//db입력
		dao = template.getMapper(MemberDAO.class);
		//db insert
		result = dao.insertMember(member);
	
		return result;
	}
	
	
}
