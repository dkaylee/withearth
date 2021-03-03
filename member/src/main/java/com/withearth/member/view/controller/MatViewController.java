package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class MatViewController {
	
	
	
	// 맛집 리스트
	@RequestMapping(value = "/matzip/matlist")
	public String getMatList() {
		
		return "/matzip/matlist";
	}
	
	// 게시물 등록
	@RequestMapping(value="/matzip/addmatForm", method = RequestMethod.GET)
	public String getAddForm() {
		
		return "/matzip/addmatForm";
	}
	
	// 맛집 상세보기
	@RequestMapping(value="/matzip/matDetailView")
	public String getMatDetail(
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		
		
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
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		
		
		return "matzip/editmatForm";
	}


}
