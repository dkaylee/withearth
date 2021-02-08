package com.withearth.tumbler.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.withearth.tumbler.domain.Member;
import com.withearth.tumbler.domain.Point;
import com.withearth.tumbler.domain.Tumbler;

@Repository
@Mapper
public interface TumblerDao {



	//로그인
	Tumbler selectTumLogin(String id, String pw);

	
	//적립 포인트
	int updateTumPoint(int idx);


	//회원의 텀블러 포인트 적립 내역 

	List<Tumbler> selelctTumList(int idx);


	int insertTumbler(Tumbler tumbler);
	int insertPoint(Point point);
	
}
