package com.withearth.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.service.MatzipDeleteService;

@CrossOrigin
@RestController
public class MatzipDeleteController {
	
	@Autowired
	private MatzipDeleteService deleteService;
	
	// 게시글에서 삭제
	@RequestMapping(value = "/matzip/deleteMat", method=RequestMethod.POST)
	public int deleteMatzip(
			@RequestParam("matIdx") int matIdx) {

		return deleteService.deleteMatzip(matIdx);
	}
	
	// 회원이 삭제
	@RequestMapping(value = "/matzip/deleteMpost", method=RequestMethod.POST)
	public int deleteMatpost(
			@RequestParam("Idx") int Idx) {

		return deleteService.deleteMatpost(Idx);
	}
	
	// 파일 삭제
	@RequestMapping(value = "/matzip/deleteFiles", method=RequestMethod.POST)
	public int deleteFiles(
			@RequestParam("matIdx") int matIdx) {

		return deleteService.deleteFiles(matIdx);
	}

	
	
}
