package com.withearth.community.matdao;

import java.util.List;
import java.util.Map;

import com.withearth.community.domain.MatzipVo;

public interface MatDao {
	
	// 전체 맛집 리스트
	List<MatzipVo> selectAllMatList();
	
	// 맛집 추가
	int insertMatzip(MatzipVo matzip);

	// 전체 맛집 수
	int matTotalCnt();
	
	// 맛집 수 업데이트
	void matUpdateCnt();

	void fileUpload(String orgFileName, String newFileName, long fileSize);
	
	
	

	

}
