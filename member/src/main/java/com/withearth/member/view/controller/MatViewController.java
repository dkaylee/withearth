package com.withearth.member.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MatViewController {
	
	// 게시물 등록
	@RequestMapping(value="/matzip/addmatForm")
	public String getAddForm() {
			
		return "/matzip/addmatForm";
	}
	
	// 게시물 완료
		@RequestMapping(value="/matzip/addmatView")
		public String getAddView() {
				
			return "/matzip/addmatView";
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
