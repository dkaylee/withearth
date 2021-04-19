package com.withearth.member.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.withearth.member.community.service.WriteService;
import com.withearth.member.domain.WriteDTO;

@Controller
	@RequestMapping("/write")
	public class WriteController {

		@Autowired
		private WriteService writeS;
		
		@GetMapping
		public String writeView() {
			return "write";
		}
		
		@PostMapping
		public String writeResult(WriteDTO dto) {
			System.out.println(dto);
			int result = writeS.write(dto);
			System.out.println("완료");
			System.out.println(result);
			
			return "redirect:board/listPage?num=1";
		}
	}
