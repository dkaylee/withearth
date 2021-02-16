package com.withearth.community.dao;

import java.util.List;
import java.util.Map;

import com.withearth.community.domain.FileVo;
import com.withearth.community.domain.MatzipVo;

public interface MatDao {
	
	// 전체 맛집 리스트
	List<MatzipVo> selectAllMatList();
	
	// 맛집 추가
	int insertMatzip(MatzipVo matzip);

	// 전체 맛집 수
	int matTotalCnt();
	
	// 맛집 수 업데이트
	int matUpdateCnt();
	
	// 총 맛집수 조회
	int selectSearchMatzipCount(Map<String, Object> listMap);
	
	// 맛집 검색
	List<MatzipVo> selectMatList(Map<String, Object> param);
	
	// 파일 업로드
//	void fileUpload(Map<String, Object> map) throws Exception;
	int fileUpload(FileVo file);
	
	// 파일 삭제
	int fileDelete(String newFName);
	
	// 파일 리스트 게시물 번호로 찾기
	public List<FileVo> findByMatId(MatzipVo matIdx);

	// 게시물 조회 - 디테일뷰 
	MatzipVo selectMatByIdx(int matIdx);
	
	// 파일 조회
//	List<Map<String, Object>> selectFileList(int matIdx) throws Exception;
	
	
	

	

}
