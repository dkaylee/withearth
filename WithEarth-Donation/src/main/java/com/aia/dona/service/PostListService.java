package com.aia.dona.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.FileDao;
import com.aia.dona.dao.HeartDao;
import com.aia.dona.dao.PostDao;
import com.aia.dona.domain.Post;
import com.aia.dona.domain.PostFile;
import com.aia.dona.domain.PostListView;
import com.aia.dona.domain.PostOnly;
import com.aia.dona.domain.SearchParam;

@Service
public class PostListService {
		
	private PostDao dao;
	
	private FileDao fDao;
	
	private HeartDao hDao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 게시물 전체 리스트를 구하는 메서드
	public PostListView getList(int page) {		
		
		PostListView listView = null;
		
		try {			
			
		dao = template.getMapper(PostDao.class);
		
		System.out.println("pageNumber :" + page);

		int cntPerPage = 12;

		int startRow = (page - 1) * cntPerPage;
		int endRow = startRow + cntPerPage - 1;

		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("startRow", startRow );
		listMap.put("cntPerPage", cntPerPage);
		//listMap.put("searchParam", page);
		
		int totalPostCount = dao.selectPostCount(listMap);
						
		List<Post> postList = dao.selectPostList(listMap);
		System.out.println("PostList :"+ postList);
		
		listView = new PostListView(page, totalPostCount, cntPerPage, postList, startRow, endRow);
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listView;
	}
	
	  // 검색한 게시물 리스트를 구하는 메서드
		public PostListView getSearchList(int page, String searchType, String keyword) {		
			
			PostListView listView = null;
			
			try {			
				
			dao = template.getMapper(PostDao.class);
			
			System.out.println("pageNumber :" + page);

			int cntPerPage = 12;

			int startRow = (page - 1) * cntPerPage;
			int endRow = startRow + cntPerPage - 1;

			Map<String, Object> listMap = new HashMap<String, Object>();
			listMap.put("startRow", startRow );
			listMap.put("cntPerPage", cntPerPage);
			listMap.put("searchType", searchType);
			listMap.put("keyword", keyword);
			
			int totalPostCount = dao.selectSearchPostCount(listMap);
							
			List<Post> postList = dao.selectSearchPostList(listMap);
			System.out.println("PostList :"+ postList);
			
			listView = new PostListView(page, totalPostCount, cntPerPage, postList, startRow, endRow);
					
			} catch(Exception e) {
				e.printStackTrace();
			}
			return listView;
		}

	// 한개의 게시물을 구하는 메서드
	public PostOnly getDetail(int idx) {
		
		dao = template.getMapper(PostDao.class);
			
		return dao.selectPostDetail(idx);
	}
	
	// 게시물의 이미지들을 불러오는 메서드
	public List<PostFile> getDetailImages(int idx) {
		
	    fDao = template.getMapper(FileDao.class);
		
	  return fDao.selectPostImages(idx);		
	}

}