package com.withearth.community.dao;

import java.util.List;
import java.util.Map;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatzipVo;
import com.withearth.community.domain.StarRateRequest;

public interface MatDao {
	
	// 전체 맛집 리스트
	List<MatzipVo> selectAllMatList();
	
	// 맛집 추가
	int insertMatzip(MatzipVo matzip);

	// 전체 맛집 수
	int matTotalCnt();
	
	// 맛집 수 업데이트
	int matUpdateCnt();
	
	// 검색한 회원의 수
	int selectSearchMatzipCount(Map<String, Object> listMap);
	
	// 리스트에 맞는 맛집 검색
	List<MatzipVo> selectMatList(Map<String, Object> param);
	
	// 게시물 조회 - 디테일뷰 
	MatzipVo selectMatByIdx(int matIdx);
		
	// 게시물 삭제
	int deleteMatzipByIdx(int matIdx);

	// 게시물 수정
	int updateMatzip(MatzipVo matzip);
	
	// 회원이쓴 게시물 조회
	List<MatzipVo> selectMatPostByIdx(int idx);
	
	// 회원이쓴 게시물 삭제
	int deleteMatpostByIdx(int idx);
	
	//------------file upload------------
	
	// 파일 업로드
	// void fileUpload(Map<String, Object> map) throws Exception;
	int fileUpload(FileVo file);
	    
	// 파일 삭제
	int fileDelete(int matIdx);
	
	// 파일 수정
	int updateFile(FileVo file) ;
	
	// 파일 조회
	List<FileVo> selectFileList(int matIdx);

	//----------star Review--------------
	
	// 리뷰 insert
	int insertReview(StarRateRequest starRequest);

	List<StarRateRequest> selectReview(int matIdx);





}
