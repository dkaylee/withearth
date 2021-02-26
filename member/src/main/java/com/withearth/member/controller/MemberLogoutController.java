package com.withearth.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberLogoutController {
	
	@RequestMapping("/member/logout")
		public String logout(HttpSession session, RedirectAttributes rda) {
		session.invalidate();
		System.out.println("로그아웃은 됐지만 창은 안뜹니다.");
		rda.addAttribute("type","delete");
		rda.addAttribute("result", "ok");
		return "redirect:/";
	}
}
