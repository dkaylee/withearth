package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.EmailUserCheckService;
import com.withearth.member.service.MemberIdPwCheckService;

@RestController
public class EmailUserCheckController {

		@Autowired
		private EmailUserCheckService emailUserCheckService;
		
		@GetMapping("/member/emailusercheck")
		public String idcheck(
				@RequestParam("id") String id
				) {
			return emailUserCheckService.checkId(id);
		}
}
