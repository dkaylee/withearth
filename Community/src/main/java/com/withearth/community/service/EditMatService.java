package com.withearth.community.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.dao.MatDao;
import com.withearth.community.domain.MatEditRequest;
import com.withearth.community.domain.MatzipVo;

@Service
public class EditMatService {
	
	
	private MatDao dao;

	@Autowired
	private SqlSessionTemplate template;
	
	
	public MatzipVo getEditMatzip (int matIdx) {
		
		dao = template.getMapper(MatDao.class);
		
		return dao.selectMatByIdx(matIdx);
	}
	
	@Transactional
	public int editMatzip(
			MatEditRequest editReq,
			MultipartHttpServletRequest mprq
			) {
		
		int result = 0;
		
		// 웹경로
		String uploadPath = "/fileupload/matzip/";
		
		// 시스템 실제 경로
		String saveDirPath = mprq.getSession().getServletContext().getRealPath(uploadPath);
		
		File newFile = new File(saveDirPath);
		
		List<MultipartFile> mf = mprq.getFiles("mImg");
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
			
		} else {
			for(int i = 0; i < mf.size(); i++) {
				
				// 파일 중복명 처리위한 uuid
				String uuid = UUID.randomUUID().toString();
				
				// 본래 파일명
				String orgFName = mf.get(i).getOriginalFilename();
				
				// 새로 저장하는 파일명
				String newFName = uuid + "_" + orgFName;
				
				// 파일 사이즈
				long fileSize = mf.get(i).getSize();
				
				// 저장될 파일 경로
				String savePath = saveDirPath + newFName;
				
				System.out.println("orgName : "+orgFName);
				System.out.println("newFName : "+newFName);
				System.out.println("filesize : "+fileSize);
				System.out.println("save path : "+savePath);
				
				
				// 파일 저장
				try {
					
					mf.get(i).transferTo(new File(savePath));
					
					HashMap<String, Object> hm = new HashMap<>();
					hm.put("orgFName", orgFName);
					hm.put("newFName", newFName);
					hm.put("saveDirPath", saveDirPath);
					hm.put("fileSize", fileSize);
					
					System.out.println(hm); 
					
					// 데이터 베이스 입력
					dao = template.getMapper(MatDao.class);
					
					dao.fileUpload(hm);

					
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		

		MatzipVo matzip = editReq.toMatzip();
		
		// 데이터 베이스 입력
		dao = template.getMapper(MatDao.class);
		
		// 맛집 DB insert
		result = dao.updateMatzip(matzip);
		
		
		return result;
		
		
	}
	
}
