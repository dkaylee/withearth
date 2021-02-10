package com.withearth.community.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatAddRequest;
import com.withearth.community.matdao.MatDao;

@Service
public class UploadService {

	private MatDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	

	@Transactional
	public int uploadFile(MatAddRequest matRequest, FileVo fileVo, MultipartHttpServletRequest mprequest) {
		
		int result = 0;
		
		List<MultipartFile> mfileList = mprequest.getFiles("file");
		
		if(mfileList != null) {

		for (MultipartFile mf : mfileList) {
				
				//웹 경로
				String uploadPath = "/fileupload/matzip";
				
				//시스템 경로
				String saveDirPath = mprequest.getSession().getServletContext().getRealPath(uploadPath);
									
					// 파일 중복명 처리
					String genId = UUID.randomUUID().toString();
					
					// org파일이름
					String orgFileName = mf.getOriginalFilename();
					
					// 저장되는 파일이름
					String newFileName = orgFileName+"_"+genId;
					
					// 파일크기
					long fileSize = mf.getSize();
					
					System.out.println("orgFilename: "+orgFileName);
					System.out.println("newFilename: "+newFileName);
					System.out.println("fileSize: "+fileSize);
					
					
					// 파일 저장
					try {
						mf.transferTo(new File(saveDirPath));
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					// 데이터 베이스 입력
					dao = template.getMapper(MatDao.class);
					
					dao.fileUpload(orgFileName,newFileName,fileSize);
					
			}
			
			
			
		}
		
		return result;
			
	}
}
