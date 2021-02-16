package com.withearth.community.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class AddFileService {
	
	private MatDao dao;
	
	private MatzipVo matzip;
	
	private MatAddRequest matRequest;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Transactional
	public List<FileVo> uploadFiles(MultipartHttpServletRequest mprq) {
		
		List<FileVo> files = new ArrayList<>();
		
		// 웹경로
		String path = "/fileupload/matzip";
		
		// 시스템 실제 경로
		String savePath = mprq.getSession().getServletContext().getRealPath(path);
		
		List<MultipartFile> fileList = mprq.getFiles(savePath);
		
		for(MultipartFile mf : fileList) {
			
			FileVo fileVo = new FileVo();
			
			String orgFName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			
			String newFName = UUID.randomUUID()+"_"+System.currentTimeMillis();
			
			System.out.println("org file name:"+orgFName);
			System.out.println("file size:"+fileSize);
			
			try {
				File saveFile = new File(savePath, newFName);
				
				mf.transferTo(saveFile);
				
				fileVo.setOrgFName(orgFName);
				fileVo.setNewFName(newFName);
				fileVo.setFileSize(fileSize);
				
				// 이미지 파일 체크
				if(saveFile != null) {
					FileOutputStream thumbnail = new FileOutputStream(new File(savePath,"s_"+newFName));
					
					Thumbnailator.createThumbnail(mf.getInputStream(),thumbnail,350,350);
					thumbnail.close();
				}
				
				// add to List
				files.add(fileVo);
				
				matRequest.setmImg(newFName);
				
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			// 데이터 베이스 입력
			dao = template.getMapper(MatDao.class);
			
			// 파일에 입력
			dao.fileUpload(fileVo);
			
			files = dao.findByMatId(matzip);
				
		}
		
		
		return files;
		
	}
	

}
