package com.aia.dona.controlller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aia.dona.domain.Message;
import com.aia.dona.domain.Message;

@Controller
public class MainViewController {
	
	@RequestMapping("/main/list")
	public String goListForm(
			@RequestParam(value="p", defaultValue ="1") int p
		
			) {
		
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
			@RequestParam("idx") int donaIdx) {
		
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
			@RequestParam("oid") int oid,
			@RequestParam("uid") int uid,
			HttpSession session,
			ModelAndView mv
			) {	
		
		
		
		mv.setViewName("post/chat/chatView");
		mv.addObject("donaIdx", donaIdx);
		mv.addObject("oid", oid);
		mv.addObject("uid", uid);
		
		session.setAttribute("user", uid);
		
		Message msg = new Message();
		msg.setDonaIdx(donaIdx);
		msg.setOwnerIdx(oid);
		msg.setUserIdx(uid);
				

		return mv;
	}

}
