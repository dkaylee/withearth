package com.aia.dona.dao;

import java.util.List;

import com.aia.dona.domain.PostFile;

public interface FileDao {
    // 게시물의 이미지들을 업로드하는 메서드
	int insertFiles(PostFile postFiles);
	// 게시물의 이미지들을 반환하는 메서드
	List<PostFile> selectPostImages(int idx);
	// 게시물의 모든 이미지를 삭제하는 메서드
    int deleteBeforeImage(String beforeImage);
    // 수정한 게시물 이미지를 업데이트하는 메서드
	int insertUpdateFiles(PostFile postFiles);
	// 게시물의 이미지를 삭제하는 메서드
    int deletePostFile(int donaIdx);

}
