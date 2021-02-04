package com.aia.dona.controlller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
