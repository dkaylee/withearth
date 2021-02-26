package com.aia.dona.controlller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.aia.dona.domain.PostEditRequest;
import com.aia.dona.domain.PostFile;
import com.aia.dona.domain.PostListView;
import com.aia.dona.domain.PostOnly;
import com.aia.dona.domain.RequestPost;
import com.aia.dona.domain.SearchParam;
import com.aia.dona.service.PostDeleteService;
import com.aia.dona.service.PostEditService;
import com.aia.dona.service.PostListService;
import com.aia.dona.service.PostMyPostListService;
import com.aia.dona.service.PostUploadService;
import com.aia.dona.service.RedisService;


@RestController
@RequestMapping("/rest/user/post")
@CrossOrigin
public class PostController {
	
	@Autowired
	private PostUploadService uploadService;
	@Autowired
	private PostListService listService;
	@Autowired
	private PostMyPostListService myPostService;
	@Autowired
	private PostEditService editService;
	@Autowired
	private PostDeleteService deleteService;
	@Autowired
	private RedisService redis;
	
	
	@GetMapping("/session/{session}")
	public String getSession(
			@PathVariable("session") String sessionid) {
	
		System.out.println("redis :"+sessionid);
		//redis.getUserInformation(sessionid);
		System.out.println(redis.getUserInformation(sessionid));		
		return sessionid;
	}
	
	// 게시물을 업로드
	@PostMapping("/upload")
	@ResponseBody
	public int uploadPost(
			RequestPost requestPost,
			HttpServletRequest request,
			Model model) {			
								
		return uploadService.upload(requestPost, request, model);
	}
	
	// 게시물 리스트 출력
	@GetMapping("/list")
	public PostListView getPostList(	
			@RequestParam(value="p", defaultValue = "1") int page			
		      ) {
								
		return listService.getList(page);
	};
	
	// 검색한 게시물 출력
	@GetMapping("/list/search")
	public PostListView getSearchList(	
			@RequestParam(value="p", defaultValue = "1") int page,
			@RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword
		      ) {
	   System.out.println(page+" : "+searchType+" : "+ keyword);		
		return listService.getSearchList(page, searchType, keyword);
	};
		
	// 게시물 하나 출력
	@GetMapping("/detail")
	public PostOnly getPostDetail(
			@RequestParam("idx") int donaIdx
			//@PathVariable("idx") int donaIdx
			) {
		
		return listService.getDetail(donaIdx) ;
	}
	
	// 게시물의 이미지 출력
	@GetMapping("/detail/image")
	public List<PostFile> getPostDetailImages(
			@RequestParam("idx") int donaIdx
			//@PathVariable("idx") int donaIdx
			) {
		
		return listService.getDetailImages(donaIdx);
	}
	
	@GetMapping("/mypost")
	// 수정을 위해 회원idx를 받아 게시물 출력
	public List<PostOnly> getUserPost(
			@RequestParam("idx") int idx
			){
				
		return myPostService.getMyPostList(idx);
	}
	
	// 수정한 게시물 업데이트
	@PostMapping("/edit")
	@ResponseBody
	public int updatePost(
			PostEditRequest editRequest,
			HttpServletRequest request,
			Model model
			) {		
			
		return editService.editPost(editRequest, request, model);
	}
	
	@GetMapping("/delete")
	public int deletePost(
			@RequestParam("idx") int donaIdx) {
		
		return deleteService.postDelete(donaIdx);
	}

}