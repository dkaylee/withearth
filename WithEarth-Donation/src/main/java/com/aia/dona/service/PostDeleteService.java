package com.aia.dona.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aia.dona.dao.FileDao;
import com.aia.dona.dao.PostDao;

@Service
public class PostDeleteService {
	
	private PostDao pDao;
	
	private FileDao fDao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int postDelete(int donaIdx) {
		
		pDao = template.getMapper(PostDao.class);
		
		fDao = template.getMapper(FileDao.class);
		
		fDao.deletePostFile(donaIdx);
		
		int result = pDao.deleteOnePost(donaIdx);
		
		
		
		return result;
	}
	

}
