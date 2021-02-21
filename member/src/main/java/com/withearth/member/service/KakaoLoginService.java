package com.withearth.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;

@Service
public class KakaoLoginService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public boolean login(
			HttpServletRequest request,
			HttpServletResponse response
			) {
		String id = request.getParameter("id");
		
		dao = template.getMapper(MemberDAO.class);
		
		boolean loginCheck = false;
		
		
		Member member = dao.kakaoSelectLogin(id);
		
		//member가 null이 아닐 경우,
		if(member!=null) {
			//현재 세션의 속성에 LoginInfo 인스턴스를 저장..?
			request.getSession().setAttribute("loginInfo", member.toLoginInfo());
			loginCheck = true;
			}
		
		return loginCheck;
	}
}
