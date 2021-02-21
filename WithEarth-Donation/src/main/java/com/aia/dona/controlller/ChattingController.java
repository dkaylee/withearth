package com.aia.dona.controlller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.dona.domain.Message;
import com.aia.dona.service.ChatUserCheckService;

@RestController
@RequestMapping("/rest/user/post/chat")
public class ChattingController {
	
	@Autowired
	ChatUserCheckService checkService;
	
	@GetMapping("/check")
	public List<Message> checkBeforeChat(
			@RequestParam("uid") int uid,
			@RequestParam("oid") int oid,
			@RequestParam("donaIdx") int donaIdx
			) {

			
		return checkService.checkUser(uid, oid, donaIdx);			
	}
	
	
	

}
