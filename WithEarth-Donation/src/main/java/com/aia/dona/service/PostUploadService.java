package com.aia.dona.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.aia.dona.dao.FileDao;
import com.aia.dona.dao.PostDao;
import com.aia.dona.domain.Post;
import com.aia.dona.domain.PostFile;
import com.aia.dona.domain.RequestPost;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class PostUploadService {

	private PostDao dao;

	private FileDao fDao;

	@Autowired
	private SqlSessionTemplate template;

	public int upload(RequestPost requestPost, HttpServletRequest request, Model model) {

		MultipartFile[] files = requestPost.getPostImage();
		
		for(int i=0;i<files.length;i++) {
			System.out.println(files[i]);
		}

		//File newFile = null;
			
		// 시스템 저장경로
		String path = "/fileupload/post";
		// 웹 경로
		String saveDirPath = request.getSession().getServletContext().getRealPath(path);

		String fileName = "";

		String newFileName = "";
		
		// DB에 이미지 이름 저장
		Post post = requestPost.toPost();   
	    
		dao = template.getMapper(PostDao.class);
		
		int result = dao.insertPost(post);
		
		// 속성에 저장 -> 나중에 확인해서 출력
		model.addAttribute("result", result);
		
		int donaIdx = dao.getDonaIdx();
			

		// 파일 배열에서 꺼내서 경로에 저장하기
		for (MultipartFile mp : files) {

			fileName = mp.getOriginalFilename(); // 파일 이름
						
			//System.out.println("fileName : " + fileName);

			newFileName = System.currentTimeMillis() + fileName;
			

			try {
                // 디렉토리에 저장
				mp.transferTo(new File(saveDirPath, newFileName));

				 FileOutputStream thumbnail = new FileOutputStream(new File(saveDirPath, "s_"
				 + newFileName));

				// 썸네일 저장				 
				 Thumbnailator.createThumbnail(mp.getInputStream(), thumbnail, 100, 100);

				 thumbnail.close();

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
					
			// 파일명과 게시물Idx DB에 저장
			PostFile postFiles = new PostFile();
			postFiles.setFileName(newFileName);
			postFiles.setDonaIdx(donaIdx);
		
			fDao = template.getMapper(FileDao.class);

			fDao.insertFiles(postFiles);
			
						
		}		

		return result;
	}

}