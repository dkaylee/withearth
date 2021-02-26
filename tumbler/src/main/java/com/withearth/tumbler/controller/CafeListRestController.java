package com.withearth.tumbler.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.tumbler.domain.Cafe;
import com.withearth.tumbler.service.CafeListSerivce;

import lombok.extern.log4j.Log4j;

@RestController	
@RequestMapping("/rest/tumbler/tumlist1")
public class CafeListRestController {

	@Autowired
	private CafeListSerivce cafelistSerivce;
	

	@GetMapping("map")
	public List<Cafe> cafeList(){
		
		return cafelistSerivce.cafeInfo();
	}
	 



}
