package com.aia.dona.controlller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aia.dona.domain.Message;
import com.aia.dona.service.ChatRoomIdCheckService;

@Controller
public class MainViewController {
	
	@Autowired
	ChatRoomIdCheckService roomChkService;

	
	@RequestMapping("/main/list")
	public String goListForm(
			@RequestParam(value="p", defaultValue ="1") int p,
			HttpSession session
			) {
		session.setAttribute("user", 1);
		
		return "post/donaMain";
	}
	
	@RequestMapping("/main/list/search")
	public String goListSearchForm(
			@RequestParam(value="p", defaultValue ="1") int p,
			@RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword
		
			) {
		
		return "post/donaMain";
	}
	
	@RequestMapping("/main/post/upload")
	public String goWrtieForm() {
		
		return "post/writeForm";
	}
	
	
	@RequestMapping("/main/post/detail")
	public String goDetailView(
			@RequestParam("idx") int donaIdx,
			HttpServletRequest request,
			Model model) {
				
	   HttpSession session  = request.getSession(false);
	   session.setAttribute("idx", 3);
	   System.out.println(session);
	   
		return "post/postDetailView";
	}
		
	@RequestMapping("/main/post/mypost")
	public String goUpdateView(
			@RequestParam("idx") int idx) {
		
		return "post/myPostList";
	}
	
	@RequestMapping("/main/post/edit")
	public String goEditForm(
			@RequestParam("idx") int donaIdx) {
		
		return "post/postEditForm";
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
