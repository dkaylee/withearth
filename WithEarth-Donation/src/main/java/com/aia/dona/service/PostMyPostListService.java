package com.aia.dona.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.PostDao;
import com.aia.dona.domain.PostOnly;

@Service
public class PostMyPostListService {
	
	private PostDao dao;
	
	@Autowired
	private SqlSessionTemplate template;

	
	public List<PostOnly> getMyPostList(int idx){
		
		dao = template.getMapper(PostDao.class);
		
		return dao.selectMyPostList(idx);
	}
}
