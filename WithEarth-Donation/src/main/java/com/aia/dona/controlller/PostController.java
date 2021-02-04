package com.aia.dona.controlller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/user/post")
public class PostController {
	
	public int uploadPost() {
		
		return 1;
	}

}
