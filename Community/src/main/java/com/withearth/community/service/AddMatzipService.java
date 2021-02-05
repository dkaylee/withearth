package com.withearth.community.service;


import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.matdao.MatDao;


@Service
public class AddMatzipService {
	
	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	

	@Transactional
	public int addMatzip(
			MatAddRequest matRequest, 
			MultipartHttpServletRequest request) {
		
		int result = 0;
		
		
		// 파일이 존재하면
		if(matRequest.getmImg() != null && !matRequest.getmImg().isEmpty()) {
			
			//웹 경로
			String uploadPath = "/fileupload/matzip";
			
			//시스템 경로
			String saveDirPath = request.getSession().getServletContext().getRealPath(uploadPath);
								
				// 파일 중복명 처리
				String genId = UUID.randomUUID().toString();
				
				// org파일이름
				String orgFileName = matRequest.getmTitle();
				
				// 저장되는 파일이름
				String newFileName = orgFileName+"."+genId;
									
				// 파일 저장
				MatzipVo matzip = matRequest.toMatzip();
				
				if(orgFileName != null) {
					matzip.setMatImg(newFileName);
				}
				// 데이터 베이스 입력
				dao = template.getMapper(MatDao.class);
				
				// insert
				result = dao.insertMatzip(matzip);
				
			}
			
		
		
		
		return result;
	}
	

}
