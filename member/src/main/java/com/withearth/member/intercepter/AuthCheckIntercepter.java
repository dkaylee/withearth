package com.withearth.member.intercepter;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		//로그인 여부 확인
		//로그인 -> return true
		//비로그인 -> return false, redirect 로그인페이지
		HttpSession session = request.getSession(false); //session이 null일때 유지하기 위함
		
		if(session != null && session.getAttribute("loginInfo")!=null) {
			return true;
		}
		


		response.sendRedirect("www.withearthtest.tk/member2/member/login");

		return false;
		//다음 -> servlet-context
	}
	
	
}
