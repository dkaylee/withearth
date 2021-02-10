package com.withearth.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.service.UploadService;

@Controller
public class FileUploadController {
	
	
	private UploadService uploadService;
	
	
	@RequestMapping("/comm/addmatForm")
	public String uploadForm() {
		
		return "comm/addmatForm";
	}
	
	@RequestMapping("/comm/addmatView")
	public String uploadView(
			Model model,
			MatAddRequest matRequest,
			FileVo fileVo,
			MultipartHttpServletRequest mprequest
			) {
		System.out.println(fileVo);
		int result = uploadService.uploadFile(matRequest,fileVo, mprequest);
		
		model.addAttribute("result", result);
		
		return "comm/addView";
	}

}
