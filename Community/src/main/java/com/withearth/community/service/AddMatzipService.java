package com.withearth.community.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.domain.MatzipVo;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Service
@Log4j
public class AddMatzipService {
	
	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 파일업로드
	@Transactional
	public int addMatzip(
			MatAddRequest matRequest,
			MultipartHttpServletRequest mprq) {
		
		int result = 0;
		
		File newFile = null;
		String newFName = null;
		
		// 넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mprq.getFiles("mImg");
		
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			for(int i = 0; i < mf.size(); i++) {
				
				// 웹경로
				String uploadPath = "/fileupload/matzip/";
				
				// 시스템 실제 경로
				String saveDirPath = mprq.getSession().getServletContext().getRealPath(uploadPath);
				
				System.out.println("!!!!!!!!!!!!!!!!!!!!"+saveDirPath);
				
				// 파일 중복명 처리위한 uuid
				String uuid = UUID.randomUUID().toString();
				
				// 본래 파일명
				String orgFName = mf.get(i).getOriginalFilename();
				
				// 새로 저장하는 파일명
				newFName = uuid + "_" + orgFName;
				
				// 파일 사이즈
				long fileSize = mf.get(i).getSize();
				
				// 저장될 파일 경로
				newFile = new File(saveDirPath, newFName);

				System.out.println("orgName : "+orgFName);
				System.out.println("newFName : "+newFName);
				System.out.println("filesize : "+fileSize);
				
//				try {
//					
//					mf.get(i).transferTo(newFile);
//					
//				} catch (IllegalStateException | IOException e1) {
//					// TODO Auto-generated catch block
//					e1.printStackTrace();
//				}
//				
//				 HashMap<String, Object> hm = new HashMap<>();
//				 hm.put("orgFName ", orgFName);
//				 hm.put("newFName ", newFName);
//				 hm.put("fileSize ", fileSize);
//				 
//				 System.out.println("file hashmap : " + hm); 
//				 
//				 dao = template.getMapper(MatDao.class);
//				 dao.fileUpload(hm);
				 

				// 파일 저장 응답값
					try {
						
						FileOutputStream thumnail = new FileOutputStream(new File(saveDirPath, "s_"+ newFName));
						
						// 썸네일 저장 100X100
						Thumbnailator.createThumbnail(
								mf.get(i).getInputStream(), 
								thumnail, 
								50, 50);
						
						thumnail.close();
						
						;

						
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					HashMap<String, Object> hm = new HashMap<>();
					 hm.put("orgName ", orgFName);
					 hm.put("newName ", newFName);
					 hm.put("fileSize ", fileSize);
					 
					 System.out.println("file hashmap : " + hm); 
					 
					 
					 dao = template.getMapper(MatDao.class);
					 dao.fileUpload(hm);
					
			}
		}
		
		
		MatzipVo matzip = matRequest.toMatzip();
		
		// 데이터 베이스 입력
		dao = template.getMapper(MatDao.class);
		
		// 게시물 카운트
		dao.matUpdateCnt();
		
		// 맛집 DB insert
		result = dao.insertMatzip(matzip);
		
		
		
		return result;
	}

	

}
