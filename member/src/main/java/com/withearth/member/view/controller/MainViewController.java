package com.withearth.member.view.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.withearth.member.dona.domain.Message;
import com.withearth.member.dona.service.ChatRoomIdCheckService;

@Controller
public class MainViewController {
	
	@Autowired
	ChatRoomIdCheckService roomChkService;

	
	@RequestMapping("/dona/main/list")
	public String goListForm(
			@RequestParam(value="p", defaultValue ="1") int p,
			HttpSession session
			) {
		session.setAttribute("user", 1);
		
		return "dona/post/donaMain";
	}
	
	@RequestMapping("/dona/main/list/search")
	public String goListSearchForm(
			@RequestParam(value="p", defaultValue ="1") int p,
			@RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword
		
			) {
		
		return "dona/post/donaMain";
	}
	
	@RequestMapping("/dona/main/post/upload")
	public String goWrtieForm() {
		
		return "dona/post/writeForm";
	}
	
	
	@RequestMapping("/dona/main/post/detail")
	public String goDetailView(
			@RequestParam("idx") int donaIdx,
			HttpServletRequest request,
			Model model) {
				
	   HttpSession session  = request.getSession(false);
	   session.setAttribute("idx", 3);
	   System.out.println(session);
	   
		return "dona/post/postDetailView";
	}
		
	@RequestMapping("/dona/main/post/mypost")
	public String goUpdateView(
			@RequestParam("idx") int donaIdx) {
		
		return "dona/post/myPostList";
	}
	
	@RequestMapping("/dona/main/post/edit")
	public String goEditForm(
			@RequestParam("idx") int donaIdx) {
		
		return "dona/post/postEditForm";
	}
	
	@RequestMapping("/post/chat")
	public ModelAndView getChatInfo(
			@RequestParam("donaIdx") int donaIdx,
			@RequestParam("uid") int uid,
			@RequestParam("to") int to,
			@RequestParam("rid") int rid,
			HttpSession session,
			ModelAndView mv
			) {	
		
		Message msg = new Message();
		msg.setDonaIdx(donaIdx);
		msg.setUserIdx(uid);
		msg.setTo(to);
		
		int result = roomChkService.checkRoomIdx(msg);
		
		if(result==0) {
			msg.setRoomIdx(msg.getRoomIdx());
			System.out.println(msg.getRoomIdx());
			mv.addObject("rid", rid);
		} else {
			msg.setRoomIdx(result);
			mv.addObject("rid", msg.getRoomIdx());
		}
			
		mv.setViewName("post/chat/chatView");
		mv.addObject("donaIdx", donaIdx);
		mv.addObject("uid", uid);
		mv.addObject("to", to);
		
		
		session.setAttribute("user", uid);

		return mv;
	}

}