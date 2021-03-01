package com.aia.dona.dao;

import com.aia.dona.domain.Heart;

public interface HeartDao {
    // 좋아요 눌렀는지 안눌렀는지 확인하는 메서드
	int checkDuplication(int idx, int donaIdx);
    // 좋아요 등록하는 메서드
	int insertHeart(Heart h);
    // 좋아요 삭제하는 메서드
	int deleteHeart(Heart h);
	// 회원의 좋아요 개수 반환 메서드
	int selectUserHeartCnt(Heart h);
	// 게시물 idx를 받아 좋아요 총 개수를 반환하는 메서드
	int selectAllHeartCnt(int donaIdx);

    
   

}
