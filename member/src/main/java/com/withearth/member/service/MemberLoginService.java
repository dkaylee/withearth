package com.withearth.member.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withearth.member.dao.MemberDAO;
import com.withearth.member.domain.Member;

@Service
public class MemberLoginService {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public boolean login(
			HttpServletRequest request,
			HttpServletResponse response
			) {
		String id = request.getParameter("userid");
		String pw = request.getParameter("pw");
		String chk = request.getParameter("chk");
		
		//이거 뭐야?
		dao = template.getMapper(MemberDAO.class);
		
		boolean loginCheck = false;
		
		
		Member member = dao.selectLogin(id,pw);
		
		//member가 null이 아닐 경우,
		if(member!=null) {
			if(member.getVerify()=='Y') {
			//현재 세션의 속성에 LoginInfo 인스턴스를 저장..?
			request.getSession().setAttribute("loginInfo", member.toLoginInfo());
			loginCheck = true;
			
			//쿠키처리
			if(chk!=null && chk.equals("on")) {
				//쿠키 생성
				Cookie c = new Cookie("uid",id);
				c.setMaxAge(60*60*24*365);
				response.addCookie(c);
			} else {
				//쿠키소멸
				Cookie c = new Cookie("uid",id);
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
		} else {
			loginCheck = true;
			request.setAttribute("msg", "인증되지 않은 이메일입니다. 인증 후 로그인 해주세요.");
		}
		
		return loginCheck;
	
	
	
	
	
	
}
}
