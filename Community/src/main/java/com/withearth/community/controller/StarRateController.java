package com.withearth.community.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.StarRateRequest;
import com.withearth.community.service.StarReviewService;

@Controller
public class StarRateController {
	
	@Autowired
	private StarReviewService starService;
	
	@PostMapping(value="matzip/starRate")
	public int starRate(
			HttpServletRequest request,
			StarRateRequest starRequest,
			Model model
			) {
		
		int result = starService.addStarRate(request, starRequest);
		
		System.out.println(":::::::Result:::::::"+starRequest);
		System.out.println(":::::::Result:::::::"+request);
		model.addAttribute("result", result);
		
		return result;
	}
	
	@RequestMapping(value="matzip/starRateView", method = RequestMethod.POST)
	public String getReviewList(@RequestParam("matIdx") int matIdx,
			Model model ){
		
		model.addAttribute("review", starService.getStarRate(matIdx));
		
		
		return "matzip/matDetailView";
	}

}
