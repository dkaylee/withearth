package com.withearth.community.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.domain.MatListView;
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
		
		return matListService.getListView(param);
	}
	

	
	
}
