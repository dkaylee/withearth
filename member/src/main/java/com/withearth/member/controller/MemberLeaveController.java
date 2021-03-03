/*
package com.withearth.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.withearth.member.service.MemberLeaveService;

@RestController
public class MemberLeaveController {

	@Autowired
	private MemberLeaveService leaveService;
	
	@GetMapping("/member/leave")
	public String idcheck(
			@RequestParam("idx") int idx
			) {
		return leaveService.checkId(idx);
	}
	
	
	
	
}
*/