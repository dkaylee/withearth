package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.MemberIdPwCheckService;

@RestController
public class MemberIdPwCheckController {

		@Autowired
		private MemberIdPwCheckService idpwcheckService;
		
		@GetMapping("/member/idpwcheck")
		public String idcheck(
				@RequestParam("id") String id,
				@RequestParam("pw") String pw
				) {
			return idpwcheckService.checkIdPw(id,pw);
		}
}
