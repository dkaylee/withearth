package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.community.service.EditMatService;


@Controller
public class MatViewController {
	
	// 게시물 등록
	@RequestMapping(value="/matzip/addmatForm")
	public String getAddForm() {
			
		return "/matzip/addmatForm";
	}
	
	// 맛집 리스트
	@RequestMapping(value = "/matzip/matlist")
	public String getMatList() {
		
		return "/matzip/matlist";
	}
	
	
	// 맛집 상세보기
	@RequestMapping(value="/matzip/matDetailView")
	public String getMatDetail() {
		
		return "/matzip/matDetailView";
	}
	
		
	// 맛집 수정
	@RequestMapping(value="/matzip/editmatForm")
	public String editmatForm() {
		
		return "matzip/editmatForm";
	}


}
