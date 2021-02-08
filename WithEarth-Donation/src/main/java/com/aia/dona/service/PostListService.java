package com.aia.dona.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.FileDao;
import com.aia.dona.dao.PostDao;
import com.aia.dona.domain.Post;
import com.aia.dona.domain.PostFile;
import com.aia.dona.domain.PostOnly;

@Service
public class PostListService {
	
	
	private PostDao dao;
	
	private FileDao fDao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 게시물 전체 리스트를 구하는 메서드
	public List<Post> getList() {
		
		dao = template.getMapper(PostDao.class);
				
		return dao.selectPostList();
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