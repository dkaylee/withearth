package com.withearth.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.domain.MatListView;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.domain.SearchParam;
import com.withearth.community.service.MatzipListService;

@RestController
public class MatzipListController {
	
	@Autowired
	private MatzipListService matListService;
	
	@RequestMapping(value = "/matzip/matlist/listInfo")
	public MatListView getMatList(
			Model model,
			SearchParam param) {
		
		System.out.println("search param: "+param);
		
//		model.addAttribute("list", matListService.getListView());
//		model.addAttribute("matlist", matListService.getListView(param));
		
		return matListService.getListView(param);
	}
	
	@RequestMapping(value = "/matzip/matlist/totalinfo")
	public List<MatzipVo> getListView(){
		
		return matListService.getListView();
	}
	
	
}
