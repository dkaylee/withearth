package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.MemberIdPwVerifyCheckService;

@RestController
public class MemberIdPwVerifyController {

		@Autowired
		private MemberIdPwVerifyCheckService idpwverifycheckService;
		
		@GetMapping("/member/idpwverifycheck")
		public String idcheck(
				@RequestParam("id") String id,
				@RequestParam("pw") String pw
				) {
			return idpwverifycheckService.checkIdPw(id,pw);
		}
}
