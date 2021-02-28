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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aia.dona.dao.FileDao;
import com.aia.dona.dao.PostDao;
import com.aia.dona.domain.Post;
import com.aia.dona.domain.PostEditRequest;
import com.aia.dona.domain.PostFile;
import com.aia.dona.domain.PostOnly;

import net.coobird.thumbnailator.Thumbnailator;

@Service
public class PostEditService {
	
	private PostDao pDao;
	
	private FileDao fDao;

	@Autowired
	private SqlSessionTemplate template;
	
	public int editPost(
			PostEditRequest editRequest,
			HttpServletRequest request,
			Model model) {
									
		MultipartFile[] files = editRequest.getPostImage();
											
		//File newFile = null;
			
		// 시스템 저장경로
		String path = "/fileupload/post";
		// 웹 경로
		String saveDirPath = request.getSession().getServletContext().getRealPath(path);

		String fileName = "";

		String newFileName = "";
						
		// DB에 수정한 게시물 저장
		PostOnly post = editRequest.toPost();   	    
		pDao = template.getMapper(PostDao.class);		
		int result = pDao.updatePost(post);
														
	    fDao = template.getMapper(FileDao.class);
	    
	    // 기존 이미지 삭제처리	
	   if(editRequest.getDeleteImage() != null) {		
		   		
			for(int i=0; i <editRequest.getDeleteImage().length; i++) {		
								
				String[] array = editRequest.getDeleteImage()[i].split(",");
				
				for(int j=0; j<array.length;j++) {
					System.out.println(array[i]);
					// DB 파일 테이블에서 삭제한 파일명과 같은 행 삭제처리
					fDao.deleteBeforeImage(array[i]);
					// 디렉토리에서 삭제
					new File(saveDirPath, array[i]).delete();
					new File(saveDirPath, "s_"+array[i]).delete();					
				}								
			}	
	   }	
	    if(editRequest.getPostImage() != null) {	
		// 파일 배열에서 꺼내서 경로에 저장하기
		for (MultipartFile mp : files) {				

			fileName = mp.getOriginalFilename(); // 파일 이름
			
			System.out.println(fileName);						

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
			postFiles.setDonaIdx(editRequest.getDonaIdx());
			
			fDao.insertUpdateFiles(postFiles);
											
	    }
		} 
				
		
		return result;
   
   }
	
}
