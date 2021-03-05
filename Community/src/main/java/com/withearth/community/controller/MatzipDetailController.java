package com.withearth.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.service.DetailViewService;

@RestController
public class MatzipDetailController {

	@Autowired
	private DetailViewService detailService;
	
	@GetMapping("/matzip/matDetail")
	public MatzipVo getMatDetail(
			@RequestParam("matIdx") int matIdx
			) {
		
		return detailService.getMatzip(matIdx);
	}
	
	@GetMapping("/matzip/filelist")
	public List<FileVo> getfiles(
			@RequestParam("matIdx") int matIdx
			) {
		
		return detailService.getFileList(matIdx);
	}
	

	
	
//	@RequestMapping(value="/matzip/matDetail", method = RequestMethod.GET)
//	public MatzipVo getMatDetail(
//			@RequestParam("matIdx") int matIdx
//			) {
//		
//		return detailService.getMatzip(matIdx);
//	}
//	
//	@RequestMapping(value="/matzip/filelist", method = RequestMethod.GET)
//	public List<FileVo> getfiles(
//			@RequestParam("matIdx") int matIdx
//			) {
//		
//		return detailService.getFileList(matIdx);
//	}
	
	
	
	
}
