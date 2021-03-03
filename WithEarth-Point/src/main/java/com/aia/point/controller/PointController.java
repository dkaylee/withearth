package com.aia.point.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aia.point.domain.Point;
import com.aia.point.service.PointListService;
import com.aia.point.service.PointSaveService;
import com.aia.point.service.PointUsingService;

@RestController
@RequestMapping("/rest/user/point")
@CrossOrigin(origins = "*")
public class PointController {

	@Autowired
	private PointSaveService saveService;
	@Autowired
	private PointListService listService;
	@Autowired
	private PointUsingService usingService;
	
	// 회원idx를 받아서 해당 회원의 포인트 적립내역 반환
	@GetMapping("/list/{idx}")
	public List<Point> getPointList(
			@PathVariable("idx") int idx
			){
		
		return listService.getPointList(idx);
	}
	
	// 회원idx, 텀블러idx를 받아서 포인트 저장
	@GetMapping("/tum/{idx}/{tIdx}")
	public String saveTumPoint(
			@PathVariable("idx") int idx,
			@PathVariable("tIdx") int tIdx){	
		
          //System.out.println(saveService.userTumPoint(tumPoint));
          
		return saveService.userTumPoint(idx, tIdx)==0?"N":"Y";
	}
	
	// 회원idx, 코스idx를 받아서 포인트 저장
	@GetMapping("/course")
	public String saveCoursePoint(
			@RequestParam("idx") int idx,
			@RequestParam("cIdx") int cIdx,
			@RequestParam("distance") float distance
			) {
		 //System.out.println(saveService.userCoursePoint(curPoint));
		return saveService.userCoursePoint(idx, cIdx, distance)==0?"N":"Y";
	}
	
	
	// 회원idx를 받아서 포인트 사용 -> 교환권 발행
	@GetMapping("/use/{idx}/{usepoint}")
	public int useSavedPoint(
			@PathVariable("idx") int idx,
			@PathVariable("usepoint") int usepoint,
			HttpServletRequest request,
			HttpSession session,
			Model model
			) throws UnsupportedEncodingException {
		return usingService.usePoint(idx, usepoint, request, session, model);
	}
	
}
