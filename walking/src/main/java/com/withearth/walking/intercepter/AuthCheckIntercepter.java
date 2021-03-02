package com.withearth.walking.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler)
			throws Exception {
		
		// 로그인 여부를 확인 
		// -> 로그인 상태: return true 처리 
		// 비로그인 상태 -> return false, 로그인 페이지로 redirect
		
		// Session이 null일 경우 그대로 유지하기 위해 false 전달
		HttpSession session = request.getSession(false);  
		
		if(session!=null && session.getAttribute("loginInfo")!=null) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath()+"/member/login");
		 
		return false;
	}
	
}
