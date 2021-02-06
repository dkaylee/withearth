package com.withearth.tumbler.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.withearth.tumbler.Member;
import com.withearth.tumbler.dao.MemberDAO;

@Service
public class TumLoginSerivce {

	private MemberDAO dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@RequestMapping(value="/" , method = {RequestMethod.GET, RequestMethod.POST})
	public boolean login(
			HttpServletRequest request,
			HttpServletResponse response
			) {
		String id = request.getParameter("userid");
		String pw = request.getParameter("pw");
		String chk = request.getParameter("chk");
		
		
		dao = template.getMapper(MemberDAO.class);
		
		boolean loginCheck = false;
		
		
		Member member = dao.selectTumLogin(id,pw);
		
		
		if(member!=null) {
			
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
		
		return loginCheck;
		
	}
	
	
	
	
	
}