package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.service.DetailViewService;
import com.withearth.community.service.EditMatService;


@Controller
public class MatViewController {
	
	@Autowired
	private DetailViewService detailService;
	
	@Autowired
	private EditMatService editMatService;
	
	
	// 맛집 리스트
	@RequestMapping(value = "/matzip/matlist")
	public String getMatList() {
		
		return "/matzip/matlist";
	}
	
//  게시물 등록
//	@RequestMapping(value="/matzip/addmatForm")
//	public String getAddForm(MatAddRequest matRequest,
//			FileVo file,
//			MultipartHttpServletRequest mprq) {
//		
//		return "/matzip/addmatForm";
//	}
	
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
			@RequestParam("matIdx") int matIdx,
			Model model
			) {
		
		model.addAttribute("matzip", editMatService.getEditMatzip(matIdx));
		
		
		return "matzip/editmatForm";
	}


}
