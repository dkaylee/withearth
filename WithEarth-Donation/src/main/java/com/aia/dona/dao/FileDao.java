package com.aia.dona.dao;

import java.util.List;

import com.aia.dona.domain.PostFile;

public interface FileDao {
    // 게시물의 이미지들을 업로드하는 메서드
	int insertFiles(PostFile postFiles);

	// 게시물의 이미지들을 반환하는 메서드
	List<PostFile> selectPostImages(int idx);

}
