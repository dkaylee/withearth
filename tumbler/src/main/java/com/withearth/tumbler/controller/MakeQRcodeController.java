package com.withearth.tumbler.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.WriterException;
import com.withearth.tumbler.service.MakQRcodeService;
 
@Controller
public class MakeQRcodeController {
   
	@Autowired
	private MakQRcodeService makeQrcodeService;
	
   @RequestMapping("/qr/{cafe_idx}") 
   public String makeqr(HttpServletRequest request,
		                HttpSession session,
                        @PathVariable("cafe_idx") int idx,
                        Model model)
               throws WriterException, IOException { 
	
	
	String result = makeQrcodeService.makeqr(request, session, idx, model);
	
	  model.addAttribute("tumlist", makeQrcodeService.getClass());

     
	   return "tumblr/tumlist"; 
   }
   
  
   
   

}