package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.withearth.community.service.DetailViewService;


@Controller
public class MatViewController {
	
	@Autowired
	private DetailViewService detailService;
	
	// 맛집 리스트
	@RequestMapping(value = "/matzip/matlist")
	public String getMatList() {
		
		return "/matzip/matlist";
	}
	
	// 맛집 상세보기
	@RequestMapping(value="/matzip/matDetailView")
	public String getMatDetail(
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		model.addAttribute("matzip", detailService.getMatzip(matIdx));
		
		return "/matzip/matDetailView";
	}
	
	// 맛집 삭제
	@RequestMapping(value = "/matzip/delete")
	public String deleteMatzip(
			@RequestParam("matIdx") int matIdx) {
		
		return "matzip/deletemat";
	}
	
	
	// 맛집 수정
	@RequestMapping(value="/matzip/editmatForm")
	public String editmatForm(
			@RequestParam("matIdx") int matIdx) {
		
		
		return "matzip/editmatForm";
	}


}
