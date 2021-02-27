package com.withearth.tumbler.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.withearth.tumbler.domain.Point;
import com.withearth.tumbler.domain.Tumbler;

@Repository
@Mapper
public interface TumblerDao {

	//로그인
	Tumbler selectTumLogin(String id, String pw);

	//회원의 텀블러 포인트 적립 내역 (테스트 )
	List<Tumbler> selelctTumList(int idx);

	//텀블러 이용 내역
	int insertTumbler(Tumbler tumbler);
	
	//텀블러 포인트 적립
	int insertPoint(Point point);

	// 전체 게시글 개수
	int selectTotalCount();

	//적립 리스트(페이지 번호에 맞는)
	List<Tumbler> selectTumpointList(int startRow, int cntPerPage);

	

	

	
}
