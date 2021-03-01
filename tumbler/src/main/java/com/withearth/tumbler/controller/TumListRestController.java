package com.withearth.tumbler.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.tumbler.domain.Tumbler;
import com.withearth.tumbler.domain.TumpointView;
import com.withearth.tumbler.service.CafeListSerivce;
import com.withearth.tumbler.service.TumListService;

@RestController
@RequestMapping("/tumbler/tumlist/rest")
public class TumListRestController {
	
	@Autowired
	private TumListService tumlistService;
	
	  //포인트 정보 가져오기
	  @GetMapping
	  @CrossOrigin
	  public TumpointView tumList(@RequestParam(value="p",defaultValue="1") int page, Model model,  HttpServletRequest request) {
	  
	
	 //model.addAttribute("listView", tumlistService.getTumList(idx));
	  
	  //return tumlistService.getTumListView(page);
	  return tumlistService.getTumListView(page);
	  
	  }
	

	

}
