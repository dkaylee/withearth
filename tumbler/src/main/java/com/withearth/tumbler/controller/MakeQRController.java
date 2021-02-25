package com.withearth.tumbler.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.WriterException;
import com.withearth.tumbler.dao.CafeDao;
import com.withearth.tumbler.domain.CafeRequest;
import com.withearth.tumbler.service.MakeQRService;
 
@RestController
@RequestMapping("/rest/tumbler/saving")
public class MakeQRController {
   	
	
	  private CafeDao dao;
	  
	 @Autowired 
	 private SqlSessionTemplate template;
	 @Autowired 
	 private MakeQRService makeqrService;
	 
	 


	 @GetMapping("/tumbler/{idx}/{cafe_idx}") 
	public String makeqr(HttpServletRequest request, 
			HttpSession session,
			Model model,
			@PathVariable("idx") int idx,
		    @PathVariable("cafe_idx") int cafeIdx,
			CafeRequest cafeRequest)throws IOException, 
	        WriterException {
		 
		 	

      return makeqrService.make(idx,cafeIdx,request, session,model); 
      
	 }
	 
	 
	
	 
	 
 }
