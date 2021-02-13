package com.withearth.tumbler.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withearth.tumbler.service.TumListService;

@Controller
public class TumListController {

	@Autowired
	private TumListService tumlistService;

	@RequestMapping("/tumbler/tumlist1")
	public String tumlist(Model model, HttpServletRequest request) {
		
	int idx = 1;
       model.addAttribute("listView", tumlistService.getTumList(idx));
		
		return "tumbler/tumlist1";
	}

	@RequestMapping("/tumbler/tumlist")
	public String getTumList(Model model, HttpServletRequest request) {
		// 로그인 합친후 세션에서 회원idx를 가지고 와야함.
		// HttpSession session = request.getSession();
		// int idx = (int) session.getAttribute("idx");
		int idx = 1;
		model.addAttribute("listView", tumlistService.getTumList(idx));

		return "tumbler/tumlist";
	}

}
