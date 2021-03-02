package com.withearth.member.view.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.withearth.member.walking.domain.CourseSettingRequest;
import com.withearth.member.walking.service.CourseSettingService;

@Controller
public class WalkingServiceController {

	@Autowired
	private CourseSettingService courseSetService;
	
	@GetMapping(value="/member/loc/walkingservice")
	public String getcourseSet() {
		return "/loc/walkingservice";
	}
	
	// 코스 설정 후 완료 안내 페이지
	  
		  @RequestMapping(value="/member/loc/walkingservice", method = RequestMethod.POST)
		  @ResponseBody
		  public String courseSetView( 
				  CourseSettingRequest setRequest,
				  HttpServletRequest request, 
				  Model model ) {
		  
			  System.out.println(setRequest);
			  
			  int result = courseSetService.courseSet(setRequest, request);
			  
			  model.addAttribute("result", result);
			  
			  return String.valueOf(result) ;  // 문자열로 반환 
		  }
}
