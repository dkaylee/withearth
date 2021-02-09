package com.withearth.login.controller;

import java.awt.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.web.servlet.mvc.method.annotation.RequestAttributeMethodArgumentResolver;

import com.withearth.member.domain.KakaoInfo;

@Controller
@RequestMapping("/member/KakaoLogin")
public class KakaoLoginController {

	//requestbody 클라이언트가 전송하는 Http 요청의 Body내용을 Java Object로 변환시켜주는 역할
	//Json이나 XML과 같은 형태의 데이터를 Jackson 등의 MessageConverter를 활용하여 Java Object로 변환한다. 
	
	//ajax로 보낸 카카오 데이터 가져오기
	
	@RequestMapping(value="/member/KakaoLogin", method=RequestMethod.POST)
	public String savekao(HttpServletRequest request, KakaoInfo kinfo) {
	    kinfo.setNick(request.getParameter("ka_name"));
	    kinfo.setPimg(request.getParameter("ka_img"));
	    kinfo.setThumimg(request.getParameter("ka_thum"));
	    kinfo.setEmail(request.getParameter("ka_email"));
		return "member/KakaoLogin";
	}

	
}
