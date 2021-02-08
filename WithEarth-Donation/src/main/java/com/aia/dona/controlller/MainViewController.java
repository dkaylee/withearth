package com.aia.dona.controlller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainViewController {
	
	@RequestMapping("/main/list")
	public String goMainForm() {
		
		return "post/donaMain";
	}
	
	@RequestMapping("/main/post/upload")
	public String goWrtieForm() {
		
		return "post/writeForm";
	}
	
	@RequestMapping("/main/post/list")
	public String goListView() {
		
		return "post/postList";
	}
	@RequestMapping("/main/post/detail")
	public String goDetailView(
			@RequestParam("idx") int donaIdx) {
		
		return "post/postDetailView";
	}

}
