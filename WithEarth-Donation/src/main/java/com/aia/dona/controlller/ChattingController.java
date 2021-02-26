package com.aia.dona.controlller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.dona.domain.Message;
import com.aia.dona.service.ChatUserCheckService;

@RestController
@RequestMapping("/rest/user/post/chat")
@CrossOrigin
public class ChattingController {
	
	@Autowired
	ChatUserCheckService checkService;
	
	@GetMapping("/check")
	public List<Message> checkBeforeChat(
			@RequestParam("donaIdx") int donaIdx,
			@RequestParam("rid") int roomIdx
			) {

			
		return checkService.checkUser(donaIdx, roomIdx);			
	}
	
	

}
