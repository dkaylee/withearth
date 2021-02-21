package com.aia.dona.controlller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.dona.service.HeartCountService;
import com.aia.dona.service.HeartShowService;

@RestController
@RequestMapping("/rest/user/heart")
public class HeartController {
	
	@Autowired
	HeartCountService countService;
	@Autowired
	HeartShowService showService;
	
	// 좋아요 누른 적 있는지 확인하고, 추가 or 삭제 후 cnt 반환
	@GetMapping
	public HashMap<String,Object> createHeart(
			@RequestParam("idx") int idx, 
			@RequestParam("donaIdx") int donaIdx) {
		
	   System.out.println("idx : "+idx+", donaIdx : "+donaIdx);	  
		
		return countService.postHeartCount(idx, donaIdx);
	}
	// 좋아요 누르기 전 상세페이지에 노출될 cnt 반환
    @GetMapping("/list")
	public HashMap<String,Object> showHeartCnt(
			@RequestParam("idx") int idx, 
			@RequestParam("donaIdx") int donaIdx
			) {
		
		return showService.showHeartCount(idx, donaIdx);
	}

    // 메인 화면에서 노출될 cnt합계 반환
    @GetMapping("/sum")
    public int showMainHeartCnt(
    		@RequestParam("donaIdx") int donaIdx
    		) {
    	
    	return showService.showHeartCntbyDonaIdx(donaIdx);
    }
}
