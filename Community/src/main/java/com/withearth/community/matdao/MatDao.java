package com.withearth.community.matdao;

import java.util.List;

import com.withearth.community.domain.MatzipVo;

public interface MatDao {
	
	// 전체 맛집 리스트
	List<MatzipVo> selectAllMatList();

	int insertMatzip(MatzipVo matzip);
	

	

}
