package com.aia.dona.dao;

import java.util.List;
import java.util.Map;

import com.aia.dona.domain.Post;
import com.aia.dona.domain.PostOnly;

public interface PostDao {
     // 게시물을 저장하는 메서드
	int insertPost(Post post);
     // 게시물 리스트를 가져오는 메서드
	//List<Post> selectPostList();
	// 저장된 게시물의 idx를 반환하는 메서드
	int getDonaIdx();
	// 게시물 하나를 반환하는 메서드
	PostOnly selectPostDetail(int idx);
	// 한 회원의 작성 게시글 리스트를 불러오는 메서드
	List<PostOnly> selectMyPostList(int idx);
	// 게시물 내용을 수정하는 메서드
	int updatePost(PostOnly post);
	// 게시물을 삭제하는 메서드
	int deleteOnePost(int donaIdx);
	// 게시물의 수를 구하는 메서드
	int selectPostCount(Map<String, Object> listMap);
	// 페이지에 따른 게시물리스트를 구하는 메서드
	List<Post> selectPostList(Map<String, Object> listMap);
	// 검색한 게시물 정보를 구하는 메서드
	List<Post> selectSearchPostList(Map<String, Object> listMap);
	// 검색한 게시물의 수를 구하는 메서드
	int selectSearchPostCount(Map<String, Object> listMap);
	
	
	

}
